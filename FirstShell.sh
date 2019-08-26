#!/bin/bash
#echo "This script is about to run another first script for hosts concern."
sh /root/ansible/Shellhosts.sh
#echo "This script has just run another script."

#echo "This script is about to run another second script for SDP concern."
sh /root/ansible/shell.sh
#echo "This script has just run another script."

 ansible-playbook MainPlaybook
