# awk-mac-changer
Small awk script to change the cloned mac address in a Linux NetworkManager wireless config file.

Sample usage to **only** update a wireless config file:
```
$ sudo awk -f "wifi-mac-changer.awk" /etc/NetworkManager/system-connections/iPhone
```
> Note: You have to run with "sudo" to modify system files.

Sample to update a wireless config file and have NetworkManager service pick up the change:
```
$ sudo awk -f "wifi-mac-changer.awk" /etc/NetworkManager/system-connections/Google-Starbucks
$ sudo service NetworkManager restart
```
There is a small bash script to achieve the same for convenience:
```
$ ./change-wifi-mac.sh "/etc/NetworkManager/system-connections/Google-Starbucks"
```

For Xfinity on demand wifi, you'll need to sign up to use the wifi. The imacro code (tested on firefox) fills the sign up forms with a random user.
