# Automate zsh setup
My zsh configuration script
</br>
<img height="400" src="https://user-images.githubusercontent.com/43048524/130137400-684a2034-a070-4abc-a0ea-652fa41d3beb.png" />


### Dependencies
- unzip
- curl
- git
- zsh

### Installation
```
$ curl https://raw.githubusercontent.com/mich4ld/zsh-setup/main/setup.sh | bash
```

Without prompt for installing fonts:
```
curl https://raw.githubusercontent.com/mich4ld/zsh-setup/main/setup.sh | bash -s -- --no-fonts
```

Install fonts without asking:
```
curl https://raw.githubusercontent.com/mich4ld/zsh-setup/main/setup.sh | bash -s -- --install-fonts
```

Tested with:
- Android (with `Termux`)
- Arch
- Manjaro
