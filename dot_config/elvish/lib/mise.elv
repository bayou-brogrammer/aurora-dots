use re
use str
use path

set-env MISE_SHELL elvish
set-env __MISE_ORIG_PATH "$PATH"

var mise_exe = ~'/.local/bin/mise'
var mise_dir = ~'/.local/share/mise'

if (and (has-env MISE_DIR) (!=s $E:MISE_DIR '')) {
  set mise_dir = $E:MISE_DIR
} else {
  set-env MISE_DIR $mise_dir
}

var mise_data_dir = $mise_dir
if (and (has-env e) (!=s $E:MISE_DATA_DIR '')) {
  set mise_data_dir = $E:MISE_DATA_DIR
}

# Add function wrapper so we can export variables
fn mise {|command @args|
  if (==s $command 'shell') {
    # set environment variables
    var parts = [($mise_exe export-shell-version elvish $@args)]
    if (==s $parts[0] 'set-env') {
      set-env $parts[1] $parts[2]
    } elif (==s $parts[0] 'unset-env') {
      unset-env $parts[1]
    }
  } else {
    # forward other commands to mise script
    $mise_exe $command $@args
  }
}

fn match {|argz @pats|
  var matched = $true
  if (!= (count $argz) (count $pats)) {
    set matched = $false
  } else {
    for i [(range (count $pats))] {
      var pat = '^'$pats[$i]'$'
      var arg = $argz[$i]
      if (not (re:match $pat $arg)) {
        set matched = $false
        break
      }
    }
  }
  put $matched
}

fn ls-shims {
  ls $mise_data_dir'/shims'
}

fn ls-executables {
  # Print all executable files and links in path
  try {
    find $@paths '(' -type f -o -type l ')' -print 2>/dev/null | each {|p|
      try {
        if (test -x $p) {
          path:base $p
        }
      } catch {
        # don't fail if permission denied
      }
    }
  } catch {
    # silence default non-zero exit status
  }
}

fn ls-installed-versions {|plugin_name|
  mise list $plugin_name | each {|version|
    put (re:replace '\s*(.*)\s*' '${1}' $version)
  }
}

fn ls-all-versions {|plugin_name|
  mise list-all $plugin_name | each {|version|
    put (re:replace '\s*(.*)\s*' '${1}' $version)
  }
}

# Append ~/.mise/bin and ~/.mise/shims to PATH
for path [
  $mise_dir'/bin'
  $mise_data_dir'/shims'
] {
  if (not (has-value $paths $path)) {
    set paths = [
      $path
      $@paths
    ]
  }
}