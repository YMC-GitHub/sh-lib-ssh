#!/bin/sh

THIS_FILE_PATH=$(cd $(dirname $0);pwd)
THIS_FILE_NAME=$(basename $0)
[ -z "$RUN_SCRIPT_PATH" ] && RUN_SCRIPT_PATH=$(pwd)

#echo "$THIS_FILE_PATH"
#echo "$RUN_SCRIPT_PATH"


# desc:get project dir path
# desc:include lib project-dir-map and(to) gen project dir map
# desc:include lib lib-load and(to) load lib
# desc:ssh key add

# step-x:get project dir path relative to THIS_FILE_PATH
PATH_TO_PROJECT_RELATIVE="../../";PROJECT_PATH=$(cd "$THIS_FILE_PATH";cd "$PATH_TO_PROJECT_RELATIVE" ;pwd)

# step-x:project-dir-map load
source "${PROJECT_PATH}/sh_modules/sh-lib-project-dir-map.sh"
# step-x:gen project dir map with default tpl
#[ -z "$THIS_FILE_PATH" ] && THIS_FILE_PATH=$(this_file_path_get) ; project_dir_map_gen3 "../"
# step-x:gen project dir map with custom tpl from file  or default tpl
[ -z "$THIS_FILE_PATH" ] && THIS_FILE_PATH=$(this_file_path_get) ; f="${PROJECT_PATH}/P_DIR_MAP.md" ; [ -e $f ] && P_DIR_MAP_LIST=$(cat "${PROJECT_PATH}/P_DIR_MAP.md") ; project_dir_map_gen3 "$PATH_TO_PROJECT_RELATIVE" "$P_DIR_MAP_LIST"

# step-x:sh-lib-load-lib load
source "${PROJECT_PATH}/sh_modules/sh-lib-load-lib.sh"
# step-x:sh-lib-load-lib use

# step-x : lib require and load
#mod_require "${SH_MODULE_LOCAL}/sh-lib-gpg.sh" ;
SH_MODULE_LOCAL="${PROJECT_PATH}/sh_modules"
# step-x : get p dir
SH_MODULE_GLOBAL=$(cd "$PROJECT_PATH";cd "../" ;pwd)
# step-x : lib require only
mod_require_only "sh-lib-gpg.sh" ;
mod_require_only "${SRC_PATH}/index.sh" ;
# step-x : lib load auto
mod_load_auto


#project_dir_map_out
#project_dir_map_out3
#f="${PROJECT_PATH}/P_DIR_MAP.md" ; [ -e $f ] && P_DIR_MAP_LIST=$(cat "${PROJECT_PATH}/P_DIR_MAP.md") ; project_dir_map_out3 "$PATH_TO_PROJECT_RELATIVE" "$P_DIR_MAP_LIST"

# ini var
#ssh_var_ini

# set cnf
SSH_SERVER_IP="192.168.56.3"
SSH_USER_NAME=root
SSH_KEY_FILE_NAME=$(date "+%y-%m-%d") #$(date "+%y-%m-%d") #$(date "+%Y-%m-%d")
SSH_PRI_KEY_FILE_PATH=~/.ssh/

# cnf from arg
[ "$1" ] && SSH_SERVER_IP="$1" ; [ -z "$SSH_SERVER_IP" ] && SSH_SERVER_IP="192.168.56.3"
[ "$2" ] && SSH_USER_NAME="$2" ; [ -z "$SSH_USER_NAME" ] && SSH_USER_NAME=root
[ "$3" ] && SSH_KEY_FILE_NAME="$3" ; [ -z "$SSH_KEY_FILE_NAME" ] && SSH_KEY_FILE_NAME=$(date "+%y-%m-%d")
[ "$4" ] && SSH_PRI_KEY_FILE_PATH="$4" ; [ -z "$SSH_PRI_KEY_FILE_PATH" ] && SSH_PRI_KEY_FILE_PATH=~/.ssh/


#ssh_var_config "192.168.56.3" "root" "20-06-16" ~/.ssh/
#ssh_var_config "$SSH_SERVER_IP" "$SSH_USER_NAME" "2020-06-16 "$SSH_PRI_KEY_FILE_PATH"
ssh_var_config "$SSH_SERVER_IP" "$SSH_USER_NAME" "$SSH_KEY_FILE_NAME" "$SSH_PRI_KEY_FILE_PATH"
ssh_secret_key_gen



function var_list_key_out(){
  echo "$var_list"
}
# fun usage
# var_list_key_out

function var_list_val_out(){
  local key=,line=,list=
  list=$(echo "$var_list" | sed "/^ *$/d")
  echo "$list" | while read line
  do
      key=$(echo "$line" | cut -d "=" -f 1)
      eval "echo $key=\$$key"
  done
}
# fun usage
# var_list_val_out

todo_var_to_update=$(cat<<EOF
$todo_var_to_update
PRIVITE_KEY_FILE_NAME=SSH_PRI_KEY_FILE_NAME
PRIVITE_KEY_FILE_PATH=SSH_PRI_KEY_FILE_PATH
SSH_SERVER_IP=
SSH_SERVER_USER=SSH_USER_NAME
PUBLIC_KEY_FILE_NAME=SSH_PUB_KEY_FILE_NAME
var_to_add=SSH_SERVER_PORT
var_to_add=SSH_USER_NOTE
var_to_add=SSH_USER_MAIL
var_to_add=SSH_KEY_PASSPHRASE
var_to_add=SSH_USER_PASSPHRASE
var_to_add=SSH_KEY_TYPE
EOF
)

todo_fun_to_update=$(cat<<EOF
$todo_fun_to_update
fun_to_add=ssh_var_ini
fun_to_add=ssh_var_cal
ssh_secret_key_list=ssh_sec_key_list
ssh_secret_key_gen=ssh_sec_key_gen
ssh_key_check=ssh_sec_key_has
print_ssh_to_vm=ssh_to_vm_note_out
print_scp_to_vm=scp_to_vm_note_out
EOF
)

todo_lan_to_update=$(cat<<EOF
$todo_lan_to_update
lang_to_add=en
EOF
)

# out src index sh file path
#echo "${SRC_PATH}/index.sh"

# file usage
# sample/tom/app.add.sh
# sample/tom/app.add.sh "192.168.56.3" "root" "20-06-16" ~/.ssh/
# sample/tom/app.add.sh "$SSH_SERVER_IP" "$SSH_USER_NAME" "$SSH_KEY_FILE_NAME" "$SSH_PRI_KEY_FILE_PATH"