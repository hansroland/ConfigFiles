### Config Files

This repository contains save copies of my different configuration files.

#### How is it done?

In a main directory *ConfigFiles* I have for each of my operating systems a subdirectory.

eg
  * ubuntu
  * nixos

Below of these OS subdirectories I map the directory structure of the specified OS,
but of course only those directories that contain a config file I want to save.
In these shadow directories I add with the linux **ln** command a hard link to the real config file.

When one of the real config files changes, the *git status* sees the change in the 
subdirectories of ConfigFiles. This then allows me to commit/save the changes to Github.
