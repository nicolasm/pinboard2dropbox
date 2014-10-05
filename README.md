pinboard2dropbox
================

Create an encrypted backup of your Pinboard.in bookmarks to Dropbox.

## How does it work?

* Retrieves path to Dropbox.
* Retrieves Pinboard.in api token from .netrc.
* Retrieves json file with bookmarks.
* Encrypts json file to Dropbox.

## How to install?

* Execute deploy.sh (copies script to "~/Library/Scripts/Applications/Pinboard/").
* Get the common-scripts repository and execute deploy.sh.

## How to setup?

* Add a pinboard.in entry with your api token (username:token) to your .netrc in your home folder.
```
machine pinboard.in
        login username
        password token
```
* Create a .backup folder in your home.
* Write your passphrase in a .passphrase.txt file inside that folder.
* Cron the backup_bookmrks.sh script.
* I use a Hazel rule that cleans old backups.

## Requirements

* Python
* Dropbox
* Pinboard.in account