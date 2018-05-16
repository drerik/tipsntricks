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
ansible-playbook -i hosts playbook.yml --list-hosts
```

### Limit a ansible-playbook to a group or a spesific list for nameservers
This examples will limit the orchestartion to a group in the inventory file, comma seperated list or a single host from the Inventory
```
ansible-playbook -i hosts playbook.yml --limit servergroup|host|host1,host2,host3
```

### Get all facts from you hosts
```
ansible -i ../../hosts  all -m setup
```


## Ansible templating
Templating doc: http://jinja.pocoo.org/
