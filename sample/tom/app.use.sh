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
SSH_SERVER_IP="192.168.56.18"
SSH_USER_NAME=root
SSH_KEY_FILE_NAME=$(date "+%y-%m-%d") #$(date "+%y-%m-%d") #$(date "+%Y-%m-%d")
SSH_PRI_KEY_FILE_PATH=~/.ssh/

# cnf from arg
[ "$1" ] && SSH_SERVER_IP="$1" ; [ -z "$SSH_SERVER_IP" ] && SSH_SERVER_IP="192.168.56.13"
[ "$2" ] && SSH_USER_NAME="$2" ; [ -z "$SSH_USER_NAME" ] && SSH_USER_NAME=root
[ "$3" ] && SSH_KEY_FILE_NAME="$3" ; [ -z "$SSH_KEY_FILE_NAME" ] && SSH_KEY_FILE_NAME=$(date "+%y-%m-%d")
[ "$4" ] && SSH_PRI_KEY_FILE_PATH="$4" ; [ -z "$SSH_PRI_KEY_FILE_PATH" ] && SSH_PRI_KEY_FILE_PATH=~/.ssh/
[ "$5" ] && SSH_SERVER_PORT="$5" ; [ -z "$SSH_SERVER_PORT" ] && SSH_SERVER_PORT=22

#ssh_var_config "192.168.56.18" "root" "20-06-25" ~/.ssh/
#ssh_var_config "$SSH_SERVER_IP" "$SSH_USER_NAME" "2020-10-02" "$SSH_PRI_KEY_FILE_PATH" $SSH_SERVER_PORT
ssh_var_config "$SSH_SERVER_IP" "$SSH_USER_NAME" "$SSH_KEY_FILE_NAME" "$SSH_PRI_KEY_FILE_PATH" $SSH_SERVER_PORT

# prepare for using
#ssh_pub_key_upload
#ssh_pub_key_copy_id_to_ms
#ssh_pub_key_copy_id_to_ms_by_expect0
#ssh_pub_key_copy_id_to_ms_by_expect
#ssh_pri_key_push
#ssh_pri_key_add_to_known_host

# case: tell ssh to login ms with some ip,port,user,key . eg: login ms without -i ssh root@192.168.56.18 -P 22
#

# case: copy key files to some ms
#ssh_all_key_scp_to_ms

# case: copy some files to some ms
#scp_to_vm

# case: login some ms
#ssh_pto_vm
#ssh_pto_vm_expect
ssh_to_vm

#print_ssh_to_vm
#print_scp_to_vm


# file usage
# sample/tom/app.use.sh
# sample/tom/app.use.sh "192.168.56.18" "root" "20-06-25" ~/.ssh/ 22
# sample/tom/app.use.sh "$SSH_SERVER_IP" "$SSH_USER_NAME" "$SSH_KEY_FILE_NAME" "$SSH_PRI_KEY_FILE_PATH" $SSH_SERVER_PORT
