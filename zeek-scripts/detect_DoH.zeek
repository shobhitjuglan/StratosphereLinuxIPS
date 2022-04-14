##! Detect DoH servers and add timeout sso the connection wont take too long

module DoH;

export {

        ## DoH servers
        option port_inactivity_timeouts: table[port] of interval = {
                [[21/tcp, 22/tcp, 23/tcp, 513/tcp]] = 1 hrs,
        };
        option doh_ips: set[addr] = { 64.20.34.50, 114.34.116.139, 54.155.209.93, 195.238.187.150, 139.59.223.113, 95.211.44.91, 139.199.33.37, 45.90.29.229, 92.63.170.105, 213.183.62.11, 188.172.251.1, 45.90.29.196, 45.90.30.132, 45.90.28.93, 45.90.28.49, 80.124.140.163, 140.207.198.6, 80.124.140.231, 217.66.37.27, 17.253.36.85, 196.20.72.29, 104.225.11.200, 45.90.30.161, 54.69.221.253, 185.43.135.1, 52.17.180.181, 45.90.30.10, 17.253.26.85, 23.94.120.177, 17.253.84.247, 160.119.253.209, 74.82.42.42, 80.125.181.174, 140.82.59.231, 34.72.159.240, 45.90.28.8, 45.90.30.215, 203.162.172.59, 45.90.29.0, 159.69.108.26, 109.24.72.34, 152.67.229.20, 83.69.169.69, 94.130.182.199, 168.235.64.166, 149.28.161.146, 45.90.28.208, 45.32.47.13, 45.90.28.82, 203.180.146.24, 210.128.97.74, 130.89.162.82, 67.8.56.46, 109.24.70.47, 51.79.173.140, 121.196.195.196, 202.232.2.33, 80.125.180.155, 45.90.28.198, 45.90.28.76, 178.18.54.141, 210.130.0.70, 192.73.240.126, 80.124.140.166, 194.50.94.140, 185.12.88.92, 80.125.181.179, 45.90.30.9, 45.76.106.139, 128.139.197.53, 45.90.28.226, 45.90.28.84, 213.61.254.42, 92.63.32.3, 209.177.158.15, 17.253.12.215, 80.125.181.183, 45.125.0.88, 46.101.126.246, 89.17.159.213, 210.128.97.88, 45.90.30.15, 80.254.77.39, 45.90.30.190, 17.253.82.213, 39.103.26.198, 37.252.225.79, 95.216.161.62, 45.90.29.197, 45.90.28.243, 81.7.14.83, 180.163.223.236, 45.90.28.141, 8.39.235.108, 45.90.28.220, 204.15.75.156, 45.90.29.119, 17.253.24.213, 80.125.161.117, 17.253.124.247, 52.34.132.225, 34.96.142.40, 45.90.30.78, 162.250.7.137, 45.77.137.133, 45.90.29.191, 45.90.30.189, 45.90.30.174, 106.11.37.109, 173.212.232.112, 52.31.171.166, 45.151.175.112, 45.90.30.18, 45.90.28.68, 47.103.166.50, 47.103.166.56, 45.90.28.224, 45.90.28.120, 45.35.154.2, 45.90.30.120, 8.8.4.4, 45.90.29.211, 45.90.28.235, 45.125.0.53, 45.90.28.59, 210.128.97.217, 45.90.30.113, 119.147.179.244, 45.90.30.245, 152.67.199.120, 104.225.11.199, 217.146.107.8, 107.174.206.189, 62.12.117.34, 203.180.146.13, 45.90.28.207, 116.63.136.113, 45.90.29.193, 184.31.0.235, 45.90.28.164, 45.90.30.6, 45.90.30.191, 39.98.133.171, 101.198.198.198, 209.177.158.226, 45.90.28.122, 80.124.140.206, 116.202.103.81, 45.90.29.223, 47.108.130.22, 140.238.3.36, 45.90.29.169, 208.111.39.77, 45.90.30.123, 147.230.16.240, 210.128.97.204, 135.181.102.167, 80.124.140.240, 45.90.29.105, 213.61.254.36, 45.90.29.148, 80.254.79.157, 45.90.29.75, 149.112.121.30, 45.90.30.188, 80.125.161.177, 45.90.29.103, 45.90.30.192, 45.90.30.146, 168.235.81.167, 51.81.224.232, 88.215.65.27, 45.90.30.129, 45.90.29.118, 194.191.40.98, 45.90.29.106, 217.146.11.49, 44.234.219.208, 45.90.28.160, 52.18.44.241, 45.90.28.212, 159.100.248.193, 203.180.146.203, 45.90.30.96, 45.90.30.124, 3.232.78.158, 52.49.195.5, 45.90.28.148, 202.232.2.31, 69.70.16.42, 45.90.30.8, 3.224.109.152, 51.222.107.153, 45.90.29.129, 80.124.140.157, 34.101.84.129, 52.43.41.34, 93.115.24.205, 45.90.29.245, 193.106.119.10, 45.90.30.221, 45.90.28.132, 54.171.175.41, 143.244.33.74, 210.128.97.78, 45.90.28.118, 195.228.221.132, 45.90.28.149, 142.93.33.36, 64.64.248.141, 168.95.1.1, 45.90.30.173, 170.176.145.150, 51.140.100.181, 45.90.28.67, 44.229.182.61, 63.116.30.36, 180.163.223.233, 185.185.69.93, 1.0.0.2, 45.90.29.177, 34.73.73.224, 45.90.30.19, 192.109.42.42, 128.199.94.194, 80.125.180.156, 194.204.251.11, 54.194.121.142, 107.182.22.203, 45.90.28.37, 45.90.29.86, 216.98.99.110, 131.100.2.149, 17.253.24.247, 80.125.161.86, 39.100.20.1, 45.90.29.128, 45.90.29.209, 45.90.30.65, 195.228.221.3, 45.90.28.88, 176.223.136.169, 54.95.198.208, 45.90.29.14, 210.130.0.1, 210.130.0.53, 45.90.28.45, 121.199.79.161, 134.102.20.20, 199.38.182.12, 45.90.29.225, 54.169.113.231, 178.32.196.195, 172.83.159.59, 194.62.167.148, 45.90.28.223, 172.107.93.122, 213.183.62.162, 195.161.115.16, 210.138.123.76, 5.34.180.247, 89.187.169.24, 82.165.97.135, 165.232.130.184, 119.3.218.92, 217.160.25.182, 45.90.28.70, 80.124.140.233, 45.90.28.75, 17.253.82.119, 140.238.220.58, 210.130.0.21, 45.77.229.157, 159.203.35.192, 140.238.215.120, 185.12.88.179, 217.0.43.50, 210.128.97.76, 45.132.75.16, 209.208.26.145, 45.90.30.44, 45.90.30.141, 223.5.5.5, 140.238.228.220, 180.163.249.75, 80.124.140.168, 45.90.28.182, 207.154.225.150, 37.120.149.148, 199.38.182.187, 109.2.202.236, 45.90.29.251, 106.11.37.100, 5.1.32.213, 80.124.140.144, 45.90.28.14, 210.130.1.3, 45.90.30.166, 8.131.52.117, 44.238.109.133, 45.90.28.246, 44.233.140.212, 194.204.251.13, 20.42.80.49, 212.26.128.3, 45.90.28.181, 173.243.64.102, 213.61.254.41, 45.90.30.138, 116.203.115.225, 45.90.29.36, 161.210.250.2, 45.90.29.17, 68.183.70.223, 45.90.29.23, 31.187.64.235, 45.90.29.123, 194.191.40.97, 78.142.193.36, 45.90.30.198, 24.134.187.45, 49.229.0.46, 52.31.191.149, 45.90.28.154, 193.9.112.136, 45.90.28.71, 3.7.176.123, 155.138.142.93, 45.90.29.25, 104.225.11.36, 45.90.29.12, 194.100.93.136, 103.219.152.6, 83.69.169.222, 193.191.129.46, 45.90.29.171, 185.183.159.34, 86.0.64.55, 206.189.185.210, 45.90.28.159, 158.101.195.71, 161.35.28.190, 45.90.28.95, 45.90.30.5, 45.90.28.167, 45.90.29.155, 45.90.30.157, 216.230.232.29, 37.235.49.73, 45.90.28.57, 45.90.29.234, 217.31.204.205, 45.90.30.12, 167.179.64.116, 45.90.29.179, 173.199.126.35, 185.233.104.206, 80.125.181.186, 45.90.29.99, 75.75.77.24, 45.90.29.8, 119.28.59.205, 54.172.110.180, 104.225.11.172, 23.100.95.102, 200.25.36.70, 82.118.227.235, 80.125.180.65, 45.90.30.46, 34.66.70.56, 45.90.28.239, 140.238.159.230, 34.197.6.94, 168.119.160.80, 17.253.96.85, 45.90.30.177, 8.208.2.64, 80.251.225.218, 45.90.29.33, 67.230.177.135, 176.31.83.186, 104.225.11.245, 80.124.140.201, 81.7.14.191, 45.90.28.201, 45.90.28.96, 45.77.162.235, 185.56.27.1, 77.223.128.220, 176.126.70.229, 195.50.204.191, 36.99.170.86, 45.90.30.169, 82.148.223.195, 80.125.161.67, 17.253.12.247, 185.88.160.25, 80.125.180.165, 104.225.12.24, 45.90.28.199, 104.198.99.225, 139.99.134.6, 212.227.205.78, 52.19.206.74, 45.117.103.234, 170.39.227.247, 208.111.35.106, 82.165.167.96, 47.108.0.58, 80.149.229.107, 45.90.28.101, 52.16.163.185, 45.90.30.7, 155.138.148.63, 149.112.112.12, 140.82.45.97, 213.139.211.36, 193.191.129.45, 103.196.38.40, 45.90.30.158, 70.113.111.13, 103.6.212.123, 45.90.28.12, 80.251.201.59, 45.90.30.222, 191.209.16.235, 134.102.20.26, 203.180.146.208, 109.24.72.14, 157.245.36.211, 45.90.30.84, 45.90.29.125, 31.216.14.41, 193.170.194.22, 87.98.175.85, 185.21.100.14, 45.90.30.99, 35.229.69.83, 176.58.90.11, 109.24.70.11, 45.90.30.232, 45.90.30.147, 9.9.9.11, 3.209.17.34, 116.202.244.138, 45.90.28.106, 45.90.30.11, 47.108.0.39, 185.235.81.1, 149.112.112.10, 221.181.72.233, 193.150.121.28, 74.63.24.248, 45.77.223.173, 80.124.140.164, 45.90.29.120, 217.0.43.66, 89.233.43.71, 45.131.68.246, 45.90.29.114, 109.24.72.11, 45.90.29.217, 210.138.123.109, 80.125.180.95, 119.28.63.83, 45.90.30.77, 45.90.29.203, 144.172.119.31, 185.26.125.181, 185.140.250.174, 54.246.187.60, 210.130.0.3, 5.188.168.252, 49.229.0.115, 80.124.140.238, 45.90.29.67, 139.199.193.210, 45.90.30.197, 81.7.14.215, 83.212.102.207, 192.73.244.179, 45.90.28.121, 205.147.105.156, 45.90.30.203, 134.209.81.226, 80.125.161.90, 17.253.56.213, 45.60.186.33, 154.121.2.53, 45.90.28.9, 45.90.28.191, 45.90.28.103, 91.230.211.67, 35.229.156.160, 80.125.181.116, 45.90.28.64, 17.253.56.85, 45.90.30.47, 147.162.22.1, 140.238.174.12, 223.5.5.109, 45.90.29.233, 107.162.133.99, 80.125.181.80, 194.87.239.59, 188.172.192.71, 45.90.29.79, 78.47.105.4, 78.128.99.220, 202.232.2.38, 217.169.20.23, 45.90.29.204, 45.90.30.22, 45.90.30.52, 82.165.247.205, 45.90.30.162, 91.212.238.8, 185.244.195.159, 45.90.29.50, 45.90.30.250, 110.43.53.226, 217.146.1.31, 35.227.19.85, 213.61.254.39, 185.103.117.76, 176.103.130.137, 130.61.69.193, 217.160.249.29, 136.244.79.94, 45.90.29.195, 210.128.97.222, 210.246.144.15, 80.125.161.108, 17.253.82.247, 45.90.28.236, 37.252.254.39, 45.90.30.57, 45.90.30.160, 45.90.28.5, 45.90.29.141, 210.128.97.85, 45.90.28.237, 45.90.28.170, 52.41.109.236, 45.90.30.81, 176.125.239.22, 47.103.166.53, 193.190.182.53, 149.129.124.211, 207.148.95.1, 8.208.2.65, 156.251.165.134, 194.191.40.86, 45.90.30.195, 138.197.159.48, 80.125.181.71, 80.125.181.99, 45.90.29.212, 45.90.28.110, 82.64.163.190, 9.9.9.9, 200.25.57.69, 93.180.70.22, 5.79.100.76, 17.253.34.247, 23.209.73.136, 39.103.26.199, 45.90.29.85, 1.192.192.206, 75.2.118.36, 45.90.29.15, 141.84.69.29, 176.103.130.136, 195.244.44.45, 45.77.154.135, 101.36.166.17, 45.90.28.214, 210.138.123.111, 103.149.46.217, 45.90.30.92, 106.11.37.96, 104.225.12.146, 45.90.29.167, 45.90.28.13, 84.21.7.14, 45.90.28.230, 45.90.28.197, 130.59.31.248, 45.90.28.134, 176.58.88.213, 45.90.29.90, 45.32.219.28, 93.189.61.195, 52.55.49.18, 85.145.222.167, 86.109.1.91, 90.145.32.35, 37.252.247.133, 45.90.28.232, 109.24.72.41, 45.90.29.47, 45.90.28.206, 34.247.230.158, 82.64.205.253, 61.148.33.140, 149.112.112.13, 45.90.30.214, 45.90.30.31, 54.237.181.250, 185.210.2.71, 161.97.79.138, 175.24.154.191, 210.138.123.78, 3.208.47.162, 45.90.28.242, 91.212.238.14, 47.103.18.1, 52.48.147.197, 45.90.28.173, 185.235.81.3, 141.100.59.223, 45.90.30.225, 80.125.181.123, 54.73.239.183, 80.125.180.125, 209.208.110.56, 45.90.28.99, 45.90.29.62, 45.90.28.62, 45.90.28.91, 198.23.209.146, 168.138.250.131, 5.39.88.20, 80.124.140.239, 81.7.14.52, 45.90.28.66, 31.216.14.42, 66.42.70.192, 45.90.28.41, 116.203.30.98, 103.196.38.38, 45.90.29.13, 103.247.37.150, 222.124.173.197, 185.244.27.53, 80.125.180.73, 45.90.28.172, 45.90.29.190, 107.20.123.160, 45.90.29.181, 18.210.8.52, 165.22.46.136, 45.90.28.90, 54.79.3.18, 130.255.78.51, 202.232.2.32, 104.225.12.223, 192.73.252.11, 45.90.29.7, 45.90.28.107, 217.0.43.2, 149.112.121.20, 45.90.30.170, 45.90.30.252, 222.88.72.38, 130.61.93.4, 37.252.239.39, 87.106.168.61, 51.158.66.31, 199.38.182.47, 75.75.77.6, 45.90.29.93, 101.101.101.101, 195.91.66.55, 80.124.140.131, 45.90.30.62, 17.253.6.85, 45.90.28.78, 209.177.158.142, 94.16.114.254, 149.112.149.112, 45.90.30.136, 45.90.30.149, 80.125.180.124, 109.24.70.2, 45.90.30.109, 45.90.28.16, 35.211.162.236, 167.6.236.224, 91.212.238.22, 193.190.198.16, 45.90.29.16, 86.106.90.57, 45.90.28.115, 45.90.28.211, 17.253.16.119, 79.110.170.43, 109.24.72.150, 91.239.27.199, 95.217.213.94, 17.253.2.247, 103.123.164.2, 45.90.30.3, 132.145.80.242, 45.90.30.107, 45.90.28.80, 210.130.0.51, 161.97.171.39, 188.34.186.98, 185.247.117.121, 80.125.181.13, 93.115.24.204, 80.125.181.98, 185.12.88.178, 193.191.129.41, 96.17.108.202, 46.101.66.244, 45.90.29.35, 106.14.221.10, 138.201.246.200, 124.70.83.172, 217.146.31.87, 188.172.213.149, 80.124.140.221, 209.177.158.248, 80.125.181.185, 5.1.32.212, 141.84.69.2, 210.138.123.74, 45.90.30.80, 52.42.217.166, 72.11.134.91, 35.223.113.18, 92.223.65.71, 149.154.157.148, 54.72.41.135, 128.93.162.64, 3.128.212.186, 194.191.40.100, 45.90.29.214, 116.203.141.185, 45.90.28.79, 45.90.28.163, 104.225.216.146, 80.125.161.105, 45.90.28.39, 111.206.170.220, 45.90.28.253, 209.177.145.66, 66.42.50.16, 40.114.217.81, 80.125.161.172, 217.169.20.22, 45.90.30.150, 3.121.138.96, 213.149.240.21, 81.7.14.85, 45.90.28.28, 185.229.226.28, 45.90.29.188, 45.90.29.131, 217.160.44.149, 45.90.28.150, 108.40.78.219, 142.93.248.50, 95.216.74.67, 124.70.72.126, 81.7.14.252, 210.138.123.105, 45.90.28.117, 185.210.2.70, 210.128.97.83, 45.90.28.7, 111.206.170.78, 45.90.30.83, 109.27.84.62, 45.90.29.207, 80.124.140.200, 47.100.218.41, 45.90.30.253, 140.238.28.191, 45.90.29.132, 194.249.0.142, 45.90.28.249, 45.90.30.91, 95.216.209.165, 172.81.108.146, 37.139.26.4, 210.138.123.75, 45.90.28.43, 81.7.14.159, 160.16.53.149, 158.64.1.29, 45.90.28.222, 213.149.105.9, 143.244.33.90, 185.255.55.25, 203.180.146.12, 45.131.68.245, 45.90.30.74, 185.253.154.66, 47.244.3.29, 45.79.120.233, 75.2.80.144, 45.90.30.226, 45.90.28.166, 104.225.8.147, 45.90.28.52, 202.218.2.19, 185.150.10.229, 80.125.181.124, 79.143.240.7, 44.237.198.74, 109.24.70.70, 116.203.131.110, 45.90.30.238, 185.40.106.78, 184.31.0.240, 192.73.240.168, 14.192.49.53, 45.90.28.203, 45.90.30.32, 17.253.26.119, 80.125.180.161, 3.9.78.39, 8.129.77.255, 212.86.101.213, 52.215.49.128, 82.165.23.176, 86.159.144.0, 45.90.29.44, 45.90.28.2, 45.90.28.24, 17.253.24.85, 45.90.28.228, 54.189.234.230, 116.204.183.61, 45.90.29.27, 130.59.31.251, 34.65.12.198, 47.254.160.160, 194.39.205.162, 45.90.29.248, 95.216.187.185, 45.90.29.142, 80.124.140.207, 180.163.223.231, 75.75.77.5, 172.65.220.168, 45.90.29.116, 210.128.97.215, 54.227.13.144, 116.12.51.216, 18.216.182.207, 107.172.90.160, 17.253.30.85, 45.90.30.0, 80.125.180.154, 5.59.130.114, 217.138.209.217, 45.90.28.127, 80.251.195.73, 193.122.96.153, 47.103.166.51, 91.217.86.4, 45.90.29.149, 176.58.92.236, 45.90.29.100, 193.17.47.1, 17.253.22.247, 149.129.239.2, 52.209.174.126, 45.90.28.36, 47.108.0.45, 72.44.68.88, 193.180.80.10, 151.181.237.20, 45.90.28.38, 194.87.94.229, 210.138.123.79, 161.210.250.7, 45.90.28.152, 45.90.30.239, 188.241.178.104, 88.98.88.158, 162.14.132.76, 217.173.235.78, 51.81.81.178, 9.9.9.10, 161.210.250.8, 45.90.29.174, 80.125.180.100, 17.253.124.119, 17.253.38.243, 72.11.134.90, 31.216.6.41, 75.75.77.25, 158.101.2.228, 86.106.103.153, 45.90.30.76, 80.124.140.160, 149.112.122.30, 45.90.28.25, 80.125.161.184, 147.135.109.96, 91.239.96.21, 45.90.28.105, 152.89.161.16, 101.198.199.200, 167.71.190.157, 213.61.254.44, 45.90.29.244, 45.90.29.180, 216.119.155.49, 17.253.66.247, 101.32.30.247, 108.61.189.69, 45.90.28.126, 91.191.170.21, 94.140.15.15, 199.38.181.200, 80.124.140.129, 178.255.153.47, 162.250.2.3, 45.90.30.35, 86.73.221.179, 52.44.142.142, 3.248.149.109, 203.204.102.17, 5.1.32.33};
        option doh_hostnames: set[string] = {"dns.futa.gg", "ezy.sfr.fr.backup.casepp.sfr.fr", "unova.kescher.at", "s81-7-14-52.blue.kundencontroller.de", "82-64-163-190.subs.proxad.net", "179.221.73.86.rev.sfr.net", "assistance.sfr.fr.casepp.sfr.fr", "srv2.wall.invalid", "72.11.134.90.static.quadranet.com", "ns22.iij.ad.jp", "mestonas.services.sfr.fr.casepp.sfr.fr", "syd01.ns.cbws.xyz", "com.alidns.com", "ns-p-ep-d.raclus.net", "bdns.aeins.at", "ec2-3-232-78-158.compute-1.amazonaws.com", "ec2-54-246-187-60.eu-west-1.compute.amazonaws.com", "host-203-204-102-17.static.kbtelecom.net", "hydra.plan9-ns1.com", "ecs-116-63-136-113.compute.hwclouds-dns.com", "gsa2-admin.sfr.fr.casepp.sfr.fr", "3g.sfr.fr.casepp.sfr.fr", "8.238.212.91.rev.sfr.net", "a184-31-0-235.deploy.static.akamaitechnologies.com", "static.94.213.217.95.clients.your-server.de", "ec2-44-233-140-212.us-west-2.compute.amazonaws.com", "45.76.106.139.vultr.com", "cor-secure011.cns.2iij.net", "a.hdns.io", "hosted.by.pcextreme", "dns1.nextdns.io", "server.foodtoyou.co.za", "www.sfr.fr.casepp.sfr.fr", "ec2-52-31-191-149.eu-west-1.compute.amazonaws.com", "dns.hinet.net", "box.sfr.fr.casepp.sfr.fr", "web.pm.rheinmetall.com", "ec2-52-215-49-128.eu-west-1.compute.amazonaws.com", "rns.im.spb.ru", "nsc.torgues.net", "dns2-cdg.securd.com", "cms.gws-mobile.sfr.fr.casepp.sfr.fr", "a0fdb0990f3f010eb.awsglobalaccelerator.com", "uschi5-doh-003.aaplimg.com", "240.159.72.34.bc.googleusercontent.com", "ptr46.lachambre.be", "per-secure011.cns.2iij.net", "dns3.ord.hv.nominum.cloud", "dns10.quad9.net", "mail.dnswl.org", "asc-ws.sfr.fr.casepp.sfr.fr", "cor-secure1611.cns.2iij.net", "s81-7-14-159.blue.kundencontroller.de", "pl.ahadns.net", "gatewaykiosque.case.sfr.fr.casepp.sfr.fr", "cor-secure160.cns.2iij.net", "167.179.64.116.vultr.com", "mail21.es.34web.net", "232.ablak.arnes.si", "353o.l.time4vps.cloud", "www.sfrentreprises.fr.casepp.sfr.fr", "pope.cnblw.me", "www.red-by-sfr.fr.casepp.sfr.fr", "as6233.net", "h202-218-2-19.ablenetvps.ne.jp", "83.69.229.35.bc.googleusercontent.com", "ec2-52-44-142-142.compute-1.amazonaws.com", "clientdns3.softcom.net", "nl-ams01.dns.moulticast.net", "dns1-iad.securd.com", "dns.comss.one", "ec2-18-210-8-52.compute-1.amazonaws.com", "mob-55.195-91-66.telekom.sk", "extctcweb1024.sfr.fr.casepp.sfr.fr", "dns.telekom.de", "fuchur.pentament.de", "cms.sfr.fr.backup.casepp.sfr.fr", "dnsg.northmeadowmedical.com", "rn1.pcextreme.nl", "test-int-admin-ctc.funinfo.sfr.fr.casepp.sfr.fr", "smtp.mousepanic.de", "45.32.47.13.vultr.com", "s81-7-14-191.blue.kundencontroller.de", "applimabox.sfr.fr.casepp.sfr.fr", "cms-hotspot.sfr.fr.casepp.sfr.fr", "extctcweb.sfr.fr.casepp.sfr.fr", "ec2-52-17-180-181.eu-west-1.compute.amazonaws.com", "pub-fsr1611.cns.2iij.net", "ec2-34-247-230-158.eu-west-1.compute.amazonaws.com", "ppr-achatweb.sfr.fr.casepp.sfr.fr", "pub-fsr211.cns.2iij.net", "22.238.212.91.rev.sfr.net", "cms.lafibresfr.fr.casepp.sfr.fr", "boutiques.sfr.fr.casepp.sfr.fr", "usbos3-doh-002.aaplimg.com", "*.s-sfr.fr.backup.casepp.sfr.fr", "cms.mes-contenus.sfr.fr.casepp.sfr.fr", "radiusims.services.sfr.fr.casepp.sfr.fr", "mail.jabber-germany.de", "mtpremium.services.sfr.fr.casepp.sfr.fr", "160.156.229.35.bc.googleusercontent.com", "140.82.45.97.vultr.com", "ppr-extctcweb.sfr.fr.casepp.sfr.fr", "laureline.eu.org", "usatl4-doh-003.aaplimg.com", "collectivites.sfrbusinessteam.fr.casepp.sfr.fr", "114-34-116-139.hinet-ip.hinet.net", "dns.adguard.com", "88.215.65.27.dynamic.cablesurf.de", "bg-sof-fe-01.swiftycdn.net", "191-209-16-235.user.vivozap.com.br", "236.202.2.109.rev.sfr.net", "camilasyd1.zdns.pw", "rpz-public-resolver2.rrdns.pch.net", "res-acst3.absolight.net", "cns2-test.unet.nl", "ip195.ip-178-32-196.eu", "one-pdx-1.edge.nextdns.io", "a184-31-0-240.deploy.static.akamaitechnologies.com", "ppr-gatewaykiosque.case.sfr.fr.casepp.sfr.fr", "esb-smileypack.nitrobox.eu", "ns53.iij.ad.jp", "outilamberpoint.sfr.fr.casepp.sfr.fr", "dns-a.wizint.net", "iris.woozeno.eu", "unicast.censurfridns.dk", "66.42.50.16.vultr.com", "ns51.iij.ad.jp", "host-83-69-169-222.ncp.ru", "static-108-40-78-219.bltmmd.fios.verizon.net", "ns2.cloudwebservices.nl", "wyx.cloud", "ecs-119-3-218-92.compute.hwclouds-dns.com", "236.162.211.35.bc.googleusercontent.com", "recursive2.go6lab.si", "family.canadianshield.cira.ca", "ec2-3-128-212-186.us-east-2.compute.amazonaws.com", "ec2-54-72-41-135.eu-west-1.compute.amazonaws.com", "resolver-4.tbt.com.tr", "hkhkg1-doh-002.aaplimg.com", "ns01.iij4u.or.jp", "dns2.nextdns.io", "espace-client.m.sfr.fr.casepp.sfr.fr", "ll194-11-251-204-194.ll194.iam.net.ma", "ec2-54-155-209-93.eu-west-1.compute.amazonaws.com", "atlantic.dyn1.de", "ec2-18-216-182-207.us-east-2.compute.amazonaws.com", "console.ace.sfr.fr.casepp.sfr.fr", "ns2.x0w.de", "in.ahadns.net", "ns4.iij.ad.jp", "cor-pure010.cns.2iij.net", "ec2-54-194-121-142.eu-west-1.compute.amazonaws.com", "tk2-202-10895.vs.sakura.ne.jp", "per-pure011.cns.2iij.net", "ec2-3-7-176-123.ap-south-1.compute.amazonaws.com", "cor-secure21.cns.2iij.net", "odvr.nic.cz", "case.tonalites.sfr.fr.casepp.sfr.fr", "uslax1-doh-003.aaplimg.com", "ns70.iij.ad.jp", "224.73.73.34.bc.googleusercontent.com", "pool-nvi-dns.bitdefender.net", "c.hdns.io", "ns15.iij.ad.jp", "45.77.137.133.vultr.com", "dns1-sea.securd.com", "next.sfr.fr.casepp.sfr.fr", "nc.cachescruber.org", "dns2-dfw.securd.com", "snf-880622.vm.okeanos.grnet.gr", "per1711.cns.2iij.net", "doh.argh.in", "manta.offline.net", "dns1.sjc.hv.nominum.cloud", "108.61.189.69.vultr.com", "carbon.junesta.net", "ec2-54-189-234-230.us-west-2.compute.amazonaws.com", "riv1-ns01.monzoon.net", "craft.vps.pw", "public-dns-b.dnspai.com", "cor-pure1601.cns.2iij.net", "kaitain.restena.lu", "gsa-admin.sfr.fr.backup.casepp.sfr.fr", "unassigned.psychz.net", "85.19.227.35.bc.googleusercontent.com", "pool-fra-dns.bitdefender.net", "ppr3-cae.sdp.sfr.fr.casepp.sfr.fr", "twg001.timmes.nl", "pair01-02.ihatemy.live", "dns11.quad9.net", "security.cloudflare-dns.com", "ecs-124-70-72-126.compute.hwclouds-dns.com", "doh.dnslify.com", "nsb.tul.cz", "uschi5-doh-004.aaplimg.com", "ec2-52-48-147-197.eu-west-1.compute.amazonaws.com", "ec2-52-18-44-241.eu-west-1.compute.amazonaws.com", "cor-secure911.cns.2iij.net", "cor-pure91.cns.2iij.net", "198-23-209-146-host.colocrossing.com", "ns.doh-ns.de", "pub-fsr1600.cns.2iij.net", "static.98.30.203.116.clients.your-server.de", "cor-secure01.cns.2iij.net", "dns1.ord.hv.nominum.cloud", "s81-7-14-215.blue.kundencontroller.de", "de-dus01.adm.moulticast.net", "dns1-lga.securd.com", "hotspot.sfr.fr.casepp.sfr.fr", "fio.ze1.org", "ec2-54-79-3-18.ap-southeast-2.compute.amazonaws.com", "cv-dns-on-ca-2.cloudveil.org", "doh-nl.dns.sb", "56.70.66.34.bc.googleusercontent.com", "ec2-34-197-6-94.compute-1.amazonaws.com", "gws-mobile.sfr.fr.casepp.sfr.fr", "ec2-54-171-175-41.eu-west-1.compute.amazonaws.com", "uschi5-doh-002.aaplimg.com", "ns0.servus.at", "ec2-3-248-149-109.eu-west-1.compute.amazonaws.com", "dns3.iad3.hv.nominum.cloud", "lestudio.sfr.fr.casepp.sfr.fr", "ll194-13-251-204-194.ll194.iam.net.ma", "pates.services.sfr.fr.casepp.sfr.fr", "ec2-54-227-13-144.compute-1.amazonaws.com", "dns.east.comss.one", "de.dnsguard.eu", "esel.stusta.mhn.de", "40.142.96.34.bc.googleusercontent.com", "dns1-lax.securd.com", "static.98.186.34.188.clients.your-server.de", "qlf-doh.inria.fr", "176-103-130-136.dns.adguard.com", "45.77.154.135.vultr.com", "cv-dns-on-ca-1.cloudveil.org", "198.12.65.34.bc.googleusercontent.com", "host86-159-144-0.range86-159.btcentralplus.com", "82-148-223-195.network.unet.nl", "asc-admin.sfr.fr.casepp.sfr.fr", "xc.dnsseed.bluematt.me", "bad.dns.ipbx4rent.com", "authentification.sfr.re.casepp.sfr.fr", "cloudyfalcon.com", "ec2-54-169-113-231.ap-southeast-1.compute.amazonaws.com", "per-pure211.cns.2iij.net", "asc.sfr.fr.casepp.sfr.fr", "os-ns2.fbi.h-da.de", "ausyd2-doh-002.aaplimg.com", "ns0.x0w.de", "91-239-27-199.flops.ru", "23-94-120-177-host.colocrossing.com", "ordns.he.net", "ec2-52-31-171-166.eu-west-1.compute.amazonaws.com", "dotdns.cryptroute.com", "191-204-50-195.sta.estpak.ee", "help.avantec.ch", "dns2-sea.securd.com", "red.sfr.fr.casepp.sfr.fr", "odvr-b-99.nic.cz", "doh.li", "dekonix.zomro.com", "sgsin3-doh-004.aaplimg.com", "ec2-3-209-17-34.compute-1.amazonaws.com", "static.80.160.119.168.clients.your-server.de", "resolver3.ns.dnslify.net", "dns2-chi.securd.com", "bcfv.org", "64.64.248.141.16clouds.com", "ecs-124-70-83-172.compute.hwclouds-dns.com", "81-7-14-252.blue.kundencontroller.de", "monespace.sfr.fr.casepp.sfr.fr", "dnsproxy.safebr.mcafee.com", "usdal4-doh-002.aaplimg.com", "host-83-69-169-69.ncp.ru", "per-pure01.cns.2iij.net", "dns.slinkyman.net", "ppr-sids.sdp.sfr.fr.casepp.sfr.fr", "148.157.154.149.in-addr.arpa", "dns1-chi.securd.com", "tor.vasi.li", "sgsin3-doh-002.aaplimg.com", "116-204-183-61.static.bangmod-idc.com", "167-222-145-85.ftth.glasoperator.nl", "pool-ore-dns.bitdefender.net", "static.110.131.203.116.clients.your-server.de", "public-dns-a.dnspai.com", "cor-secure220.cns.2iij.net", "ip186.ip-176-31-83.eu", "snake.ukrnet.net", "14.238.212.91.rev.sfr.net", "usbos3-doh-001.aaplimg.com", "protected.canadianshield.cira.ca", "clears.worldwidemake.com", "pates-xml.backup.partenaires.sfr.fr.casepp.sfr.fr", "extachatweb.sfr.fr.casepp.sfr.fr", "odoh-proxy", "static.4.105.47.78.clients.your-server.de", "ns05.iij.ad.jp", "ns02.iij4u.or.jp", "ezy.sfr.fr.casepp.sfr.fr", "ec2-52-16-163-185.eu-west-1.compute.amazonaws.com", "ns1.netent.co.nz", "cms-admin.sfr.fr.backup.casepp.sfr.fr", "cache2.trouble-free.net", "doh-a.simpledns.xyz", "rev-195-238-187.atman.pl", "dns2.iad3.hv.nominum.cloud", "dns2.prisconetworks.com", "usden5-doh-002.aaplimg.com", "ec2-3-224-109-152.compute-1.amazonaws.com", "vmi565450.contaboserver.net", "ns03.iij4u.or.jp", "cms.sfr.fr.casepp.sfr.fr", "dns2.in-berlin.de", "redirekcija.t-com.me", "void-gate.irre.li", "static-62-12-117-34.ips.angani.co", "62.84.27.109.rev.sfr.net", "pool-tky-dns.bitdefender.net", "80.251.225.218.teleru.net", "webcare.funinfo.sfr.fr.casepp.sfr.fr", "ptr41.dekamer.be", "usscz2-doh-001.aaplimg.com", "ec2-52-49-195-5.eu-west-1.compute.amazonaws.com", "uslax1-doh-001.aaplimg.com", "steering.nextdns.io", "unn-143-244-33-90.datapacket.com", "a96-17-108-202.deploy.static.akamaitechnologies.com", "dns2-lga.securd.com", "ec2-54-73-239-183.eu-west-1.compute.amazonaws.com", "chaos-system.de", "cpc75651-alde5-2-0-cust54.6-2.cable.virginm.net", "ppr-extachatweb.sfr.fr.casepp.sfr.fr", "c.cms.sfr.fr.casepp.sfr.fr", "doh.dht.prd.live.c2szps.akadns.net", "ec2-52-209-174-126.eu-west-1.compute.amazonaws.com", "b-nxr-a02.isp.t-ipnet.de", "vds-dumonchik-79509.itldc-customer.net", "ns4.highnet.com", "dns.aa.net.uk", "res110.fra.rrdns.pch.net", "doh.dns.apple.com.v.aaplimg.com", "dns-2.zfn.uni-bremen.de", "s81-7-14-85.blue.kundencontroller.de", "ad3ab303f1f21eff8.awsglobalaccelerator.com", "static.81.103.202.116.clients.your-server.de", "dns3.sjc.hv.nominum.cloud", "vierhoek.student.utwente.nl", "dns-doh-1.belnet.be", "abel.waringer-atg.de", "82-64-205-253.subs.proxad.net", "zougloub.eu", "sn22.isp.telecom.li", "dns2.iad.preprod.nominum.cloud", "cor-secure22.cns.2iij.net", "lastentarvike.fi", "vps-0ad116e1.vps.ovh.ca", "ec2-52-43-41-34.us-west-2.compute.amazonaws.com", "dns-doh-2.belnet.be", "uklon5-doh-002.aaplimg.com", "cpe-70-113-111-13.austin.res.rr.com", "vmi443571.contaboserver.net", "pub-fsr1601.cns.2iij.net", "mail.masters-of-cloud.de", "67-8-56-46.res.bhn.net", "dev.ahadns.net", "static.225.115.203.116.clients.your-server.de", "dns.nextdns.io", "107-172-90-160-host.colocrossing.com", "d-nxr-a02.isp.t-ipnet.de", "67.230.177.135.16clouds.com", "dnscache-32-3.mgk.pl", "ec2-54-237-181-250.compute-1.amazonaws.com", "dns1-hkg.securd.com", "pub1.sdns.360.cn", "per-secure210.cns.2iij.net", "muli.stusta.mhn.de", "cache2.alidns.com", "usmia1-doh-002.aaplimg.com", "ec2-52-19-206-74.eu-west-1.compute.amazonaws.com", "dns.switch.ch", "ns2.highnet.com", "225.99.198.104.bc.googleusercontent.com", "zrh1-ns01.monzoon.net", "spdns.iucc.ac.il", "ns-p-ep-c.raclus.net", "alekberg.net", "dns2-lhr.securd.com", "usmia1-doh-006.aaplimg.com", "ns1.highnet.com", "unn-143-244-33-74.datapacket.com", "ec2-3-208-47-162.compute-1.amazonaws.com", "72.11.134.91.static.quadranet.com", "a23-209-73-136.deploy.static.akamaitechnologies.com", "cor-pure1610.cns.2iij.net", "ines.zfn.uni-bremen.de", "s81-7-14-83.blue.kundencontroller.de", "cms-admin.sfr.fr.casepp.sfr.fr", "107.182.22.203.16clouds.com", "ns2.tausch.co", "cor-secure1600.cns.2iij.net", "45.77.223.173.vultr.com", "pates.backup.pdct.sfr.fr.casepp.sfr.fr", "ptr45.dekamer.be", "labs.syshero.org", "yarp.lefolgoc.net", "lon.ns.junesta.net", "dns2-iad.securd.com", "galileo.math.unipd.it", "sgsin3-doh-001.aaplimg.com", "public.global-idc.net", "ec2-54-172-110-180.compute-1.amazonaws.com", "cms.ezy-distrib.sfr.fr.casepp.sfr.fr", "per-pure220.cns.2iij.net", "forum.sfr.fr.casepp.sfr.fr", "ussea4-doh-003.aaplimg.com", "ptr.ruvds.com", "ns14.iij.ad.jp", "ip232.ip-51-81-224.us", "155.138.142.93.vultr.com", "dns-nyc.aaflalo.me", "80.251.195.73.nat64.tre.se", "18.113.223.35.bc.googleusercontent.com", "www.sfr.fr.backup.casepp.sfr.fr", "m49.topneem.com", "107-174-206-189-host.colocrossing.com", "dns1-lhr.securd.com", "vr2.tort.icu", "vps-77f564f3.vps.ovh.us", "176-103-130-137.dns.adguard.com", "dns0.btnet.de", "dns.xin1397.com", "host156.rainr.net", "dns.alexc.hu"};

        # Add a field to the ssl log record.
        redef record SSL::Info += {
            ## Indicate if the Dst of the connection is a DoH server
            is_DoH: bool &default=F &log;
        };

}

event connection_established(c: connection)
{
    local doh_timeout: interval = 1 hrs ;
    local daddr: addr = c$id$resp_h ;
    local dport: port = c$id$resp_p;

    if ( daddr in doh_ips && dport == 443/tcp ){
            set_inactivity_timeout(c$id, doh_timeout);
        }
}





hook SSL::log_policy(rec: SSL::Info, id: Log::ID, filter: Log::Filter)
{
    if ( rec$server_name != "") {
        local hostname: string = rec$server_name;

        if (hostname in doh_hostnames){
            rec$is_DoH = T;

            print fmt("@@@@@@@DETECTED AN SSL TO D0H SERVERR domain %s  ", hostname);
        }
    }


    local daddr: addr = rec$id$resp_h ;

    if ( daddr in doh_ips ){
        rec$is_DoH = T;
        print fmt("@@@@@@@DETECTED AN SSL TO D0H SERVERR %s  ", daddr);

       }
}
