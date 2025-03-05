# Simple Homelab SSH jumphost
Simple SSH jumphost for non-production usage.

Read more at https://igortkanov.com/convenient-homelab-ssh-jumphost/ for a complete instruction on how to quickly set this up.

### ⚠️  Do not expose to the internet ⚠️
The whole jumphost idea is meant to be used in homelab, experimental kind of environments. It is insecure as-is and must **not** be used with publicly-exposed hosts or production systems.


## Host selection script

### `select_host.sh`

Executes upon a connection to the jumphost server, displays a menu to select the target host from. Uses `fzf` (https://github.com/junegunn/fzf).

Place the file on the jumphost server


## Sample files

### `ssh/config`

Lists target servers to SSH into from the Jumphost.
Place the file at .ssh/config on the jumphost server


### `bashrc`

Add the contents to the end of .bashrc on your Jumphost to run the script automatically, when you connect to the Jumphost server

