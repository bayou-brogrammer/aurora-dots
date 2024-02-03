use builtin;
use str;

set edit:completion:arg-completer[mise] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }

    var command = 'mise'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }

    var completions = [
        &'mise'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
            cand -V 'Print version'
            cand --version 'Print version'
            cand activate 'Initializes mise in the current shell session'
            cand alias 'Manage aliases'
            cand asdf '[internal] simulates asdf for plugins that call "asdf" internally'
            cand bin-paths 'List all the active runtime bin paths'
            cand cache 'Manage the mise cache'
            cand completion 'Generate shell completions'
            cand config '[experimental] Manage config files'
            cand current 'Shows current active and installed runtime versions'
            cand deactivate 'Disable mise for current shell session'
            cand direnv 'Output direnv function to use mise inside direnv'
            cand doctor 'Check mise installation for possible problems.'
            cand env 'Exports env vars to activate mise a single time'
            cand exec 'Execute a command with tool(s) set'
            cand global 'Sets/gets the global tool version(s)'
            cand hook-env '[internal] called by activate hook to update env vars directory change'
            cand hook-not-found '[internal] called by shell when a command is not found'
            cand implode 'Removes mise CLI and all related data'
            cand install 'Install a tool version'
            cand latest 'Gets the latest available version for a plugin'
            cand link 'Symlinks a tool version into mise'
            cand local 'Sets/gets tool version in local .tool-versions or .mise.toml'
            cand ls 'List installed and/or currently selected tool versions'
            cand ls-remote 'List runtime versions available for install'
            cand outdated 'Shows outdated tool versions'
            cand plugins 'Manage plugins'
            cand prune 'Delete unused versions of tools'
            cand reshim 'rebuilds the shim farm'
            cand run '[experimental] Run a tasks'
            cand self-update 'Updates mise itself'
            cand set 'Manage environment variables'
            cand settings 'Manage settings'
            cand shell 'Sets a tool version for the current shell session'
            cand sync 'Add tool versions from external tools to mise'
            cand tasks '[experimental] Manage tasks'
            cand trust 'Marks a config file as trusted'
            cand uninstall 'Removes runtime versions'
            cand upgrade 'Upgrades outdated tool versions'
            cand unset 'Remove environment variable(s) from the config file'
            cand use 'Change the active version of a tool locally or globally.'
            cand version 'Show mise version'
            cand watch '[experimental] Run a tasks watching for changes'
            cand where 'Display the installation path for a runtime'
            cand which 'Shows the path that a bin name points to'
            cand render-completion 'Generate shell completions'
            cand render-help 'internal command to generate markdown from help'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        
        &'mise;activate'= {
            cand -s 'Shell type to generate the script for'
            cand --shell 'Shell type to generate the script for'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --status 'Show "mise: <PLUGIN>@<VERSION>" message when changing directories'
            cand --shims 'Use shims instead of modifying PATH
Effectively the same as:
    PATH="$HOME/.local/share/mise/shims:$PATH"'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --debug 'Sets log level to debug'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }

        &'mise;alias'= {
            cand -p 'filter aliases by plugin'
            cand --plugin 'filter aliases by plugin'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --no-header 'Don''t show table header'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
            cand get 'Show an alias for a plugin'
            cand ls 'List aliases
Shows the aliases that can be specified.
These can come from user config or from plugins in `bin/list-aliases`.'
            cand set 'Add/update an alias for a plugin'
            cand unset 'Clears an alias for a plugin'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;alias;get'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;alias;ls'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --no-header 'Don''t show table header'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;alias;set'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;alias;unset'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;alias;help'= {
            cand get 'Show an alias for a plugin'
            cand ls 'List aliases
Shows the aliases that can be specified.
These can come from user config or from plugins in `bin/list-aliases`.'
            cand set 'Add/update an alias for a plugin'
            cand unset 'Clears an alias for a plugin'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;alias;help;get'= {
        }
        &'mise;alias;help;ls'= {
        }
        &'mise;alias;help;set'= {
        }
        &'mise;alias;help;unset'= {
        }
        &'mise;alias;help;help'= {
        }
        &'mise;asdf'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;bin-paths'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;cache'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
            cand clear 'Deletes all cache files in mise'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;cache;clear'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;cache;help'= {
            cand clear 'Deletes all cache files in mise'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;cache;help;clear'= {
        }
        &'mise;cache;help;help'= {
        }
        &'mise;completion'= {
            cand -s 'Shell type to generate completions for'
            cand --shell 'Shell type to generate completions for'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;config'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --no-header 'Do not print table header'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
            cand ls '[experimental] List config files currently in use'
            cand generate '[experimental] Generate an .mise.toml file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;config;ls'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --no-header 'Do not print table header'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;config;generate'= {
            cand -o 'Output to file instead of stdout'
            cand --output 'Output to file instead of stdout'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;config;help'= {
            cand ls '[experimental] List config files currently in use'
            cand generate '[experimental] Generate an .mise.toml file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;config;help;ls'= {
        }
        &'mise;config;help;generate'= {
        }
        &'mise;config;help;help'= {
        }
        &'mise;current'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;deactivate'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;direnv'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
            cand envrc '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
            cand exec '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
            cand activate 'Output direnv function to use mise inside direnv'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;direnv;envrc'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;direnv;exec'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;direnv;activate'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;direnv;help'= {
            cand envrc '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
            cand exec '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
            cand activate 'Output direnv function to use mise inside direnv'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;direnv;help;envrc'= {
        }
        &'mise;direnv;help;exec'= {
        }
        &'mise;direnv;help;activate'= {
        }
        &'mise;direnv;help;help'= {
        }
        &'mise;doctor'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;env'= {
            cand -s 'Shell type to generate environment variables for'
            cand --shell 'Shell type to generate environment variables for'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -J 'Output in JSON format'
            cand --json 'Output in JSON format'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;exec'= {
            cand -c 'Command string to execute'
            cand --command 'Command string to execute'
            cand -j 'Number of jobs to run in parallel
[default: 4]'
            cand --jobs 'Number of jobs to run in parallel
[default: 4]'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --raw 'Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;global'= {
            cand --remove 'Remove the plugin(s) from ~/.tool-versions'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --pin 'Save exact version to `~/.tool-versions`
e.g.: `mise global --pin node@20` will save `node 20.0.0` to ~/.tool-versions'
            cand --fuzzy 'Save fuzzy version to `~/.tool-versions`
e.g.: `mise global --fuzzy node@20` will save `node 20` to ~/.tool-versions
this is the default behavior unless MISE_ASDF_COMPAT=1'
            cand --path 'Get the path of the global config file'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;hook-env'= {
            cand -s 'Shell type to generate script for'
            cand --shell 'Shell type to generate script for'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --status 'Show "mise: <PLUGIN>@<VERSION>" message when changing directories'
            cand -q 'Hide warnings such as when a tool is not installed'
            cand --quiet 'Hide warnings such as when a tool is not installed'
            cand --debug 'Sets log level to debug'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;hook-not-found'= {
            cand -s 'Shell type to generate script for'
            cand --shell 'Shell type to generate script for'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;implode'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --config 'Also remove config directory'
            cand -n 'List directories that would be removed without actually removing them'
            cand --dry-run 'List directories that would be removed without actually removing them'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;install'= {
            cand -j 'Number of jobs to run in parallel
[default: 4]'
            cand --jobs 'Number of jobs to run in parallel
[default: 4]'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -f 'Force reinstall even if already installed'
            cand --force 'Force reinstall even if already installed'
            cand --raw 'Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1'
            cand -v 'Show installation output'
            cand --verbose 'Show installation output'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;latest'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -i 'Show latest installed instead of available version'
            cand --installed 'Show latest installed instead of available version'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;link'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -f 'Overwrite an existing tool version if it exists'
            cand --force 'Overwrite an existing tool version if it exists'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;local'= {
            cand --remove 'Remove the plugin(s) from .tool-versions'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -p 'Recurse up to find a .tool-versions file rather than using the current directory only
by default this command will only set the tool in the current directory ("$PWD/.tool-versions")'
            cand --parent 'Recurse up to find a .tool-versions file rather than using the current directory only
by default this command will only set the tool in the current directory ("$PWD/.tool-versions")'
            cand --pin 'Save exact version to `.tool-versions`
e.g.: `mise local --pin node@20` will save `node 20.0.0` to .tool-versions'
            cand --fuzzy 'Save fuzzy version to `.tool-versions` e.g.: `mise local --fuzzy node@20` will save `node 20` to .tool-versions This is the default behavior unless MISE_ASDF_COMPAT=1'
            cand --path 'Get the path of the config file'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;ls'= {
            cand -p 'p'
            cand --plugin 'plugin'
            cand --prefix 'Display versions matching this prefix'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -c 'Only show tool versions currently specified in a .tool-versions/.mise.toml'
            cand --current 'Only show tool versions currently specified in a .tool-versions/.mise.toml'
            cand -g 'Only show tool versions currently specified in a the global .tool-versions/.mise.toml'
            cand --global 'Only show tool versions currently specified in a the global .tool-versions/.mise.toml'
            cand -i 'Only show tool versions that are installed Hides missing ones defined in .tool-versions/.mise.toml but not yet installed'
            cand --installed 'Only show tool versions that are installed Hides missing ones defined in .tool-versions/.mise.toml but not yet installed'
            cand --parseable 'Output in an easily parseable format'
            cand -J 'Output in json format'
            cand --json 'Output in json format'
            cand -m 'Display missing tool versions'
            cand --missing 'Display missing tool versions'
            cand --no-header 'Don''t display headers'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;ls-remote'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --all 'Show all installed plugins and versions'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;outdated'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -a 'list all available remote plugins'
            cand --all 'list all available remote plugins'
            cand -c 'The built-in plugins only
Normally these are not shown'
            cand --core 'The built-in plugins only
Normally these are not shown'
            cand --user 'List installed plugins'
            cand -u 'Show the git url for each plugin
e.g.: https://github.com/asdf-vm/asdf-nodejs.git'
            cand --urls 'Show the git url for each plugin
e.g.: https://github.com/asdf-vm/asdf-nodejs.git'
            cand --refs 'Show the git refs for each plugin
e.g.: main 1234abc'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
            cand install 'Install a plugin'
            cand link 'Symlinks a plugin into mise'
            cand ls 'List installed plugins'
            cand ls-remote 'List all available remote plugins'
            cand uninstall 'Removes a plugin'
            cand update 'Updates a plugin to the latest version'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;plugins;install'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -f 'Reinstall even if plugin exists'
            cand --force 'Reinstall even if plugin exists'
            cand -a 'Install all missing plugins
This will only install plugins that have matching shorthands.
i.e.: they don''t need the full git repo url'
            cand --all 'Install all missing plugins
This will only install plugins that have matching shorthands.
i.e.: they don''t need the full git repo url'
            cand -v 'Show installation output'
            cand --verbose 'Show installation output'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins;link'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -f 'Overwrite existing plugin'
            cand --force 'Overwrite existing plugin'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins;ls'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -a 'List all available remote plugins
Same as `mise plugins ls-remote`'
            cand --all 'List all available remote plugins
Same as `mise plugins ls-remote`'
            cand -c 'The built-in plugins only
Normally these are not shown'
            cand --core 'The built-in plugins only
Normally these are not shown'
            cand --user 'List installed plugins'
            cand -u 'Show the git url for each plugin
e.g.: https://github.com/asdf-vm/asdf-nodejs.git'
            cand --urls 'Show the git url for each plugin
e.g.: https://github.com/asdf-vm/asdf-nodejs.git'
            cand --refs 'Show the git refs for each plugin
e.g.: main 1234abc'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins;ls-remote'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -u 'Show the git url for each plugin e.g.: https://github.com/mise-plugins/rtx-nodejs.git'
            cand --urls 'Show the git url for each plugin e.g.: https://github.com/mise-plugins/rtx-nodejs.git'
            cand --only-names 'Only show the name of each plugin by default it will show a "*" next to installed plugins'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins;uninstall'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -p 'Also remove the plugin''s installs, downloads, and cache'
            cand --purge 'Also remove the plugin''s installs, downloads, and cache'
            cand -a 'Remove all plugins'
            cand --all 'Remove all plugins'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins;update'= {
            cand -j 'Number of jobs to run in parallel
Default: 4'
            cand --jobs 'Number of jobs to run in parallel
Default: 4'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;plugins;help'= {
            cand install 'Install a plugin'
            cand link 'Symlinks a plugin into mise'
            cand ls 'List installed plugins'
            cand ls-remote 'List all available remote plugins'
            cand uninstall 'Removes a plugin'
            cand update 'Updates a plugin to the latest version'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;plugins;help;install'= {
        }
        &'mise;plugins;help;link'= {
        }
        &'mise;plugins;help;ls'= {
        }
        &'mise;plugins;help;ls-remote'= {
        }
        &'mise;plugins;help;uninstall'= {
        }
        &'mise;plugins;help;update'= {
        }
        &'mise;plugins;help;help'= {
        }
        &'mise;prune'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -n 'Do not actually delete anything'
            cand --dry-run 'Do not actually delete anything'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;reshim'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;run'= {
            cand -C 'Change to this directory before executing the command'
            cand --cd 'Change to this directory before executing the command'
            cand -t 'Tool(s) to also add e.g.: node@20 python@3.10'
            cand --tool 'Tool(s) to also add e.g.: node@20 python@3.10'
            cand -j 'Number of tasks to run in parallel
[default: 4]
Configure with `jobs` config or `MISE_JOBS` env var'
            cand --jobs 'Number of tasks to run in parallel
[default: 4]
Configure with `jobs` config or `MISE_JOBS` env var'
            cand --log-level 'Set the log output verbosity'
            cand -n 'Don''t actually run the tasks(s), just print them in order of execution'
            cand --dry-run 'Don''t actually run the tasks(s), just print them in order of execution'
            cand -f 'Force the tasks to run even if outputs are up to date'
            cand --force 'Force the tasks to run even if outputs are up to date'
            cand -p 'Print stdout/stderr by line, prefixed with the tasks''s label
Defaults to true if --jobs > 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand --prefix 'Print stdout/stderr by line, prefixed with the tasks''s label
Defaults to true if --jobs > 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand -i 'Print directly to stdout/stderr instead of by line
Defaults to true if --jobs == 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand --interleave 'Print directly to stdout/stderr instead of by line
Defaults to true if --jobs == 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand -r 'Read/write directly to stdin/stdout/stderr instead of by line
Configure with `raw` config or `MISE_RAW` env var'
            cand --raw 'Read/write directly to stdin/stdout/stderr instead of by line
Configure with `raw` config or `MISE_RAW` env var'
            cand --timings 'Shows elapsed time after each tasks'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;self-update'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -f 'Update even if already up to date'
            cand --force 'Update even if already up to date'
            cand --no-plugins 'Disable auto-updating plugins'
            cand -y 'Skip confirmation prompt'
            cand --yes 'Skip confirmation prompt'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;set'= {
            cand --file 'The TOML file to update'
            cand --remove 'Remove the environment variable from config file'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -g 'Set the environment variable in the global config file'
            cand --global 'Set the environment variable in the global config file'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;settings'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
            cand get 'Show a current setting'
            cand ls 'Show current settings'
            cand set 'Add/update a setting'
            cand unset 'Clears a setting'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;settings;get'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;settings;ls'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;settings;set'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;settings;unset'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;settings;help'= {
            cand get 'Show a current setting'
            cand ls 'Show current settings'
            cand set 'Add/update a setting'
            cand unset 'Clears a setting'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;settings;help;get'= {
        }
        &'mise;settings;help;ls'= {
        }
        &'mise;settings;help;set'= {
        }
        &'mise;settings;help;unset'= {
        }
        &'mise;settings;help;help'= {
        }
        &'mise;shell'= {
            cand -j 'Number of jobs to run in parallel
[default: 4]'
            cand --jobs 'Number of jobs to run in parallel
[default: 4]'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --raw 'Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1'
            cand -u 'Removes a previously set version'
            cand --unset 'Removes a previously set version'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;sync'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
            cand node 'Symlinks all tool versions from an external tool into mise'
            cand python 'Symlinks all tool versions from an external tool into mise'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;sync;node'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --brew 'Get tool versions from Homebrew'
            cand --nvm 'Get tool versions from nvm'
            cand --nodenv 'Get tool versions from nodenv'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;sync;python'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --pyenv 'Get tool versions from pyenv'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;sync;help'= {
            cand node 'Symlinks all tool versions from an external tool into mise'
            cand python 'Symlinks all tool versions from an external tool into mise'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;sync;help;node'= {
        }
        &'mise;sync;help;python'= {
        }
        &'mise;sync;help;help'= {
        }
        &'mise;tasks'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --no-header 'Do not print table header'
            cand --hidden 'Show hidden tasks'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
            cand deps '[experimental] Display a tree visualization of a dependency graph'
            cand edit '[experimental] Edit a tasks with $EDITOR'
            cand ls '[experimental] List available tasks to execute
These may be included from the config file or from the project''s .mise/tasks directory
mise will merge all tasks from all parent directories into this list.'
            cand run '[experimental] Run a tasks'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;tasks;deps'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --dot 'Display dependencies in DOT format'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;tasks;edit'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -p 'Display the path to the tasks instead of editing it'
            cand --path 'Display the path to the tasks instead of editing it'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;tasks;ls'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --no-header 'Do not print table header'
            cand --hidden 'Show hidden tasks'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;tasks;run'= {
            cand -C 'Change to this directory before executing the command'
            cand --cd 'Change to this directory before executing the command'
            cand -t 'Tool(s) to also add e.g.: node@20 python@3.10'
            cand --tool 'Tool(s) to also add e.g.: node@20 python@3.10'
            cand -j 'Number of tasks to run in parallel
[default: 4]
Configure with `jobs` config or `MISE_JOBS` env var'
            cand --jobs 'Number of tasks to run in parallel
[default: 4]
Configure with `jobs` config or `MISE_JOBS` env var'
            cand --log-level 'Set the log output verbosity'
            cand -n 'Don''t actually run the tasks(s), just print them in order of execution'
            cand --dry-run 'Don''t actually run the tasks(s), just print them in order of execution'
            cand -f 'Force the tasks to run even if outputs are up to date'
            cand --force 'Force the tasks to run even if outputs are up to date'
            cand -p 'Print stdout/stderr by line, prefixed with the tasks''s label
Defaults to true if --jobs > 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand --prefix 'Print stdout/stderr by line, prefixed with the tasks''s label
Defaults to true if --jobs > 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand -i 'Print directly to stdout/stderr instead of by line
Defaults to true if --jobs == 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand --interleave 'Print directly to stdout/stderr instead of by line
Defaults to true if --jobs == 1
Configure with `task_output` config or `MISE_TASK_OUTPUT` env var'
            cand -r 'Read/write directly to stdin/stdout/stderr instead of by line
Configure with `raw` config or `MISE_RAW` env var'
            cand --raw 'Read/write directly to stdin/stdout/stderr instead of by line
Configure with `raw` config or `MISE_RAW` env var'
            cand --timings 'Shows elapsed time after each tasks'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;tasks;help'= {
            cand deps '[experimental] Display a tree visualization of a dependency graph'
            cand edit '[experimental] Edit a tasks with $EDITOR'
            cand ls '[experimental] List available tasks to execute
These may be included from the config file or from the project''s .mise/tasks directory
mise will merge all tasks from all parent directories into this list.'
            cand run '[experimental] Run a tasks'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;tasks;help;deps'= {
        }
        &'mise;tasks;help;edit'= {
        }
        &'mise;tasks;help;ls'= {
        }
        &'mise;tasks;help;run'= {
        }
        &'mise;tasks;help;help'= {
        }
        &'mise;trust'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -a 'Trust all config files in the current directory and its parents'
            cand --all 'Trust all config files in the current directory and its parents'
            cand --untrust 'No longer trust this config'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;uninstall'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -a 'Delete all installed versions'
            cand --all 'Delete all installed versions'
            cand -n 'Do not actually delete anything'
            cand --dry-run 'Do not actually delete anything'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;upgrade'= {
            cand -j 'Number of jobs to run in parallel
[default: 4]'
            cand --jobs 'Number of jobs to run in parallel
[default: 4]'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -n 'Just print what would be done, don''t actually do it'
            cand --dry-run 'Just print what would be done, don''t actually do it'
            cand -i 'Display multiselect menu to choose which tools to upgrade'
            cand --interactive 'Display multiselect menu to choose which tools to upgrade'
            cand --raw 'Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;unset'= {
            cand -f 'Specify a file to use instead of ".mise.toml"'
            cand --file 'Specify a file to use instead of ".mise.toml"'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -g 'Use the global config file'
            cand --global 'Use the global config file'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;use'= {
            cand -e 'Modify an environment-specific config file like .mise.<env>.toml'
            cand --env 'Modify an environment-specific config file like .mise.<env>.toml'
            cand -j 'Number of jobs to run in parallel
[default: 4]'
            cand --jobs 'Number of jobs to run in parallel
[default: 4]'
            cand --remove 'Remove the plugin(s) from config file'
            cand -p 'Specify a path to a config file or directory If a directory is specified, it will look for .mise.toml (default) or .tool-versions'
            cand --path 'Specify a path to a config file or directory If a directory is specified, it will look for .mise.toml (default) or .tool-versions'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand -f 'Force reinstall even if already installed'
            cand --force 'Force reinstall even if already installed'
            cand --fuzzy 'Save fuzzy version to config file
e.g.: `mise use --fuzzy node@20` will save 20 as the version
this is the default behavior unless MISE_ASDF_COMPAT=1'
            cand -g 'Use the global config file (~/.config/mise/config.toml) instead of the local one'
            cand --global 'Use the global config file (~/.config/mise/config.toml) instead of the local one'
            cand --raw 'Directly pipe stdin/stdout/stderr from plugin to user Sets --jobs=1'
            cand --pin 'Save exact version to config file
e.g.: `mise use --pin node@20` will save 20.0.0 as the version
Set MISE_ASDF_COMPAT=1 to make this the default behavior'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;version'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;watch'= {
            cand -t 'Tasks to run'
            cand --task 'Tasks to run'
            cand -g 'Files to watch
Defaults to sources from the tasks(s)'
            cand --glob 'Files to watch
Defaults to sources from the tasks(s)'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;where'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;which'= {
            cand -t 'Use a specific tool@version
e.g.: `mise which npm --tool=node@20`'
            cand --tool 'Use a specific tool@version
e.g.: `mise which npm --tool=node@20`'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --plugin 'Show the plugin name instead of the path'
            cand --version 'Show the version instead of the path'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'mise;render-completion'= {
            cand -s 'Shell type to generate completions for'
            cand --shell 'Shell type to generate completions for'
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;render-help'= {
            cand -C 'Change directory before running command'
            cand --cd 'Change directory before running command'
            cand --log-level 'Set the log output verbosity'
            cand --debug 'Sets log level to debug'
            cand -q 'Suppress non-error messages'
            cand --quiet 'Suppress non-error messages'
            cand --trace 'Sets log level to trace'
            cand -v 'Show extra output (use -vv for even more)'
            cand --verbose 'Show extra output (use -vv for even more)'
            cand -y 'Answer yes to all confirmation prompts'
            cand --yes 'Answer yes to all confirmation prompts'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'mise;help'= {
            cand activate 'Initializes mise in the current shell session'
            cand alias 'Manage aliases'
            cand asdf '[internal] simulates asdf for plugins that call "asdf" internally'
            cand bin-paths 'List all the active runtime bin paths'
            cand cache 'Manage the mise cache'
            cand completion 'Generate shell completions'
            cand config '[experimental] Manage config files'
            cand current 'Shows current active and installed runtime versions'
            cand deactivate 'Disable mise for current shell session'
            cand direnv 'Output direnv function to use mise inside direnv'
            cand doctor 'Check mise installation for possible problems.'
            cand env 'Exports env vars to activate mise a single time'
            cand exec 'Execute a command with tool(s) set'
            cand global 'Sets/gets the global tool version(s)'
            cand hook-env '[internal] called by activate hook to update env vars directory change'
            cand hook-not-found '[internal] called by shell when a command is not found'
            cand implode 'Removes mise CLI and all related data'
            cand install 'Install a tool version'
            cand latest 'Gets the latest available version for a plugin'
            cand link 'Symlinks a tool version into mise'
            cand local 'Sets/gets tool version in local .tool-versions or .mise.toml'
            cand ls 'List installed and/or currently selected tool versions'
            cand ls-remote 'List runtime versions available for install'
            cand outdated 'Shows outdated tool versions'
            cand plugins 'Manage plugins'
            cand prune 'Delete unused versions of tools'
            cand reshim 'rebuilds the shim farm'
            cand run '[experimental] Run a tasks'
            cand self-update 'Updates mise itself'
            cand set 'Manage environment variables'
            cand settings 'Manage settings'
            cand shell 'Sets a tool version for the current shell session'
            cand sync 'Add tool versions from external tools to mise'
            cand tasks '[experimental] Manage tasks'
            cand trust 'Marks a config file as trusted'
            cand uninstall 'Removes runtime versions'
            cand upgrade 'Upgrades outdated tool versions'
            cand unset 'Remove environment variable(s) from the config file'
            cand use 'Change the active version of a tool locally or globally.'
            cand version 'Show mise version'
            cand watch '[experimental] Run a tasks watching for changes'
            cand where 'Display the installation path for a runtime'
            cand which 'Shows the path that a bin name points to'
            cand render-completion 'Generate shell completions'
            cand render-help 'internal command to generate markdown from help'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'mise;help;activate'= {
        }
        &'mise;help;alias'= {
            cand get 'Show an alias for a plugin'
            cand ls 'List aliases
Shows the aliases that can be specified.
These can come from user config or from plugins in `bin/list-aliases`.'
            cand set 'Add/update an alias for a plugin'
            cand unset 'Clears an alias for a plugin'
        }
        &'mise;help;alias;get'= {
        }
        &'mise;help;alias;ls'= {
        }
        &'mise;help;alias;set'= {
        }
        &'mise;help;alias;unset'= {
        }
        &'mise;help;asdf'= {
        }
        &'mise;help;bin-paths'= {
        }
        &'mise;help;cache'= {
            cand clear 'Deletes all cache files in mise'
        }
        &'mise;help;cache;clear'= {
        }
        &'mise;help;completion'= {
        }
        &'mise;help;config'= {
            cand ls '[experimental] List config files currently in use'
            cand generate '[experimental] Generate an .mise.toml file'
        }
        &'mise;help;config;ls'= {
        }
        &'mise;help;config;generate'= {
        }
        &'mise;help;current'= {
        }
        &'mise;help;deactivate'= {
        }
        &'mise;help;direnv'= {
            cand envrc '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
            cand exec '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
            cand activate 'Output direnv function to use mise inside direnv'
        }
        &'mise;help;direnv;envrc'= {
        }
        &'mise;help;direnv;exec'= {
        }
        &'mise;help;direnv;activate'= {
        }
        &'mise;help;doctor'= {
        }
        &'mise;help;env'= {
        }
        &'mise;help;exec'= {
        }
        &'mise;help;global'= {
        }
        &'mise;help;hook-env'= {
        }
        &'mise;help;hook-not-found'= {
        }
        &'mise;help;implode'= {
        }
        &'mise;help;install'= {
        }
        &'mise;help;latest'= {
        }
        &'mise;help;link'= {
        }
        &'mise;help;local'= {
        }
        &'mise;help;ls'= {
        }
        &'mise;help;ls-remote'= {
        }
        &'mise;help;outdated'= {
        }
        &'mise;help;plugins'= {
            cand install 'Install a plugin'
            cand link 'Symlinks a plugin into mise'
            cand ls 'List installed plugins'
            cand ls-remote 'List all available remote plugins'
            cand uninstall 'Removes a plugin'
            cand update 'Updates a plugin to the latest version'
        }
        &'mise;help;plugins;install'= {
        }
        &'mise;help;plugins;link'= {
        }
        &'mise;help;plugins;ls'= {
        }
        &'mise;help;plugins;ls-remote'= {
        }
        &'mise;help;plugins;uninstall'= {
        }
        &'mise;help;plugins;update'= {
        }
        &'mise;help;prune'= {
        }
        &'mise;help;reshim'= {
        }
        &'mise;help;run'= {
        }
        &'mise;help;self-update'= {
        }
        &'mise;help;set'= {
        }
        &'mise;help;settings'= {
            cand get 'Show a current setting'
            cand ls 'Show current settings'
            cand set 'Add/update a setting'
            cand unset 'Clears a setting'
        }
        &'mise;help;settings;get'= {
        }
        &'mise;help;settings;ls'= {
        }
        &'mise;help;settings;set'= {
        }
        &'mise;help;settings;unset'= {
        }
        &'mise;help;shell'= {
        }
        &'mise;help;sync'= {
            cand node 'Symlinks all tool versions from an external tool into mise'
            cand python 'Symlinks all tool versions from an external tool into mise'
        }
        &'mise;help;sync;node'= {
        }
        &'mise;help;sync;python'= {
        }
        &'mise;help;tasks'= {
            cand deps '[experimental] Display a tree visualization of a dependency graph'
            cand edit '[experimental] Edit a tasks with $EDITOR'
            cand ls '[experimental] List available tasks to execute
These may be included from the config file or from the project''s .mise/tasks directory
mise will merge all tasks from all parent directories into this list.'
            cand run '[experimental] Run a tasks'
        }
        &'mise;help;tasks;deps'= {
        }
        &'mise;help;tasks;edit'= {
        }
        &'mise;help;tasks;ls'= {
        }
        &'mise;help;tasks;run'= {
        }
        &'mise;help;trust'= {
        }
        &'mise;help;uninstall'= {
        }
        &'mise;help;upgrade'= {
        }
        &'mise;help;unset'= {
        }
        &'mise;help;use'= {
        }
        &'mise;help;version'= {
        }
        &'mise;help;watch'= {
        }
        &'mise;help;where'= {
        }
        &'mise;help;which'= {
        }
        &'mise;help;render-completion'= {
        }
        &'mise;help;render-help'= {
        }
        &'mise;help;help'= {
        }
    ]
    
    $completions[$command]
}
