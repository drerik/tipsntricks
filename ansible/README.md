# Ansible tips and tricks
## Doc links
- Modules: http://docs.ansible.com/ansible/latest/modules/modules_by_category.html

## ansible-playbooks commands
- Inventory file is `hosts`
-
### List tasks
```
ansible-playbook -i hosts playbook.yml --list-tasks
```

### List hosts
```
ansible-playbook -i hosts.yml playbook.yml --list-hosts
```

### Limit a ansible-playbook to a group or a spesific list for nameservers
This examples will limit the orchestartion to a group in the inventory file, comma seperated list or a single host from the Inventory
```
ansible-playbook -i hosts playbook.yml --limit servergroup|host|host1,host2,host3
```

### Get all facts from you hosts
```
ansible -i hosts  all -m setup
```

## Task tips

### Run a command and output stderr
```
- name: Get proxmox version
  tags:
    - get_proxmox_version
  shell: pveversion
  register: pveversion

- name: Print proxmox version
  tags:
    - get_proxmox_version
  debug:
    msg: "{{ pveversion.stdout }}"
```
### Do preety debug output
```
- name: Output std.out of registred_result
  debug:
    msg: "{{ registred_result.stdout.split('\n') }}" 
```

## Ansible templating
Templating doc: http://jinja.pocoo.org/

## Force a playbook to have a --limit set when executed
```
- name: Upgrade cyberark admin servers
  hosts: lab-cyberark*
  tasks:
    - name: Fail a task if limit is not set
      fail:
        msg: "you must use -l or --limit"
      when: ansible_limit is not defined
      run_once: true
 ```

## Run a module ad-hoc

You can run a module ad-hoc on a system registered in your inventory.

```bash
ansible -i hosts myserver -m win_service -a "name=telegraf state=restarted"
```

Se the ansible doc for more information on ad-hoc commands: https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html


## Show vault string_encryptet password for a host

```bash
ansible localhost -m debug -a var='ansible_password' -e '@inventory/host_vars/myserver.yml' --ask-pass
```
## Create vault encrypted varable

```bash
echo -n 'supersecret string' | ansible-vault encrypt_string --stdin-name 'super_secret_variable'
```

## Write content of a inventory variable to file

```yaml
- name: Write variable to file
  copy:
    dest: /etc/output_file.yml
    content: "{{ variable_to_save | to_nice_yaml( width=2000, explicit_start=True, explicit_end=True) }}"
``` 
