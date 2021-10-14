# Dotfiles

Install script based from [holman/dotfiles](https://github.com/holman/dotfiles/blob/master/script/bootstrap)

Run `install.sh` to install dotfiles.

`/app-configs/` contains application specific config files such as keymaps.

`/applications/` contains desktop entries for applications.

`/bin/` contains custom user scripts.

## Make bash autocomplete case insensitive

For current user:

- Create `~/.inputrc` if it doesn't exist:

  ```
  if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrf; fi
  ```
- ```
  echo 'set completion-ignore-case on' >> ~/.inputrc
  ```

Systemwide:

- ```
  echo 'set completion-ignore-case on' >> /etc/inputrc
  ```
  (if sudo access needed:)
  ```
  echo 'set completion-ignore-case on' | sudo tee -a /etc/inputrc
  ```