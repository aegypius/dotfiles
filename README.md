Dotfiles
========

This is my dotfiles storage

## Installation

    bash <(curl -sL https://raw.githubusercontent.com/aegypius/dotfiles/master/bootstrap.bash)

### Using homeshick

```shell
homesick clone aegypius/dotfiles
```

### Extending bash

You can extend everything in ```.bashrc.d``` using a simple file using the following format :
```~/.bash_<bashrc.d filename to extend>```.

For example:

 -  ```~/.bashrc.d/aliases``` is extended with ```~/.bash_aliases```
 -  ```~/.bashrc.d/functions``` is extended with ```~/.bash_functions```
