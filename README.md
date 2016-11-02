# greenroute
Smart City Data Solution for Stavanger

#Create and deploy docker containers for each host. Note their IPs

#Install Ambari

  SSH into the Ambari master node
  
    ssh greenroute@ip.address
    
  Run the following for Ambari Setup

    echo $JAVA_HOME #Note down the path
    sudo ambari-server setup
    
      Choose the following as input for the setup options
        Customize user account for ambari-server daemon [y/n] (n)? n
        Checking JDK...
        Enter choice (1): 3
        Path to JAVA_HOME: #Enter the path to $JAVA_HOME
        Enter advanced database configuration [y/n] (n)? n
  
  Start Ambari Server
  
    sudo ambari-server start
    
#Create Passwordless ssh for all machines, including self

  run the following only on the master node
  
    ssh-keygen
    
  run the following for all agent nodes (from the scripts folder). 
  
      ./passwordlessSSH.sh target.ip.hostname target.password

#Install Ambari Agents

  run the following for all agent nodes (from the scripts folder). 
  Install the agent on the computer running the Ambari master, if you want to add it to the cluster as well

    ./installAmbariAgents.sh master.ip.hostname target.ip.hostname target.password

#Now go to ambari.master.ip:8080,  

login using user: admin, pass: admin to set the cluster and services (HDFS; HBASE, SPARK)
Deploy HDFS, HBASE, MapReduce/Yarn, Zookeeper.

#OpenTSDB

  SSH into ambari master
  run the following:

    VERSION=`hdp-select status hadoop-client | sed 's/hadoop-client - \([0-9]\.[0-9]\).*/\1/'`
    sudo git clone https://github.com/hortonworks-gallery/ambari-opentsdb-service.git /var/lib/ambari-server/resources/stacks/HDP/$VERSION/services/OPENTSDB
    sudo ambari-server restart

  Log into ambari master web and wait for all the hosts and services to register their heartbeats
  
  Go to Add Services and deploy OPENTSDB.
