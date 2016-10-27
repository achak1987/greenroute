# greenroute
Smart City Data Solution for Stavanger
#Create and deploy docker containers for each host. Note their IPs
#Install Ambari
  SSH into the Ambari master node
    ssh greenroute@ip.address
  Run the following for Ambari Setup
    sudo ambari-server setup
      Choose the following as input for the setup options
        Customize user account for ambari-server daemon [y/n] (n)? n
        Checking JDK...
        Enter choice (1): 3
        Path to JAVA_HOME: /home/greenroute/java
        Enter advanced database configuration [y/n] (n)? n
  
  Start Ambari Server
    sudo ambari-server start
#Create Passwordless ssh for all machines, including self
  run the following only on the master node
    ssh-keygen
  run the following for all agent nodes (from the scripts folder). 
      ./passwordlessSSH.sh target.ip.hostname target.password

#Install Ambari Agents
  run the following for all agent nodes (from the scripts folder). Install the agent on the computer running the Ambari master, if you want to add it to the cluster as well
    ./installAmbariAgents.sh master.ip.hostname target.ip.hostname target.password

#Now go to ambari.master.ip:8080,  login using user: admin, pass: admin to set the cluster and services (HDFS; HBASE, SPARK)
