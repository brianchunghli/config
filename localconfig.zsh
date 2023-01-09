#!/bin/zsh

# macbook config
if [ "$(whoami)" = 'brianli' ]; then
    export PATH="$PATH:/Users/brianli/.scripts/bin/"
    export PYTHONPATH="/Users/brianli/.scripts/lib/"
    # inserts path infront of python path
    for d in "/Users/brianli/.scripts/progs"/*; do
        # load dirs and scripts into bin/
        if [ -z "$(ls $d)" ];then continue; fi;
        for f in $d/*; do
            name=$(basename $f)
            if [ -d "$f" ]; then
                ln -w -F -s -h $f "/Users/brianli/.scripts/bin/$name"
                export PATH="$PATH:/Users/brianli/.scripts/bin/$name"
            else
                # removes '.' suffix
                name=$(sed -E 's/(.*)[.].*/\1/' <<< $(basename $f))
                prog="/Users/brianli/.scripts/bin/$name"
                ln -s -w -f $f $prog
                chmod +x "$prog"
            fi;
        done
    done
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    cse_courses='cse:/import/ravel/4/z3463079/courses'
    courses_folder='~/desktop/.coding/university/COMP'

    # folder aliases
    alias SCRIPTS="cd ~/.scripts"
    alias CODING="cd ~/desktop/.coding"
    alias DOCS="cd ~/Documents/"
    alias PROGRAMMING="cd ~/Documents/programming/"
    alias CSE="cd ~/cse/courses"
    alias CSELOCAL="cd ~/unsw/cse"
    alias LOCALCOMP="cd ~/desktop/.coding/university/COMP"
    alias yabai_config="nvim ~/.config/yabai/yabairc"
    alias sbar_config="nvim ~/.config/sketchybar/sketchybarrc"
    alias luaConfig="nvim ~/.config/nvim/lua/brianli-mac/"
    alias luaConfig1="nvim ~/.config/nvim/after/plugin/"
    alias zshConfig="nvim ~/.config/localconfig.zsh"
    alias utils="cd ~/.scripts/progs/util/"

    # general aliases
    alias hosthttp='python3 -m http.server'
    alias SSH-KEY1="cat ~/.ssh/id_rsa.pub"
    alias SSH-KEY2="cat ~/.ssh/id_ed25519.pub"
    alias firefox="open -a firefox"
    alias chrome="open -a chrome"
    alias google="cd /Users/brianli/'Google Drive'/'My Drive'/"

    # c++
    alias cmakeinit='cmake -S . -B build/'
    alias cmakebuild='cmake --build build/'

    # SSHFS FOR UNSW
    _SSHFS_ZID=z3463079
    _SSHFS_CSE_MOUNT="$HOME/cse"
    alias csemount="sshfs -o kill_on_unmount,reconnect,idmap=user -C ${_SSHFS_ZID}@login${_SSHFS_ZID: -1}.cse.unsw.edu.au: ${_SSHFS_CSE_MOUNT}"
    alias cseunmount="umount ${_SSHFS_CSE_MOUNT}"
    alias cseinit="cd; cseunmount; csemount;"

    export LSCOLORS='fxxxxxxxGxxxxxabagacxx'
    conda activate general

fi;
