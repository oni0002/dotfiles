set fish_prompt_pwd_dir_length 1
set -g VIRTUAL_ENV_DISABLE_PROMPT true

set __fish_git_prompt_showdirtystates true
set __fish_git_prompt_showupstream true
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_showcolorhints true
set __fish_git_prompt_char_stateseparator ' '

function fish_prompt
    set -l last_status $status
    # colors
    set -l red (set_color -o red)
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l brblack (set_color brblack)
    set -l normal (set_color normal)

    set -l suffix "~(=^._.^)?"

    if test $last_status -ne 0
        set suffix "~(=^-_-^)!?"
        set sfx_color $red
    else
        set suffix "@(=^._.^)?"
        set sfx_color $yellow
    end

    if test $SSH_CONNECTION
        set ssh "$hostname"
    end

    if test $VIRTUAL_ENV
        set venv (basename $VIRTUAL_ENV)
    end

    # line1
    echo
    echo -n $brblack$ssh $normal
    echo -n $cyan(prompt_pwd) $normal
    __fish_git_prompt
    echo

    # line2
    echo -n $brblack$venv $normal
    echo -n $sfx_color$suffix $normal
end
