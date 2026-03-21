function add_sudo_touchid --description 'Authenticate sudo commands with macOS Touch ID'
    # https://news.ycombinator.com/item?id=32611340
    # https://it.digitaino.com/use-touchid-to-authenticate-sudo-on-macos/
    sudo perl -pi -e 's/(pam_smartcard.so)/$1\nauth       sufficient     pam_tid.so/' /etc/pam.d/sudo
end
