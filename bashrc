# Add this to the end of .bashrc on the Jumphost to run the script when you connect to Jumphost

# Run the SSH server selection script only for interactive SSH sessions
if [[ $- == *i* ]]; then
    ~/select_host.sh
fi
