# Memo

## Note

dotfile のロード順序について

### ログインシェルの場合 (--login オプション付き)

以下の順序で読まれる。

     /etc/profile
   - ~/.bash_profile
   - ~/.bash_login   (.bash_profile がない場合)
   - ~/.profile      (.bash_profile/.bash_loginがない場合)

ただし、--noprofile オプションをつけた場合は一切読まれない。

### 非ログイン・インタラクティブシェルの場合

以下の順序で読まれる。

 - /etc/bash.bashrc
 - ~/.bashrc

### 非ログイン・非インタラクティブシェルの場合 (スクリプト起動時)

一切読まれない。
crontab からの起動時などもこれ。

## 運用

通常は .bash_profile から .bashrc を読み込むようにする。
こうするとインタラクティブシェルでは常に .bashrc が読まれる。

.bash_profile には、ログイン時に一回だけ行う処理を書く。
具体的には、

  - PATH 設定
  - LANG 設定
  - rvm
  - keychain

それ以外のものは .bashrc へ。

## crontab などからの起動

この場合、PATH や rvm の設定が行われない。

## tmux on rhel7/centos7

sudo yum install libevent-devel
git clone https://github.com/tmux/tmux
cd tmux
./autogen.sh
./configure
make
sudo make install
