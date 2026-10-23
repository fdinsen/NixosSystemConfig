# How to use

This is the system-wide configuration, and must be set up before home-manager can be configured.

1. Clone this repository, and copy the file "configuration.nix" to the folder "/etc/nixos/" - consider making a backup of your old configuration file.
    1.1. Do NOT copy the hardware-configuration.nix file - that one is generated automatically for your specific hardware
2. Edit the configuration file as sudo, and make the following changes:
    2.1. Delete the part that sets up the windows bootloader (The 5 lines under the comment "TODO Remove if not fdinsen desktop pc")
    2.2. Change the user account name to whatever you set when you installed Nixos (the line "users.users.fdinsen", where fdinsen should be changed - under the comment "TODO: If you created a different account, change the name "fdinsen" below")
    2.3. Delete the section dealing with Nvidia graphics drivers at the bottom.
3. Save the file, and open a terminal in the folder "/etc/nixos/"
4. Run the command "sudo nixos-rebuild switch", and enter your sudo password - then nixos will run its magic and set up your system!

