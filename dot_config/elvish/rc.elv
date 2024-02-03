use re
use path
use str
use math
use platform
use readline-binding

# ==========================================
# Functions
# ==========================================
fn have-external { |prog|
  put ?(which $prog >/dev/null 2>&1)
}

fn only-when-external { |prog lambda|
  if (have-external $prog) { $lambda }
}

fn manpdf {|@cmds|
  each {|c|
    man -t $c | open -f -a /System/Applications/Preview.app
  } $cmds
}

fn r {|@a|
  var f = (mktemp)
  if ?(ranger --choosedir=$f $@a) { cd (e:cat $f) }
  rm -f $f
}

fn edit-current-command {
  var temp-file = "/tmp/elvish-edit-command-"$pid".elv"
  print $edit:current-command > $temp-file
  e $temp-file <$path:dev-tty >$path:dev-tty 2>&1
  set edit:current-command = (slurp <$temp-file | str:trim-right (one) "\n")
}

fn alias {|cmd @a| put {|@b| (external $cmd) $@a $@b } }

fn eval-namespace {|&ns=(ns [&]) code|
  eval &ns=$ns &on-end=$put~ $code
}

# ==========================================
# Paths
# ==========================================

var os_paths = []
if (eq $platform:os windows) {
  set os_paths = [
    C:\Windows\System32
    C:\Windows\System32\WindowsPowerShell\v1.0
    C:$E:HOMEPATH\scoop\shims
  ]
} elif (eq $platform:os darwin) {
  set os_paths = [
    /bin
    /usr/bin
    /usr/local/bin
    /opt/homebrew/bin
  ]
} else {
  set os_paths = [
    /bin
    /usr/bin
  ]
}

# Optional paths, add only those that exist
var optpaths = [
  # Local
  ~/.local/bin
  ~/.emacs.d/bin

  # Programs
  ~/.cargo/bin
  ~/.local/share/devbox/global/default/.devbox/nix/profile/default/bin
  
  # usr
  /usr/local/go/bin
  /usr/local/opt/texinfo/bin
  /usr/local/opt/python/libexec/bin
  /usr/local/opt/coreutils/libexec/gnubin
]
var optpaths-filtered = [(each {|p|
      if (path:is-dir $p) { put $p }
} $optpaths)]

set paths = [
  $@os_paths
  $@optpaths-filtered

  # System
  /bin
  /sbin
  /usr/bin
  /usr/sbin
  /usr/local/bin
  /usr/local/sbin
  /opt/homebrew/bin/
]

each {|p|
  if (not (path:is-dir &follow-symlink $p)) {
    echo (styled "Warning: directory "$p" in $paths does not exists!" red bold)
  }
} $paths

if $platform:is-windows {
  fn tig {|@a| $E:HOMEPATH\scoop\apps\git\current\usr\bin\tig $@a }
}

# ==========================================
# Load Plugins
# ==========================================

use epm
epm:install &silent-if-installed         ^
github.com/zzamboni/elvish-modules     ^
github.com/zzamboni/elvish-completions ^
github.com/zzamboni/elvish-themes      ^
github.com/xiaq/edit.elv               ^
github.com/muesli/elvish-libs          ^
github.com/iwoloschin/elvish-packages

# Utils
use github.com/zzamboni/elvish-modules/util
use github.com/zzamboni/elvish-modules/lazy-vars

# ==========================================
# Environment
# ==========================================
set-env LESS "-i -R"
set-env EDITOR "nvim"
set-env GPG_TTY (tty)
set-env LANG en_CA.UTF-8
set-env LC_ALL en_US.UTF-8

# ==========================================
# Completions
# ==========================================

set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)

# Smart Matcher
use github.com/xiaq/edit.elv/smart-matcher
smart-matcher:apply

use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/comp
use github.com/zzamboni/elvish-completions/git git-completions
use github.com/zzamboni/elvish-completions/ssh

# ==========================================
# Themeing
# ==========================================

# # STARSHIP
# #   eval (starship init elvish | sed 's/except/catch/')
# # Temporary fix for use of except in the output of the Starship init code
# eval (/usr/local/bin/starship init elvish --print-full-init | slurp)

# set edit:prompt-stale-transform = {|x| styled $x "bright-black" }
# set edit:-prompt-eagerness = 10

set edit:command-abbr['g'] = 'git'
git-completions:init

# ==========================================
# Aliases
# ==========================================

use github.com/zzamboni/elvish-modules/alias

# Edit RC file
alias:new &save eedit nvim ~/.config/elvish/rc.elv

# CAT => BAT
only-when-external bat {
  alias:new cat bat
  alias:new more bat --paging always
  set E:MANPAGER = "sh -c 'col -bx | bat -l man -p'"
}
# only-when-external lsd {
#   var lsd-ls~ = { |@_args|
#     use github.com/zzamboni/elvish-modules/util
#     e:lsd --icon "always" --color "always" $_args
#   }
#   edit:add-var ls~ $lsd-ls~
# }
# only-when-external eza {
#   var eza-ls~ = { |@_args|
#     use github.com/zzamboni/elvish-modules/util
#     e:eza --color-scale --git --group-directories-first (each {|o|
#         util:cond [
#           { eq $o "-lrt" }  "-lsnew"
#           { eq $o "-lrta" } "-alsnew"
#           :else             $o
#         ]
#     } $_args)
#   }
#   edit:add-var ls~ $eza-ls~
# }

# # ==========================================
# # Programs
# # ==========================================

# use github.com/zzamboni/elvish-modules/atlas
# use github.com/zzamboni/elvish-modules/bang-bang
# use github.com/zzamboni/elvish-modules/long-running-notifications
# use github.com/zzamboni/elvish-modules/opsgenie
# use github.com/zzamboni/elvish-modules/spinners
# use github.com/zzamboni/elvish-modules/terminal-title
# use github.com/zzamboni/elvish-modules/tty

# # use atuin

# use github.com/zzamboni/elvish-modules/nix
# set E:NIX_SSL_CERT_FILE = "/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt"
# set E:NIX_PATH = "/nix/var/nix/profiles/per-user/root/channels"
# # E:MANPATH = ~/.nix-profile/share/man
# set paths = [
#   ~/.nix-profile/bin
#   ~/.nix-profile/sbin
#   ~/.nix-profile/lib/kde4/libexec
#   /nix/var/nix/profiles/default/bin
#   /nix/var/nix/profiles/default/sbin
#   /nix/var/nix/profiles/default/lib/kde4/libexec
#   $@paths
# ]

# # ==========================================
# # GIT
# # ==========================================

# # Git
# use github.com/muesli/elvish-libs/git

# # Git Summary
# use github.com/zzamboni/elvish-modules/git-summary gs
# set gs:stop-gitstatusd-after-use = $true

# var git-summary-repos-to-exclude = ['.emacs.d*' .cargo Library/Caches Dropbox/Personal/devel/go/src]
# var git-summary-fd-exclude-opts = [(each {|d| put -E $d } $git-summary-repos-to-exclude)]
# set gs:find-all-user-repos-fn = {
#   fd -H -I -t d $@git-summary-fd-exclude-opts '^.git$' ~ | each $path:dir~
# }

# # ==========================================
# # Misc
# # ==========================================

# # eval (devbox global shellenv --init-hook | slurp)
# # var rtx: = (eval-namespace (mise activate elvish | slurp))

# # == ASDF == #
# use asdf _asdf;
# var asdf~ = $_asdf:asdf~
# set edit:completion:arg-completer[asdf] = $_asdf:arg-completer~

# # == Mise == #
# use mise _mise;
# var mise~ = $_mise:mise~
# use ./completions/mise

# # == Atuin == #
# # use atuin _atuin;
# # var atuin~ = $_atuin:atuin~
# use ./completions/atuin

# # == FZF == #
# set-env FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
# only-when-external fd {
#   set-env FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix'
# }

# # == Systemctl == #
# only-when-external systemctl {
#   systemctl --user import-environment PATH
# }

# # == Zoxide == #
# only-when-external zoxide {
#   eval (zoxide init elvish | slurp)
# }

# # Update
# use github.com/iwoloschin/elvish-packages/update
# set update:curl-timeout = 3
# update:check-commit &verbose

# # Util
# use github.com/zzamboni/elvish-modules/util-edit
# util-edit:electric-delimiters

# # Iterm2
# use github.com/zzamboni/elvish-modules/iterm2
# iterm2:init
# set edit:insert:binding[Ctrl-L] = $iterm2:clear-screen~

# # Dir and Bindings
# use github.com/zzamboni/elvish-modules/dir
# alias:new cd &use=[github.com/zzamboni/elvish-modules/dir] dir:cd
# alias:new cdb &use=[github.com/zzamboni/elvish-modules/dir] dir:cdb

# set edit:insert:binding[Alt-i] = $dir:history-chooser~
# set edit:insert:binding[Alt-b] = $dir:left-small-word-or-prev-dir~
# set edit:insert:binding[Alt-f] = $dir:right-small-word-or-next-dir~
# set edit:insert:binding[Ctrl-R] = {
#   edit:histlist:start
#   edit:histlist:toggle-case-sensitivity
# }

# eval (navi widget elvish | slurp)

# # rtx:activate
# # atuin:activate
# -override-wcwidth 🦀 2