check_user_root () {
    # Check is user is 'root'

    if [ `whoami` != "root" ]
    then
        echo -e "\nConnectez vous en tant que utilisateur 'Root'..."
        echo -e "Interruption du script.\n"
        exit 1
    fi
}

update () {
    # Update system

    sub_title "> Update system"
    dnf update
}
