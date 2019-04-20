import multiprocessing
import sys
import os
from datetime import datetime
from watchdog.observers import Observer
from filemonitor import FileEventHandler
from slips.core.database import __database__
import configparser
import time
import json

# Input Process
class InputProcess(multiprocessing.Process):
    """ A class process to run the process of the flows """
    def __init__(self, inputqueue, outputqueue, profilerqueue, input_type, input_information, config):
        multiprocessing.Process.__init__(self)
        self.inputqueue = inputqueue
        self.outputqueue = outputqueue
        self.profilerqueue = profilerqueue
        self.config = config
        self.input_type = input_type
        self.input_information = input_information
        self.zeek_folder = './zeek_files'
        self.name = 'input'

    def print(self, text, verbose=1, debug=0):
        """ 
        Function to use to print text using the outputqueue of slips.
        Slips then decides how, when and where to print this text by taking all the prcocesses into account

        Input
         verbose: is the minimum verbosity level required for this text to be printed
         debug: is the minimum debugging level required for this text to be printed
         text: text to print. Can include format like 'Test {}'.format('here')
        
        If not specified, the minimum verbosity level required is 1, and the minimum debugging level is 0
        """

        vd_text = str(int(verbose) * 10 + int(debug))
        self.outputqueue.put(vd_text + '|' + self.name + '|[' + self.name + '] ' + str(text))

    def run(self):
        try:
            # Process the file that was given
            lines = 0
            if self.input_type == 'file':
                if not self.input_information:
                    # By default read the stdin
                    sys.stdin.close()
                    sys.stdin = os.fdopen(0, 'r')
                    file_stream = sys.stdin

                # If we were given a filename, manage the input from a file instead
                elif self.input_information:
                    file_stream = open(self.input_information)

                for line in file_stream:
                    self.outputqueue.put("03|input|[In]      > Sent Line: {}".format(line.replace('\n','')))
                    self.profilerqueue.put(line)
                    lines += 1

                self.profilerqueue.put("stop")
                self.outputqueue.put("01|input|[In] No more input. Stopping input process. Sent {} lines ({}).".format(lines, datetime.now().strftime('%Y-%m-%d--%H:%M:%S')))

                self.outputqueue.close()
                self.profilerqueue.close()

                return True
            # Process the pcap files
            elif self.input_type == 'pcap':
                # Now start the observer of new files. We need the observer because Zeek does not create all the files
                # at once, but when the traffic appears. That means that we need
                # some process to tell us which files to read in real time when they appear
                # Get the fileeventhandler
                self.event_handler = FileEventHandler()
                # Create an observer
                self.event_observer = Observer()
                # Schedule the observer with the callback on the file handler
                self.event_observer.schedule( self.event_handler, self.zeek_folder, recursive=True)
                # Start the observer
                self.event_observer.start()

                # Find if the pcap file name was absolute or relative
                if self.input_information[0] == '/':
                    prefix = ''
                else:
                    prefix = '../'
                # First clear the zeek folder of old .log files
                command = "rm " + self.zeek_folder + "/*.log"
                os.system(command)
                # Run zeek on the pcap. The redef is to hav json files
                command = "cd " + self.zeek_folder + "; bro -C -r " + prefix + self.input_information + " local -e 'redef LogAscii::use_json=T;' &"
                os.system(command)
                # Give Zeek some time to generate at least 1 file.
                time.sleep(3)

                # Get the zeek files in the folder now
                zeek_files = __database__.get_all_zeek_file()
                open_file_handlers = {}
                time_last_lines = {}
                cache_lines = {}
                while zeek_files:
                    for filename in zeek_files:
                        # Update which files we know about
                        try:
                            file_handler = open_file_handlers[filename]
                            # We already opened this file
                            #self.print('Old File {}'.format(filename))
                        except KeyError:
                            # First time we opened this file
                            # Ignore the files that do not contain data
                            if 'capture_loss' in filename or 'loaded_scripts' in filename or 'packet_filter' in filename or 'stats' in filename or 'weird' in filename or 'reporter' in filename:
                                continue
                            file_handler = open(filename + '.log', 'r')
                            open_file_handlers[filename] = file_handler
                            #self.print('New File {}'.format(filename))
                        json_line = file_handler.readline()
                        # Did the file ended?
                        if not json_line:
                            # We reached the end of this file. Remove it from the list of files to check
                            __database__.del_zeek_file(filename)
                            #del time_last_lines[filename]
                            #cache_lines.remove(filename)
                            #self.print('Closing {}'.format(filename))
                            continue
                        #self.print('Pre dejson line from file {}. {}'.format(filename, json_line))

                        # Convert from json to dict
                        line = json.loads(json_line)
                        timestamp = line['ts']
                        time_last_lines[filename] = timestamp
                        #self.print('File {}. TS: {}'.format(filename, timestamp))
                        # Store the line in the cache
                        #self.print('Adding cache and time of {}'.format(filename))
                        cache_lines[filename] = line

                    # Out of the for
                    #self.print('Out of the for.')
                    #self.print('Cached lines: {}'.format(str(cache_lines)))
                    #self.print('Cached times: {}'.format(str(time_last_lines)))
                    # Now read lines in order. The line with the smallest timestamp first
                    sorted_time_last_lines = sorted(time_last_lines, key=time_last_lines.get)
                    #self.print('Sorted times: {}'.format(str(sorted_time_last_lines)))
                    try:
                        key = sorted_time_last_lines[0]
                    except IndexError:
                        # No more sorted keys. Get out of the while
                        break
                    line_to_send = cache_lines[key]
                    self.print('Line to send from file {}. {}'.format(key, line_to_send))
                    # SENT
                    # Count the read lines
                    lines += 1
                    # Delete this line from the cache and the time list
                    #self.print('Deleting cache and time of {}'.format(key))
                    del cache_lines[key]
                    del time_last_lines[key]
                            
                    # Get the new list of files
                    zeek_files = __database__.get_all_zeek_file()

                # No more files to read
                self.print("No more input. Stopping input process. Sent {} lines".format(lines))
                return True

        except KeyboardInterrupt:
            self.outputqueue.put("04|input|[In] No more input. Stopping input process. Sent {} lines".format(lines))
            try:
                self.event_observer.stop()
                self.event_observer.join()
            except NameError:
                pass
            return True
        except Exception as inst:
            self.outputqueue.put("04|input|[In] No more input. Stopping input process. Sent {} lines".format(lines))
            self.outputqueue.put("01|input|Problem with Input Process.")
            self.outputqueue.put("01|input|" + type(inst))

            self.outputqueue.put("01|input|" + inst.args)
            self.outputqueue.put("01|input|" + inst)
            sys.exit(1)
