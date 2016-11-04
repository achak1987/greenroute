#a script to create and register ambari agents
#executed with ip/hostname of master, agent and agent password as arguments
#author antorweep chakravorty
master="$1"
agent="$2"
agentPass="$3"
echo $agentPass | ssh $agent "sudo -S sed -i -e s/hostname=localhost/hostname=$master/g /etc/ambari-agent/conf/ambari-agent.ini"
echo $agentPass | ssh $agent "sudo -S ambari-agent start"
echo "Agent started at $agent"
