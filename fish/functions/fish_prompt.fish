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
    set -l red (set_color -o brred)
    set -l blue (set_color -o blue)
    set -l cyan (set_color -o cyan)
    set -l magenta (set_color -o brmagenta)
    set -l normal (set_color normal)

    if test $last_status -ne 0
        set suffix "X"
        set sfx_color $red
    else
        set suffix ">"
        set sfx_color $magenta
    end

    if test $SSH_CONNECTION
        set ssh "$hostname"
    end

    if test $VIRTUAL_ENV
        set venv '('(basename $VIRTUAL_ENV)')'
    end

    # line1
    echo
    echo -n $cyan$ssh $normal
    echo -n $blue(prompt_pwd) $normal
    __fish_git_prompt
    echo

    # line2
    echo -n $venv $normal
    echo -n $sfx_color$suffix $normal
end
