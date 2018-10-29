## Configuration

ansible.cfg configuration file

```
[defaults]
hash_behaviour=merge
roles_path = external_roles
gathering = smart

[ssh_connection]
pipelining = False # On some hosts only
ssh_args = -o ControlMaster=auto -o ControlPersist=60s
control_path = /tmp/ansible-ssh-%%h-%%p-%%r
```

