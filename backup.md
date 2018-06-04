# Backup using restic and backblaze
This setup will set up a backup sollution with 7/5/12 retention policy for the snapshots. By taging the backups you can also do separate snapshots that will not be deleted by the automatic backup script.

## Setup
- Create a repository in the backblaze admin ui.
Create the following files
### /etc/backup-env
Place your account id, key and the name of the container below.
Add the folders you want to backup in the `BACKUP_FOLDERS` variable.
```
#!/bin/bash
export B2_ACCOUNT_ID="<backblaze account id>"
export B2_ACCOUNT_KEY="<backblaze_account_key>"
export RESTIC_REPOSITORY="b2:<repository name>"
export RESTIC_PASSWORD_FILE="/etc/backup.pwd"
export BACKUP_FOLDERS="/etc /home"
export BACKUP_RETENTION="--keep-daily 7 --keep-weekly 5 --keep-monthly 12"
export BACKUP_TAG="automated_backup"
```

### /usr/local/bin/backup.sh
Add the following content to `/usr/local/bin/backup.sh`
```
#!/bin/bash
. /etc/backup-env
restic backup -q --tag $BACKUP_TAG $BACKUP_FOLDERS
restic forget -q --tag $BACKUP_TAG $BACKUP_RETENTION --prune
```

### /etc/backup.pwd
- Create the file `/etc/backup.pwd` and put a long and nice password here.
- Make shure its read only for the root user.
```
echo "verYlong1p4sSw0rDf0RUrb4cKupZ" > /etc/backup.pwd
chown root:root /etc/backup.pwd
chmod 0600 /etc/backup.pwd
```

## List snapshots
You can list out the the current snapshots with the following command:
```
$ restic snapshots
repository e981cc1c opened successfully, password is correct
ID        Date                 Host        Tags                  Directory
----------------------------------------------------------------------
964d1002  2018-06-02 00:57:15  server                        ┌── /etc
                                                             └── /home
cc00f1b2  2018-06-04 22:21:38  server                        ┌── /etc
                                                             └── /home
7515d79f  2018-06-04 22:34:27  server      automated_backup  ┌── /etc
                                                             └── /home
----------------------------------------------------------------------
3 snapshots
```

## Do manual backup
You can do a custom backup backup by running the following commands:
```
. /etc/backup-env
restic backup /custom/dir
```
