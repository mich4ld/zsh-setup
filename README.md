# Automate zsh setup
My zsh configuration script

### Dependencies
- unzip
- curl
- git
- zsh

### Installation
```
$ curl https://raw.githubusercontent.com/mich4ld/zsh-setup/main/setup.sh | sh
```

Without prompt for installing fonts:
```
curl https://raw.githubusercontent.com/mich4ld/zsh-setup/main/setup.sh | sh -s -- --no-fonts
```

Install fonts without asking:
```
curl https://raw.githubusercontent.com/mich4ld/zsh-setup/main/setup.sh | sh -s -- --install-fonts
```

Tested with:
- Arch
- Manjaro
