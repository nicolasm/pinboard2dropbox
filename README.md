pinboard2dropbox
================

* Backup your Pinboard.in bookmarks to Dropbox.
* File is encrypted.

## How does it work?

* Retrieves path to Dropbox.
* Retrieves Pinboard.in api token from .netrc.
* Retrieves json file with bookmarks.
* Encrypts json file to Dropbox.

## How to install?

* Copy the backup_bookmarks.sh script to "~/Library/Scripts/Applications/Pinboard/".
* Get the common-scripts repository and execute deploy.sh.

## How to setup?

* Add a pinboard.in entry with your api token to your .netrc in your home folder.
```
machine pinboard.in
        login username
        password token
```
* Create a .backup folder in your home.
* Write your passphrase in a .passphrase.txt file inside that folder.
* Cron the backup_bookmrks.sh script.
* I use a Hazel rule that clean old backups.

## Requirements

* Python
* Dropbox