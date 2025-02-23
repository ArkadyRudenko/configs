if status is-interactive
    # Commands to run in interactive sessions can go here
end

# custom greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
  (set_color normal)"fish $FISH_VERSION" \
  (set_color normal)"| $KERNEL"

function fish_user_key_bindings
  fish_vi_key_bindings

  # set kj to <Esc>
  bind -M insert -m default kj backward-char force-repaint
end

# UNCOMMENT FOR RIGHT PROMPT
# function fish_right_prompt
#   echo (set_color 71717a)"$USER"@(prompt_hostname)
# end

# indicator for vi
function fish_mode_prompt
  switch "$fish_bind_mode"
    case "default"
      echo -n (set_color --bold f43f5e)"N"
    case "insert"
      echo -n (set_color --bold 84cc16)"I"
    case "visual"
      echo -n (set_color --bold 8b5cf6)"V"
    case "*"
      echo -n (set_color --bold)"?"
   end

  echo -n " "
end

# custom prompt
function fish_prompt
  set_color --bold 4086ef

  set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 34c970))

  echo -n $transformed_pwd

  # git branch
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    #space
    echo -n " "

    echo -n (set_color --bold 4338ca)"("

    set_color f0abfc
    echo -n (git branch --show-current)

    echo -n (set_color --bold 4338ca)")"
    set_color normal
  end

  # space
  echo -n " "

  # arrows
  # echo -n (set_color --bold efcf40)"❱"
  # echo -n (set_color --bold ef9540)"❱"
  # echo -n (set_color --bold ea3838)"❱"

  echo -n (set_color --bold 14b8a6)"→"

  #space
  echo -n " "

  set_color normal
end

# set environment variables
set -x PATH $PATH:/usr/local/bin:/opt/bin

# set editor
set -x EDITOR "nvim"

set QT_QPA_PLATFORM xcb

# fzf
# export FZF_DEFAULT_OPTS="
# --bind='ctrl-j:down,ctrl-k:up,ctrl-t:toggle-all,ctrl-v:toggle-preview,ctrl-space:toggle-preview'
# --color=fg:#ffffff,hl:#00ff00,fg+:#a5b4fc,bg+:#737373,hl+:#ffff00,info:#14b8a6,spinner:#00ffff,pointer:#f59e0b
# "

# alias ls "eza --icons"
alias treelist "tree -a -I '.git'"

# TokyoNight Color Palette from https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_storm.fish
set -l foreground c0caf5
# changed from default
set -l selection 6366f1
# changed from default
set -l comment 737373
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

# cargo
set -gx PATH $HOME/.cargo/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

zoxide init fish | source



# ---------------------------- MY ---------------------------------
alias v="nvim"
alias at="arc st"
alias ab="arc branch"
alias ad="arc add ."
alias di="arc diff"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias c="clear"
alias us="cd ~/arcadia/taxi/uservices/userver"
alias core="cd ~/arcadia/taxi/uservices/userver/core"
alias gr="cd ~/arcadia/taxi/uservices/userver/grpc"
alias pg="cd ~/arcadia/taxi/uservices/userver/postgresql"
alias univ="cd ~/arcadia/taxi/uservices/userver/universal"
alias ser="cd ~/arcadia/taxi/uservices/services"
alias lib="cd ~/arcadia/taxi/uservices/libraries"
alias ar="cd ~/arcadia/"
alias nik="cd /home/arudenko02/dev/rust/acos/nikka-public/kernel"
alias f="ya tool tt format"

alias gt="git status"
alias gd="git add ."

set PATH /home/arudenko02/dev/cpp/wrk/ $PATH
set PATH /home/arudenko02/arcadia/taxi/uservices/scripts/userver/speedup/ $PATH
set PATH /home/arudenko02/dev/cpp/ClangBuildAnalyzer/build_debug $PATH
set PATH /home/arudenko02/go/bin $PATH
set PATH /home/arudenko02/dev/rust/maelstrom_test/maelstrom $PATH
