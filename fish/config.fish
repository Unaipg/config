alias python=python3

export VIRTUAL_ENV_DISABLE_PROMPT=yeah!
set -g theme_display_virtualenv yes
set -g theme_display_date no
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
export EDITOR=vim

function fish_greeting
    echo "Proletarios del mundo, uníos!"
    neofetch
    fortune
end

funcsave fish_greeting

function django
    python manage.py $argv
end
funcsave django
