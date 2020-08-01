# sh lib ssh
## desc

some function to curd ssh for ymc shell lib

## deps

```sh
list=$(ls sh_modules) ; echo "$list" | sed "s/^ */- [x] /g"
list=$(ls sh_modules) ; echo "$list" | sed "s/^ */- [ ] /g"
```

### dev

- [ ] sh-lib-path-resolve.sh
- [x] sh-lib-project-dir-map.sh
- [x] sh-lib-load-lib.sh
- [ ] sh-lib-lang.sh
- [x] sh-lib-gpg.sh

### tes

- [ ] sh-lib-path-resolve.sh
- [x] sh-lib-project-dir-map.sh
- [x] sh-lib-load-lib.sh
- [ ] sh-lib-lang.sh
- [ ] sh-lib-test.sh
- [ ] sh-lib-time-cost.sh

### pro

- [ ] sh-lib-gpg.sh
- [ ] sh-lib-lang.sh
- [ ] sh-lib-load-lib.sh
- [ ] sh-lib-path-resolve.sh
- [ ] sh-lib-project-dir-map.sh
- [ ] sh-lib-project-path-get.sh
- [ ] sh-lib-test.sh
- [ ] sh-lib-this-file.sh
- [ ] sh-lib-time-cost.sh
- [ ] sh-lib-txt-part.sh
- [ ] sh-lib-var-list.sh

### sam

- [ ] sh-lib-path-resolve.sh
- [x] sh-lib-project-dir-map.sh
- [x] sh-lib-load-lib.sh
- [ ] sh-lib-lang.sh


## apis

- [x] ssh_var_config
- [x] ssh_var_caculate
- [x] ssh_secret_key_list
- [x] ssh_secret_key_list_some
- [x] ssh_secret_key_gen
- [x] ssh_secret_key_del
- [x] ssh_secret_key_get
- [x] ssh_key_check
- [x] ssh_pub_key_get
- [x] ssh_pub_key_copy
- [x] ssh_pub_key_upload
- [x] ssh_pub_key_copy_id_to_ms
- [x] ssh_pub_key_copy_id_to_ms_by_expect0
- [x] ssh_pub_key_copy_id_to_ms_by_expect
- [x] ssh_pri_key_get
- [x] ssh_pri_key_push
- [x] ssh_pri_key_add_to_known_host
- [x] ssh_pto_vm
- [x] ssh_pto_vm_expect
- [x] ssh_to_vm
- [x] print_ssh_to_vm
- [x] ssh_all_key_scp_to_ms
- [x] scp_to_vm
- [x] print_scp_to_vm
- [x] ssh_config_file_add

```sh
cat src/index.sh |  grep "function " | sed "s/function */- [x] /g"  | sed "s/(.*) *{//g"
```

## feats

- [x] basic curd ssh
- [x] git push with ssh

## usage

### how to use for poduction?

```sh
# get the code

# run the index file
# ./src/index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage

```

### how to use for developer?

```sh
# get the code

# run test
# ./test/index.sh
#2 get some fail test
# ./test/index.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
