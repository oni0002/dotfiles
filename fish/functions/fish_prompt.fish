set fish_prompt_pwd_dir_length 1
set __fish_git_prompt_show_informative_status 1

set fish_color_command green
set fish_color_param $fish_color_normal

set __fish_git_prompt_showdirtystates true
set __fish_git_prompt_showupstream true

set __fish_git_prompt_color_branch brown
set __fish_git_prompt_color_dirtystate brwhite
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream cyan
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_invalidstate red

set __fish_git_prompt_char_stateseparator ' '

function fish_prompt
    set -l last_status $status
    # colors
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)

    if not set -q __fish_prompt_char
        set -l pc ""
        switch (id -u)
          case 0
            set pc $pc'#'
          case '*'
            set pc $pc'>'
        end
        set -g __fish_prompt_char $pc
    end

    set -l pcolor $green
    if test $last_status -ne 0
      set pcolor $red
    end

    # line1
    echo -n $cyan(prompt_pwd)$normal
    __fish_git_prompt
    echo
    # line2
    echo -n $pcolor$__fish_prompt_char $normal
end
