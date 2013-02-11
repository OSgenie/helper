helper
================

## add-all-sh-git
Description: Quickly commit modifications to a git repository. Copy it to the root of the working repository to run

Usage: add-all-sh-git 'Commit Message' (defaults to '.' if blank)

## config_bash.sh
Description: Modifies bash history to increase size, ignoredups, and timestamp entries
Usage: ./config_bash.sh

## create-README.sh
Description: Generates a README.md from all the help methods in a given repository

Usage: ./create-README.sh

## delete-vm.sh
Description: Unregisters and deletes all files for a vm on a kvm host with a default path

Usage: delete-vm.sh (You'll be presented with a list of all vms on the machine to choose from)

## install-admin-tools.sh
Description: Installs the basic programs for administering servers and virtual hosts and creates a new ssh key for the console if one doesn't exist. You will still need to ssh-copy-id the key to any servers you want to manage

Usage: ./install-admin-tools.sh

## install-sshsudo.sh
Description: Installs the sshsudo command allowing for a command to be performed on multiple servers with only one password prompting

Usage: ./install-sshsudo.sh

## make_it_sed_readable.sh
Description: Rewrites a string adding escape characters in front of characters that need escaping to be used with sed

Usage: ./make_it_sed_readable.sh 'string to be rewritten'

## refresh-git.sh
Description: git pulls the latest version for all subdirectories

Usage: ./refresh-git.sh

## status-git.sh
Description: displays the git status of all subdirectories

Usage: ./status-git.sh

## use-apt-cacher.sh
Description: Configure apt-get to use an apt-cacher server

Usage: ./use-apt-cacher.sh <FQDN or IP of apt-cacher server>

## use-wget-proxy.sh
Description: Configure wget to use a proxy
Usage: ./use-wget-proxy.sh <FQDN or IP of proxy server>:<port> 
