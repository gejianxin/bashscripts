#####################chocolatey start##########################
# 设置安全策略
Set-ExecutionPolicy AllSigned
# 安装包管理器 chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# 安装常用软件
choco install -y git
choco install -y autohotkey emacs youtube-dl zotero

# 更多常用软件
choco install -y calibre gimp olive-editor plantuml postman potplayer putty quicklook steam sumatrapdf uplay vscode

# 安装 docker
choco install -y docker-desktop
# 不建议直接安装，建议采用 docker 镜像方式安装
# choco install -y nodejs postgresql python r sbcl

# 不建议直接安装，建议下载使用免安装程序
# choco install -y ffmpeg totalcommander trojan vim
#####################chocolatey end##########################




#####################scoop start##########################

# 安装包管理器 scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# 安装常用工具
scoop install aria2 7zip

# 安装常用工具
scoop install git
# 安装完 git 后可以启用 extra 仓库
scoop bucket add extras
# 启用 extra 仓库后可以安装更多工具
scoop install -y autohotkey emacs youtube-dl zotero

# 更多常用软件
scoop install -y calibre gimp olive-editor plantuml postman potplayer putty quicklook steam sumatrapdf uplay vscode

# 安装docker
scoop install docker
# 不建议直接安装，建议采用 docker 镜像方式安装
# scoop install nodejs postgresql python r sbcl

# 不建议直接安装，建议下载使用免安装程序
# scoop install ffmpeg trojan vim
#####################scoop end##########################