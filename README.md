# silverstripe-quick-installer

## Introduction

Automate your SilverStripe install, DB setup, hosts file entry, build in just one command!

Please note this script is intended for MAMP & Mac users only. Script and file path changes required for Windows/Linux machines.

Windows & XAMPP users can use GIT bash for executing the script. Make sure to update file paths. You may need to add mysql $PATH to GIT bash. You can find reference to do this in the below link

https://stackoverflow.com/questions/11801941/git-bash-on-windows-7-mysqldump-command-is-not-working

## Requirements

* MAMP
* Composer
* PHP

## Installation

```
Download quick.sh

Place it in htdocs folder

example - 
/Applications/MAMP/htdocs/
```
## Execution

```
./quick.sh DirectoryName SilverStripeVersion DBName mysqlUser mysqlPassword hostName

example -
./quick.sh trynew 4.2.1 newdb root root trynew.localhost
```

## Screenprints

![Screenprints](https://raw.githubusercontent.com/beanjuice/silverstripe-quick-installer/master/quick-installer.png)


![Screenprints](https://raw.githubusercontent.com/beanjuice/silverstripe-quick-installer/master/quick-installer-02.png)


![Screenprints](https://raw.githubusercontent.com/beanjuice/silverstripe-quick-installer/master/localhost-site.png)

