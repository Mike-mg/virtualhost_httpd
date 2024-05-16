create_path_server_3 () {
    # Create server path

    sub_title Create server path

    mkdir -p "$path_from_website/logs"
}

create_index_file_4 () {
    # Create index.php

    sub_title Create index.php

    cat > $path_from_website/index.php << eof
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <h1>Bienvenue sur le site $server_name</h1>
        <?php
        phpinfo();
        ?>
    </body>
</html>
eof
}

create_folders_configuration_6 () {
    # Create configuration folders of server

    sub_title Create configuration folders of server

    mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled
}

create_file_configuration_7 () {
    # Create configuration files of server

    sub_title Create configuration files of server

    cat > /etc/httpd/sites-available/$file_config << eof
<VirtualHost *:80>
    ServerName "$server_name"
    ServerAlias "$server_alias"
    DocumentRoot "$path_from_website"
    ErrorLog  "$path_from_website/logs/error.log"
    CustomLog "$path_from_website/logs/access.log" combined
    <Directory "$path_from_website">
        Options Indexes Includes FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
eof

    # Create link of config file from sites-available to sites-enabled
    ln -s /etc/httpd/sites-available/$file_config /etc/httpd/sites-enabled/$file_config
}