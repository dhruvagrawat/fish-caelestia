#####################################
##==> Environment Variables
#####################################
function shenv; set -gx $argv; end
source ~/.env

#####################################
##==> Aliases
#####################################
alias cty='tty-clock -S -c -C 6 -t -n -D'
alias fucking='sudo'
alias n='nvim'
alias t='tmux'
alias ta='tmux attach'
alias tl='tmux ls'
alias cd..='cd ..'
alias gc='git clone '
alias ga='git add .'
alias gcm='git commit -m '
alias yeet='git push -u origin main'
alias gs='git status'
alias ll='ls -Alh'
alias ls='lsd --group-dirs first'
alias cat='bat'
alias gc='g++ -o o'
alias py='python3'
alias up='sudo pacman -Syu'
alias upy='yay -Syu'
alias clean='yay -Yc'
alias meow="showcat_random"

# Short aliases for brightness on second monitor (card 1)
alias b0='ddcutil -d 1 setvcp 10 0'
alias b1='ddcutil -d 1 setvcp 10 1'
alias b10='ddcutil -d 1 setvcp 10 10'
alias b20='ddcutil -d 1 setvcp 10 20'
alias b30='ddcutil -d 1 setvcp 10 30'
alias b40='ddcutil -d 1 setvcp 10 40'
alias b50='ddcutil -d 1 setvcp 10 50'
alias b60='ddcutil -d 1 setvcp 10 60'
alias b70='ddcutil -d 1 setvcp 10 70'
alias b80='ddcutil -d 1 setvcp 10 80'
alias b90='ddcutil -d 1 setvcp 10 90'
alias b100='ddcutil -d 1 setvcp 10 100'

#####################################
##==> Custom Functions
#####################################
function wget
    command wget --hsts-file="$XDG_DATA_HOME/wget-hsts" $argv
end

function nvidia-settings
    mkdir -p $XDG_CONFIG_HOME/nvidia/
    command nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings" $argv
end

function showcat_random
    # Local folder with cat images
    set cat_dir ~/.local/share/cats
    set cats (ls $cat_dir/cat_*.jpg 2>/dev/null)

    if test (count $cats) -gt 0
        set choice (random 1 (count $cats))
        set chosen $cats[$choice]

        # Only display if kitty is installed
        if type -q kitty
            # Adjust size here: 100x40 (width x height) with padding
            kitty +kitten icat --align center --place 100x40@0x0 $chosen
        end
    end
end




#####################################
##==> Interactive Session Settings
#####################################
if status is-interactive
    # Starship prompt
    starship init fish | source

    # Jump between prompts in foot/kitty
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    # Source only greeting
    if test -f ~/.config/fish/greeting.fish
        source ~/.config/fish/greeting.fish
    end
end

#####################################
##==> Development Tools
#####################################
pyenv init - | source

fish_add_path /home/anto/.spicetify
