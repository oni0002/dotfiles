set fish_prompt_pwd_dir_length 1

set __fish_git_prompt_showdirtystates true
set __fish_git_prompt_showupstream true
set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_color brblack
set __fish_git_prompt_color_dirtystate brblack
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream cyan
set __fish_git_prompt_color_invalidstate red


function fish_prompt
    set -l last_status $status
    # colors
    set -l red (set_color -o red)
    set -l cyan (set_color -o cyan)
    set -l magenta (set_color -o magenta)
    set -l brblack (set_color brblack)
    set -l normal (set_color normal)

    set -l arrow ➜

    if test $last_status -ne 0
        set arrow_color $red
    else
        set arrow_color $magenta
    end

    if test -n "$SSH_CONNECTION"
        set ssh "$hostname"
    end

    # line1
    echo -n $cyan(prompt_pwd) $normal
    __fish_git_prompt
    echo
    # line2
    echo -n $brblack$ssh $normal
    echo -n $arrow_color$arrow $normal
end
