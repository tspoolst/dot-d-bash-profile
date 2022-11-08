# dot-d-bash-profile
.d style bash profile works with darwin (aka. macos), linux, and others if you create a directory to match your "uname -s" entry.

### generic install:
```
ln -s <your path to>/dot-d-bash-profile/.bash_profile.d ${HOME}/
add the line
  ". ~/.bash_profile.d/main.sh"
to the bottom of your .bash_profile
```

### cygwin install:
```
::run in an admin cmd shell.
::change to home because admin cmd opens to C:\windows\system32
cd %HOMEPATH%
::if cygwin is already installed, cd to c:\cygwin64
if exist c:\cygwin64 cd c:\cygwin64
::download cygwin setup tool
powershell -c  [Net.ServicePointManager]::SecurityProtocol = 'tls12';Invoke-WebRequest "https://www.cygwin.com/setup-x86_64.exe" -OutFile "setup-x86_64.exe" -UseBasicParsing
::do a base install of cygwin
setup-x86_64.exe -q -d -P ncdu,mc,tree,wget,curl,git,jq,python3,bsdtar,zip,unzip --site https://mirror.steadfast.net/cygwin/ -R c:\cygwin64 -l c:\cygwin64\packages
::move cygwin setup tool to c:\cygwin64 if this is a fresh cygwin install
if not exist c:\cygwin64\setup-x86_64.exe mv setup-x86_64.exe c:\cygwin64\setup-x86_64.exe
c:\cygwin64\bin\bash.exe -l
#install dot-d-bash-profile
mkdir -p git
wget https://github.com/tspoolst/dot-d-bash-profile/archive/refs/heads/master.zip -qO- | bsdtar -xf- -C git
ln -svfd git/dot-d-bash-profile-master/.bash_profile.d ${HOME}/
echo;grep -q '. ~/.bash_profile.d/main.sh' .bashrc && echo "dot-d-bash-profile already added." || { echo "adding dot-d-bash-profile.";echo '. ~/.bash_profile.d/main.sh' >> .bashrc; };echo "to see the changes open a new terminal.";echo
#open a fresh cygwin terminal and enjoy.
```

### git-bash install:
```
mkdir -pv git
powershell -c '[Net.ServicePointManager]::SecurityProtocol = "tls12";Invoke-WebRequest "https://github.com/tspoolst/dot-d-bash-profile/archive/refs/heads/master.zip" -OutFile "dot-d-bash-profile.zip" -UseBasicParsing'
(cd git;unzip -o ../dot-d-bash-profile.zip) && rm -vf dot-d-bash-profile.zip
ln -svfd git/dot-d-bash-profile-master/.bash_profile.d ${HOME}/
[[ ! -e .bash_profile ]] && echo -e 'test -f ~/.profile && . ~/.profile\ntest -f ~/.bashrc && . ~/.bashrc' > .bash_profile
echo;grep -q '. ~/.bash_profile.d/main.sh' .bashrc 2>/dev/null && echo "dot-d-bash-profile already added." || { echo "adding dot-d-bash-profile.";echo '. ~/.bash_profile.d/main.sh' >> .bashrc; };echo "to see the changes open a new terminal.";echo
#open a fresh git-bash terminal and enjoy.
```

### your private/custom stuff:
put those files in .bash_profile.d/user/ and they will be ignored by git.

### other usefull commands:
```
#cygwin apt-cgy install
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin

#pip install
python <(wget https://bootstrap.pypa.io/get-pip.py -qO-)

#cygwin groovy install
##close and open a new terminal for each install command
curl -s get.sdkman.io | bash
sdk install java
sdk install gradle
sdk install groovy
javac --version
gradle -v
groovy --version
```
