get_informations_1 () {
    # Get informations of server

    sub_title Enter server datas
    echo -e "\n"
    read -p "Enter path from server (Ex : /var/www/<website>) > " path_from_website
    read -p "Enter name configuration file (Ex : website.conf) > " file_config
    read -p "Enter address server (Ex : www.website.fr) > " server_name
    read -p "Enter address alias server (Ex : website.fr) > " server_alias
}

check_informations_2 () {
    # Checking server information

    while [ true ]
    do
    echo -e "\n"
    sub_title This informations is correct ?
    echo -e "\nPath from server :" $path_from_website
    echo "Name configuration file :" $file_config
    echo "Address server :" $server_name
    echo "Address alias server :" $server_alias
    echo -e "\n"
    read -p "Valid informations [Y/n]: " valid_information
    echo -e "\n"

    if [ $valid_information = "y" ] || [ $valid_information = "Y" ]
    then
        create_path_server_3
        create_index_file_4
        change_rights_server_5
        create_folders_configuration_6
        create_file_configuration_7
        add_server_name_8
        activate_selinux_9
        restart_httpd_10
        exit 0
        else
        unset $path_from_website
        unset $file_config
        unset $server_name
        unset $server_alias
        start_program
        fi
    done
}

change_rights_server_5 () {
    # Change rights server

    sub_title Change rights server

    chown -R apache:apache $path_from_website
    chmod -R 777 $path_from_website
}

add_server_name_8 () {
    # Add server name in /etc/hosts

    sub_title Add server name in /etc/hosts

    echo -e "127.0.0.1 $server_name $server_alias" >> /etc/hosts
}

activate_selinux_9 () {
    # Activate sebool httpd_unified on 1

    sub_title Activate sebool httpd_unified

    setsebool -P httpd_unified 1
}

restart_httpd_10 () {
    # Restart service httpd

    sub_title Restart service httpd

    systemctl restart httpd
    echo -e "\n"
}