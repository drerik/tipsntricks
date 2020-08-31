# Tips and tricks on gitlab

## Check if ldap sync is working

```bash
gitlab-rake gitlab:ldap:check
```

In a gitlab container

```bash
docker exec -it gitlab_gitlab_1 gitlab-rake gitlab:ldap:check
```
