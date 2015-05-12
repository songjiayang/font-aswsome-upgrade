# font-aswsome-upgrade
Helps you upgrade your  font-aswsome from 3.x :arrow_right: 4.x (ruby way). It works well for files with diffrent extname, such as .css,.sass,.haml,.slim, .skim

### Using

* 1 `$ git clone git@github.com:songjiayang/font-aswsome-upgrade.git`
* 2 `$ cd font-aswsome-upgrade`
* 3 `$ ruby upgrade.rb PATH_TO_PROJECT_DIR`

### How it works
* 1 Get all the change rules from ./data/changes.json
* 2. TransferMachine can transfer old icon to new one.
* 2 List all the files in PATH_TO_PROJECT_DIR, replace the old icons with the right way. 

### Thanks 
* 1 Wiki [Upgrading-from-3.2.1-to-4](https://github.com/FortAwesome/Font-Awesome/wiki/Upgrading-from-3.2.1-to-4) list all the change rules.
* 2 Inspired by [Marionette.Upgrade](https://github.com/marionettejs/Marionette.Upgrade)
