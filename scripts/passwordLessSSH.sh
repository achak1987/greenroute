#a script to create password less ssh from host to clients
#ensure that you have already used ssh-keygen on the host machine to generate you private and public keys
#executed with target's ip/hostname and password
#author antorweep chakravorty
target="$1"
password="$2"

sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$target" "mkdir .ssh"
sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$target" "chmod 700 .ssh"
sshpass -p "$password" scp -o StrictHostKeyChecking=no ~/.ssh/id_rsa.pub "$target":~/.ssh/authorized_keys
sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$target" "chmod 600 .ssh/authorized_keys"
echo "Passwordless SSH for $target created!"

