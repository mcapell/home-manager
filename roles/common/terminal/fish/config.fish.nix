{ pkgs, fish, ... }:

''
# Fish's built-in Nord theme, managed here rather than as universal variables.
set -g fish_color_autosuggestion 4c566a
set -g fish_color_cancel --reverse
set -g fish_color_command 88c0d0
set -g fish_color_comment 4c566a --italics
set -g fish_color_cwd 5e81ac
set -g fish_color_cwd_root bf616a
set -g fish_color_end 81a1c1
set -g fish_color_error bf616a
set -g fish_color_escape ebcb8b
set -g fish_color_history_current e5e9f0 --bold
set -g fish_color_host a3be8c
set -g fish_color_host_remote ebcb8b
set -g fish_color_keyword 81a1c1
set -g fish_color_normal --reset
set -g fish_color_operator 81a1c1
set -g fish_color_option 8fbcbb
set -g fish_color_param d8dee9
set -g fish_color_quote a3be8c
set -g fish_color_redirection b48ead --bold
set -g fish_color_search_match --background=434c5e --bold
set -g fish_color_selection d8dee9 --background=434c5e --bold
set -g fish_color_status bf616a
set -g fish_color_user a3be8c
set -g fish_color_valid_path --underline
set -g fish_pager_color_completion e5e9f0
set -g fish_pager_color_description ebcb8b --italics
set -g fish_pager_color_prefix --bold --underline
set -g fish_pager_color_progress 3b4252 --background=d08770 --bold
set -g fish_pager_color_selected_background --background=434c5e

# git prompt settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_dirtystate "✗"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_branch cyan --dim --italics

# Set standard language and localization
export LC_ALL=C

export EDITOR="nvim"
export GOBIN="$HOME/.local/bin"
export PATH="$HOME/.node/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/opt/homebrew/bin:$GOBIN:$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
export CGO_ENABLED=0
export SHELL="${fish}/bin/fish"

# Enable direnv
direnv hook fish | source

# Random aliases
alias vim="nvim"
alias emacs="nvim"
alias gs="git status -s"
alias gss="git status | grep -v vendor/"
alias ll="ls -al"
alias grep='grep --color=auto'
alias ping='ping -c 5'
alias rm='rm -i'
alias wl="vim ~/.worklog"

# LLM aliases
alias llmf='llm -m gemini-2.5-flash'

function _prompt_is_git_fork
    # Check if we are inside a Git repository's work tree
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
        git remote -v | grep -q 'upstream' && return 0
    end
    return 1
end

function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)

    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    if [ $PWD != $HOME ]
        set_color yellow
        echo -n (prompt_pwd)
    end
    set_color normal

    # Check if the current directory is a git fork
    if _prompt_is_git_fork
      printf ' '
    end

    printf '%s ' (__fish_git_prompt)
    echo -n (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    set_color normal
    echo -n '$ '
end

function fish_greeting
    set_color normal
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if [ "$TERM" = "xterm-ghostty" ]
        # Launch zellij
        if not set -q ZELLIJ
            zellij attach -c default
        end
    end
end
''
