#! /bin/bash

####      Create and configuration server      #####
#                                                  #
# > Name Script : create_virtualhost.sh            #
# > Date        : 13/05/24                         #
# > By    : Michael Gay                            #
# > Mail  : michael.mg.09a@gmail.com               #
#                                                  #
#                                                  #
####      Script detail                        #####
#                                                  #
# > Create server with httpd                       #
#                                                  #
#################################################### 

source utils/utils_func.sh
source utils/create_files.sh
source utils/config_files_system.sh
source views/view_title.sh

start_program () {
  # Entry program
  
  clear

  title_menu Creation and initialization of the web server
  
  check_user_root
  get_informations_1
  check_informations_2
}

start_program