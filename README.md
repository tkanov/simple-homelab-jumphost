# Simple Homelab SSH jumphost
Simple SSH jumphost for non-production usage.

### ⚠️  Do not expose to the internet ⚠️
The whole jumphost idea is meant to be used in homelab, experimental kind of environments. It is insecure as-is and must **not** be used with publicly-exposed hosts or production systems.


## Quick install

On the jumphost server:

```sh
git clone https://github.com/<your-fork>/simple-homelab-jumphost.git
cd simple-homelab-jumphost
./install.sh
```

The installer copies `select_host.sh` to `~/`, appends the `bashrc` snippet to `~/.bashrc` (idempotently, with markers), and drops the sample `ssh/config` into `~/.ssh/config` **only if you don't already have one**. It also warns if `fzf` is missing.

Edit `~/.ssh/config` to point at your own hosts, then open a fresh SSH session to the jumphost to see the menu.


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


## Background

For the motivation and a walkthrough of how this fits into a homelab, see https://igortkanov.com/convenient-homelab-ssh-jumphost/.

