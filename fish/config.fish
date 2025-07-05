# alias
function vi
    nvim $argv
end

function ls
    eza --icons=always $argv
end

alias sd "cd ~ && cd (find * -type d | fzf)"

# starship setup
starship init fish | source

# the fuck setup
thefuck --alias | source

# zoxide
zoxide init fish | source
alias cd=z

# neovide
alias vim "/Applications/Neovide.app/Contents/MacOS/neovide"

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -g -x EDITOR nvim

# pnpm
set -gx PNPM_HOME "/Users/chan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
