
use builtin;
use str;

set edit:completion:arg-completer[atuin] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }
    var command = 'atuin'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }
    var completions = [
        &'atuin'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand -V 'Print version'
            cand --version 'Print version'
            cand history 'Manipulate shell history'
            cand import 'Import shell history from file'
            cand stats 'Calculate statistics for your history'
            cand search 'Interactive history search'
            cand sync 'Sync with the configured server'
            cand login 'Login to the configured server'
            cand logout 'Log out'
            cand register 'Register with the configured server'
            cand key 'Print the encryption key for transfer to another machine'
            cand status 'status'
            cand account 'account'
            cand kv 'kv'
            cand default-config 'Print example configuration'
            cand server 'Start an atuin server'
            cand init 'Output shell setup'
            cand uuid 'Generate a UUID'
            cand contributors 'contributors'
            cand gen-completions 'Generate shell completions'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;history'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand start 'Begins a new command in the history'
            cand end 'Finishes a new command in the history (adds time, exit code)'
            cand list 'List all items in history'
            cand last 'Get the last command ran'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;history;start'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;history;end'= {
            cand -e 'e'
            cand --exit 'exit'
            cand -d 'd'
            cand --duration 'duration'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;history;list'= {
            cand -r 'r'
            cand --reverse 'reverse'
            cand -f 'Available variables: {command}, {directory}, {duration}, {user}, {host}, {exit} and {time}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"'
            cand --format 'Available variables: {command}, {directory}, {duration}, {user}, {host}, {exit} and {time}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"'
            cand -c 'c'
            cand --cwd 'cwd'
            cand -s 's'
            cand --session 'session'
            cand --human 'human'
            cand --cmd-only 'Show only the text of the command'
            cand --print0 'Terminate the output with a null, for better multiline support'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;history;last'= {
            cand -f 'Available variables: {command}, {directory}, {duration}, {user}, {host} and {time}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"'
            cand --format 'Available variables: {command}, {directory}, {duration}, {user}, {host} and {time}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"'
            cand --human 'human'
            cand --cmd-only 'Show only the text of the command'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;history;help'= {
            cand start 'Begins a new command in the history'
            cand end 'Finishes a new command in the history (adds time, exit code)'
            cand list 'List all items in history'
            cand last 'Get the last command ran'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;history;help;start'= {
        }
        &'atuin;history;help;end'= {
        }
        &'atuin;history;help;list'= {
        }
        &'atuin;history;help;last'= {
        }
        &'atuin;history;help;help'= {
        }
        &'atuin;import'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand auto 'Import history for the current shell'
            cand zsh 'Import history from the zsh history file'
            cand zsh-hist-db 'Import history from the zsh history file'
            cand bash 'Import history from the bash history file'
            cand resh 'Import history from the resh history file'
            cand fish 'Import history from the fish history file'
            cand nu 'Import history from the nu history file'
            cand nu-hist-db 'Import history from the nu history file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;import;auto'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;zsh'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;zsh-hist-db'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;bash'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;resh'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;fish'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;nu'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;nu-hist-db'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;import;help'= {
            cand auto 'Import history for the current shell'
            cand zsh 'Import history from the zsh history file'
            cand zsh-hist-db 'Import history from the zsh history file'
            cand bash 'Import history from the bash history file'
            cand resh 'Import history from the resh history file'
            cand fish 'Import history from the fish history file'
            cand nu 'Import history from the nu history file'
            cand nu-hist-db 'Import history from the nu history file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;import;help;auto'= {
        }
        &'atuin;import;help;zsh'= {
        }
        &'atuin;import;help;zsh-hist-db'= {
        }
        &'atuin;import;help;bash'= {
        }
        &'atuin;import;help;resh'= {
        }
        &'atuin;import;help;fish'= {
        }
        &'atuin;import;help;nu'= {
        }
        &'atuin;import;help;nu-hist-db'= {
        }
        &'atuin;import;help;help'= {
        }
        &'atuin;stats'= {
            cand -c 'How many top commands to list'
            cand --count 'How many top commands to list'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;search'= {
            cand -c 'Filter search result by directory'
            cand --cwd 'Filter search result by directory'
            cand --exclude-cwd 'Exclude directory from results'
            cand -e 'Filter search result by exit code'
            cand --exit 'Filter search result by exit code'
            cand --exclude-exit 'Exclude results with this exit code'
            cand -b 'Only include results added before this date'
            cand --before 'Only include results added before this date'
            cand --after 'Only include results after this date'
            cand --limit 'How many entries to return at most'
            cand --offset 'Offset from the start of the results'
            cand --filter-mode 'Allow overriding filter mode over config'
            cand --search-mode 'Allow overriding search mode over config'
            cand -f 'Available variables: {command}, {directory}, {duration}, {user}, {host}, {time}, {exit} and {relativetime}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"'
            cand --format 'Available variables: {command}, {directory}, {duration}, {user}, {host}, {time}, {exit} and {relativetime}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"'
            cand --inline-height 'Set the maximum number of lines Atuin''s interface should take up'
            cand -i 'Open interactive search UI'
            cand --interactive 'Open interactive search UI'
            cand --shell-up-key-binding 'Marker argument used to inform atuin that it was invoked from a shell up-key binding (hidden from help to avoid confusion)'
            cand --human 'Use human-readable formatting for time'
            cand --cmd-only 'Show only the text of the command'
            cand --delete 'Delete anything matching this query. Will not print out the match'
            cand --delete-it-all 'Delete EVERYTHING!'
            cand -r 'Reverse the order of results, oldest first'
            cand --reverse 'Reverse the order of results, oldest first'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;sync'= {
            cand -f 'Force re-download everything'
            cand --force 'Force re-download everything'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;login'= {
            cand -u 'u'
            cand --username 'username'
            cand -p 'p'
            cand --password 'password'
            cand -k 'The encryption key for your account'
            cand --key 'The encryption key for your account'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;logout'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;register'= {
            cand -u 'u'
            cand --username 'username'
            cand -p 'p'
            cand --password 'password'
            cand -e 'e'
            cand --email 'email'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;key'= {
            cand --base64 'Switch to base64 output of the key'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;status'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;account'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand login 'Login to the configured server'
            cand register 'register'
            cand logout 'Log out'
            cand delete 'delete'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;account;login'= {
            cand -u 'u'
            cand --username 'username'
            cand -p 'p'
            cand --password 'password'
            cand -k 'The encryption key for your account'
            cand --key 'The encryption key for your account'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;account;register'= {
            cand -u 'u'
            cand --username 'username'
            cand -p 'p'
            cand --password 'password'
            cand -e 'e'
            cand --email 'email'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;account;logout'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;account;delete'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;account;help'= {
            cand login 'Login to the configured server'
            cand register 'register'
            cand logout 'Log out'
            cand delete 'delete'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;account;help;login'= {
        }
        &'atuin;account;help;register'= {
        }
        &'atuin;account;help;logout'= {
        }
        &'atuin;account;help;delete'= {
        }
        &'atuin;account;help;help'= {
        }
        &'atuin;kv'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand set 'set'
            cand get 'get'
            cand list 'list'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;kv;set'= {
            cand -k 'k'
            cand --key 'key'
            cand -n 'n'
            cand --namespace 'namespace'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;kv;get'= {
            cand -n 'n'
            cand --namespace 'namespace'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;kv;list'= {
            cand -n 'n'
            cand --namespace 'namespace'
            cand -a 'a'
            cand --all-namespaces 'all-namespaces'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;kv;help'= {
            cand set 'set'
            cand get 'get'
            cand list 'list'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;kv;help;set'= {
        }
        &'atuin;kv;help;get'= {
        }
        &'atuin;kv;help;list'= {
        }
        &'atuin;kv;help;help'= {
        }
        &'atuin;default-config'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;server'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand start 'Start the server'
            cand default-config 'Print server example configuration'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;server;start'= {
            cand --host 'The host address to bind'
            cand -p 'The port to bind'
            cand --port 'The port to bind'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;server;default-config'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;server;help'= {
            cand start 'Start the server'
            cand default-config 'Print server example configuration'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;server;help;start'= {
        }
        &'atuin;server;help;default-config'= {
        }
        &'atuin;server;help;help'= {
        }
        &'atuin;init'= {
            cand --disable-ctrl-r 'Disable the binding of CTRL-R to atuin'
            cand --disable-up-arrow 'Disable the binding of the Up Arrow key to atuin'
            cand -h 'Print help (see more with ''--help'')'
            cand --help 'Print help (see more with ''--help'')'
        }
        &'atuin;uuid'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;contributors'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;gen-completions'= {
            cand -s 'Set the shell for generating completions'
            cand --shell 'Set the shell for generating completions'
            cand -o 'Set the output directory'
            cand --out-dir 'Set the output directory'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'atuin;help'= {
            cand history 'Manipulate shell history'
            cand import 'Import shell history from file'
            cand stats 'Calculate statistics for your history'
            cand search 'Interactive history search'
            cand sync 'Sync with the configured server'
            cand login 'Login to the configured server'
            cand logout 'Log out'
            cand register 'Register with the configured server'
            cand key 'Print the encryption key for transfer to another machine'
            cand status 'status'
            cand account 'account'
            cand kv 'kv'
            cand default-config 'Print example configuration'
            cand server 'Start an atuin server'
            cand init 'Output shell setup'
            cand uuid 'Generate a UUID'
            cand contributors 'contributors'
            cand gen-completions 'Generate shell completions'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'atuin;help;history'= {
            cand start 'Begins a new command in the history'
            cand end 'Finishes a new command in the history (adds time, exit code)'
            cand list 'List all items in history'
            cand last 'Get the last command ran'
        }
        &'atuin;help;history;start'= {
        }
        &'atuin;help;history;end'= {
        }
        &'atuin;help;history;list'= {
        }
        &'atuin;help;history;last'= {
        }
        &'atuin;help;import'= {
            cand auto 'Import history for the current shell'
            cand zsh 'Import history from the zsh history file'
            cand zsh-hist-db 'Import history from the zsh history file'
            cand bash 'Import history from the bash history file'
            cand resh 'Import history from the resh history file'
            cand fish 'Import history from the fish history file'
            cand nu 'Import history from the nu history file'
            cand nu-hist-db 'Import history from the nu history file'
        }
        &'atuin;help;import;auto'= {
        }
        &'atuin;help;import;zsh'= {
        }
        &'atuin;help;import;zsh-hist-db'= {
        }
        &'atuin;help;import;bash'= {
        }
        &'atuin;help;import;resh'= {
        }
        &'atuin;help;import;fish'= {
        }
        &'atuin;help;import;nu'= {
        }
        &'atuin;help;import;nu-hist-db'= {
        }
        &'atuin;help;stats'= {
        }
        &'atuin;help;search'= {
        }
        &'atuin;help;sync'= {
        }
        &'atuin;help;login'= {
        }
        &'atuin;help;logout'= {
        }
        &'atuin;help;register'= {
        }
        &'atuin;help;key'= {
        }
        &'atuin;help;status'= {
        }
        &'atuin;help;account'= {
            cand login 'Login to the configured server'
            cand register 'register'
            cand logout 'Log out'
            cand delete 'delete'
        }
        &'atuin;help;account;login'= {
        }
        &'atuin;help;account;register'= {
        }
        &'atuin;help;account;logout'= {
        }
        &'atuin;help;account;delete'= {
        }
        &'atuin;help;kv'= {
            cand set 'set'
            cand get 'get'
            cand list 'list'
        }
        &'atuin;help;kv;set'= {
        }
        &'atuin;help;kv;get'= {
        }
        &'atuin;help;kv;list'= {
        }
        &'atuin;help;default-config'= {
        }
        &'atuin;help;server'= {
            cand start 'Start the server'
            cand default-config 'Print server example configuration'
        }
        &'atuin;help;server;start'= {
        }
        &'atuin;help;server;default-config'= {
        }
        &'atuin;help;init'= {
        }
        &'atuin;help;uuid'= {
        }
        &'atuin;help;contributors'= {
        }
        &'atuin;help;gen-completions'= {
        }
        &'atuin;help;help'= {
        }
    ]
    $completions[$command]
}
