'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options. This allows you to apply configuration changes without
  # restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # The list of segments shown on the left. Fill it with the most important segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    uname
    divider
    hostname
    dir                     # current directory
    vcs                     # git status
    
    # =========================[ Line #2 ]=========================
    newline
    arrow                 # \n
                 # prompt symbol
  )
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    direnv                  # direnv status (https://direnv.net/)
    asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
    virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
    anaconda                # conda environment (https://conda.io/)
    pyenv                   # python environment (https://github.com/pyenv/pyenv)
    goenv                   # go environment (https://github.com/syndbg/goenv)
    nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
    nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
    nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
    # node_version          # node.js version
    # go_version            # go version (https://golang.org)
    # rust_version          # rustc version (https://www.rust-lang.org)
    # dotnet_version        # .NET version (https://dotnet.microsoft.com)
    # php_version           # php version (https://www.php.net/)
    # laravel_version       # laravel php framework version (https://laravel.com/)
    # java_version          # java version (https://www.java.com/)
    # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
    rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
    rvm                     # ruby version from rvm (https://rvm.io)
    fvm                     # flutter version management (https://github.com/leoafarias/fvm)
    luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
    jenv                    # java version from jenv (https://github.com/jenv/jenv)
    plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
    perlbrew                # perl version from perlbrew (https://github.com/gugod/App-perlbrew)
    phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
    scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
    haskell_stack           # haskell version from stack (https://haskellstack.org/)
    kubecontext             # current kubernetes context (https://kubernetes.io/)
    terraform               # terraform workspace (https://www.terraform.io)
    # terraform_version     # terraform version (https://www.terraform.io)
    aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
    aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
    azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
    gcloud                  # google cloud cli account and project (https://cloud.google.com/)
    google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
    toolbox                 # toolbox name (https://github.com/containers/toolbox)
    context                 # user@hostname
    nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
    ranger                  # ranger shell (https://github.com/ranger/ranger)
    nnn                     # nnn shell (https://github.com/jarun/nnn)
    lf                      # lf shell (https://github.com/gokcehan/lf)
    xplr                    # xplr shell (https://github.com/sayanarijit/xplr)
    vim_shell               # vim shell indicator (:sh)
    midnight_commander      # midnight commander shell (https://midnight-commander.org/)
    nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
    chezmoi_shell           # chezmoi shell (https://www.chezmoi.io/)
    # vpn_ip                # virtual private network indicator
    # load                  # CPU load
    # disk_usage            # disk usage
    # ram                   # free RAM
    # swap                  # used swap
    todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
    timewarrior             # timewarrior tracking status (https://timewarrior.net/)
    taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
    # cpu_arch              # CPU architecture
    #time                    # current time
    # =========================[ Line #2 ]=========================
    newline
    # ip                    # ip address and bandwidth usage for a specified network interface
    # public_ip             # public IP address
    # proxy                 # system-wide http/https/ftp proxy
    # battery               # internal battery
    # wifi                  # wifi speed
    # example               # example user-defined segment (see prompt_example function below)
  )
  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_RULER_CHAR='─'        # reasonable alternative: '·'
  typeset -g POWERLEVEL9K_RULER_FOREGROUND=242
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=242
    typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=002
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=001
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='󰇘'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=007
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=015
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=015
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  # Don't shorten directories that contain any of these files. They are anchors.
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-version
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' \uF126 '
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  function my_git_formatter() {
    emulate -L zsh

    if [[ -n $P9K_CONTENT ]]; then
      # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
      # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    if (( $1 )); then
      local       meta='%f'     # default foreground
      local      clean='%012F'   # green foreground
      local   modified='%226F'  # yellow foreground
      local  untracked='%007F'   # blue foreground
      local conflicted='%001F'  # red foreground
    else
      # Styling for incomplete and stale Git status.
      local       meta='%244F'  # grey foreground
      local      clean='%244F'  # grey foreground
      local   modified='%244F'  # grey foreground
      local  untracked='%244F'  # grey foreground
      local conflicted='%244F'  # grey foreground
    fi

    local res

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
      (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
      res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
    fi

    if [[ -n $VCS_STATUS_TAG
          # Show tag only if not on a branch.
          # Tip: To always show tag, delete the next line.
          && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
        ]]; then
      local tag=${(V)VCS_STATUS_TAG}
      # If tag name is at most 32 characters long, show it in full.
      # Otherwise show the first 12 … the last 12.
      # Tip: To always show tag name in full without truncation, delete the next line.
      (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
      res+="${meta}#${clean}${tag//\%/%%}"
    fi

    # Display the current Git commit if there is no branch and no tag.
    # Tip: To always display the current Git commit, delete the next line.
    [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
      res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

    # Show tracking branch name if it differs from local branch.
    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
    fi

    # Display "wip" if the latest commit's summary contains "wip" or "WIP".
    if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
      res+=" ${modified}wip"
    fi

    # ⇣42 if behind the remote.
    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
    # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    # ⇠42 if behind the push remote.
    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
    # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
    (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
    # *42 if have stashes.
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    # 'merge' if the repo is in an unusual state.
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    # ~42 if have merge conflicts.
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    # +42 if have staged changes.
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    # !42 if have unstaged changes.
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    # ?42 if have untracked files. It's really a question mark, your font isn't broken.
    # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
    # Remove the next line if you don't want to see untracked files at all.
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    # "─" if the number of unstaged files is unknown. This can happen due to
    # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
    # than the number of files in the Git index, or due to bash.showDirtyState being set to false
    # in the repository config. The number of staged and untracked files may also be unknown
    # in this case.
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=015
  typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178

  ##########################[ status: exit code of the last command ]###########################
  # Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
  # style them independently from the regular OK and ERROR state.
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

  # Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
  # it will signify success by turning green.
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

  # Status when some part of a pipe command fails but the overall exit status is zero. It may look
  # like this: 1|0.
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=70
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

  # Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
  # it will signify error by turning red.
  typeset -g POWERLEVEL9K_STATUS_ERROR=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'

  # Status when the last command was terminated by a signal.
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=001
  # Use terse signal names: "INT" instead of "SIGINT(2)".
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION=''

  # Status when some part of a pipe command fails and the overall exit status is also non-zero.
  # It may look like this: 1|0.
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=001
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION=''

  ###################[ command_execution_time: duration of the last command ]###################
  # Show duration of the last command if takes at least this many seconds.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  # Show this many fractional digits. Zero means round to seconds.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  # Execution time color.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
  # Duration format: 1d 2h 3m 4s.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  # Custom icon.
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='%ftook '

  #######################[ background_jobs: presence of background jobs ]#######################
  # Don't show the number of background jobs.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  # Background jobs color.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=70
  # Custom icon.
  # typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ direnv: direnv status (https://direnv.net/) ]########################
  # Direnv color.
  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=178
  # Custom icon.
  # typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
  # Default asdf color. Only used to display tools for which there is no color override (see below).
  # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_FOREGROUND.
  typeset -g POWERLEVEL9K_ASDF_FOREGROUND=66

  # There are four parameters that can be used to hide asdf tools. Each parameter describes
  # conditions under which a tool gets hidden. Parameters can hide tools but not unhide them. If at
  # least one parameter decides to hide a tool, that tool gets hidden. If no parameter decides to
  # hide a tool, it gets shown.
  #
  # Special note on the difference between POWERLEVEL9K_ASDF_SOURCES and
  # POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW. Consider the effect of the following commands:
  #
  #   asdf local  python 3.8.1
  #   asdf global python 3.8.1
  #
  # After running both commands the current python version is 3.8.1 and its source is "local" as
  # it takes precedence over "global". If POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW is set to false,
  # it'll hide python version in this case because 3.8.1 is the same as the global version.
  # POWERLEVEL9K_ASDF_SOURCES will hide python version only if the value of this parameter doesn't
  # contain "local".

  # Hide tool versions that don't come from one of these sources.
  #
  # Available sources:
  #
  # - shell   `asdf current` says "set by ASDF_${TOOL}_VERSION environment variable"
  # - local   `asdf current` says "set by /some/not/home/directory/file"
  # - global  `asdf current` says "set by /home/username/file"
  #
  # Note: If this parameter is set to (shell local global), it won't hide tools.
  # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SOURCES.
  typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)

  # If set to false, hide tool versions that are the same as global.
  #
  # Note: The name of this parameter doesn't reflect its meaning at all.
  # Note: If this parameter is set to true, it won't hide tools.
  # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_PROMPT_ALWAYS_SHOW.
  typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

  # If set to false, hide tool versions that are equal to "system".
  #
  # Note: If this parameter is set to true, it won't hide tools.
  # Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SHOW_SYSTEM.
  typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true

  # If set to non-empty value, hide tools unless there is a file matching the specified file pattern
  # in the current directory, or its parent directory, or its grandparent directory, and so on.
  #
  # Note: If this parameter is set to empty value, it won't hide tools.
  # Note: SHOW_ON_UPGLOB isn't specific to asdf. It works with all prompt segments.
  # Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SHOW_ON_UPGLOB.
  #
  # Example: Hide nodejs version when there is no package.json and no *.js files in the current
  # directory, in `..`, in `../..` and so on.
  #
  #   typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.js|package.json'
  typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

  # Ruby version from asdf.
  typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=168
  # typeset -g POWERLEVEL9K_ASDF_RUBY_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_RUBY_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Python version from asdf.
  typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=37
  # typeset -g POWERLEVEL9K_ASDF_PYTHON_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_PYTHON_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Go version from asdf.
  typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=37
  # typeset -g POWERLEVEL9K_ASDF_GOLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_GOLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Node.js version from asdf.
  typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=70
  # typeset -g POWERLEVEL9K_ASDF_NODEJS_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_NODEJS_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Rust version from asdf.
  typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=37
  # typeset -g POWERLEVEL9K_ASDF_RUST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_RUST_SHOW_ON_UPGLOB='*.foo|*.bar'

  # .NET Core version from asdf.
  typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=134
  # typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_DOTNET_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Flutter version from asdf.
  typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=38
  # typeset -g POWERLEVEL9K_ASDF_FLUTTER_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_FLUTTER_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Lua version from asdf.
  typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=32
  # typeset -g POWERLEVEL9K_ASDF_LUA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_LUA_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Java version from asdf.
  typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=32
  # typeset -g POWERLEVEL9K_ASDF_JAVA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_JAVA_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Perl version from asdf.
  typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=67
  # typeset -g POWERLEVEL9K_ASDF_PERL_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_PERL_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Erlang version from asdf.
  typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=125
  # typeset -g POWERLEVEL9K_ASDF_ERLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_ERLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Elixir version from asdf.
  typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=129
  # typeset -g POWERLEVEL9K_ASDF_ELIXIR_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_ELIXIR_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Postgres version from asdf.
  typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=31
  # typeset -g POWERLEVEL9K_ASDF_POSTGRES_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_POSTGRES_SHOW_ON_UPGLOB='*.foo|*.bar'

  # PHP version from asdf.
  typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=99
  # typeset -g POWERLEVEL9K_ASDF_PHP_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_PHP_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Haskell version from asdf.
  typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=172
  # typeset -g POWERLEVEL9K_ASDF_HASKELL_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_HASKELL_SHOW_ON_UPGLOB='*.foo|*.bar'

  # Julia version from asdf.
  typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND=70
  # typeset -g POWERLEVEL9K_ASDF_JULIA_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # typeset -g POWERLEVEL9K_ASDF_JULIA_SHOW_ON_UPGLOB='*.foo|*.bar'

  ##########[ nordvpn: nordvpn connection status, linux only (https://nordvpn.com/) ]###########
  # NordVPN connection indicator color.
  typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=39
  # Hide NordVPN connection indicator when not connected.
  typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=
  # Custom icon.
  # typeset -g POWERLEVEL9K_NORDVPN_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ ranger: ranger shell (https://github.com/ranger/ranger) ]##################
  # Ranger shell color.
  typeset -g POWERLEVEL9K_RANGER_FOREGROUND=178
  # Custom icon.
  # typeset -g POWERLEVEL9K_RANGER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ nnn: nnn shell (https://github.com/jarun/nnn) ]#######################
  # Nnn shell color.
  typeset -g POWERLEVEL9K_NNN_FOREGROUND=72
  # Custom icon.
  # typeset -g POWERLEVEL9K_NNN_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################[ lf: lf shell (https://github.com/gokcehan/lf) ]#######################
  # lf shell color.
  typeset -g POWERLEVEL9K_LF_FOREGROUND=72
  # Custom icon.
  # typeset -g POWERLEVEL9K_LF_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################[ xplr: xplr shell (https://github.com/sayanarijit/xplr) ]##################
  # xplr shell color.
  typeset -g POWERLEVEL9K_XPLR_FOREGROUND=72
  # Custom icon.
  # typeset -g POWERLEVEL9K_XPLR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########################[ vim_shell: vim shell indicator (:sh) ]###########################
  # Vim shell indicator color.
  typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=34
  # Custom icon.
  # typeset -g POWERLEVEL9K_VIM_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######[ midnight_commander: midnight commander shell (https://midnight-commander.org/) ]######
  # Midnight Commander shell color.
  typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND=178
  # Custom icon.
  # typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #[ nix_shell: nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html) ]##
  # Nix shell color.
  typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND=74

  # Display the icon of nix_shell if PATH contains a subdirectory of /nix/store.
  # typeset -g POWERLEVEL9K_NIX_SHELL_INFER_FROM_PATH=false

  # Tip: If you want to see just the icon without "pure" and "impure", uncomment the next line.
  # typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION=

  # Custom icon.
  # typeset -g POWERLEVEL9K_NIX_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################[ chezmoi_shell: chezmoi shell (https://www.chezmoi.io/) ]##################
  # chezmoi shell color.
  typeset -g POWERLEVEL9K_CHEZMOI_SHELL_FOREGROUND=33
  # Custom icon.
  # typeset -g POWERLEVEL9K_CHEZMOI_SHELL_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################################[ disk_usage: disk usage ]##################################
  # Colors for different levels of disk usage.
  typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=35
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=220
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=160
  # Thresholds for different levels of disk usage (percentage points).
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95
  # If set to true, hide disk usage when below $POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL percent.
  typeset -g POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false
  # Custom icon.
  # typeset -g POWERLEVEL9K_DISK_USAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################################[ ram: free RAM ]#######################################
  # RAM color.
  typeset -g POWERLEVEL9K_RAM_FOREGROUND=66
  # Custom icon.
  # typeset -g POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################################[ swap: used swap ]######################################
  # Swap color.
  typeset -g POWERLEVEL9K_SWAP_FOREGROUND=96
  # Custom icon.
  # typeset -g POWERLEVEL9K_SWAP_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ######################################[ load: CPU load ]######################################
  # Show average CPU load over this many last minutes. Valid values are 1, 5 and 15.
  typeset -g POWERLEVEL9K_LOAD_WHICH=5
  # Load color when load is under 50%.
  typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=66
  # Load color when load is between 50% and 70%.
  typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=178
  # Load color when load is over 70%.
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=166
  # Custom icon.
  # typeset -g POWERLEVEL9K_LOAD_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ todo: todo items (https://github.com/todotxt/todo.txt-cli) ]################
  # Todo color.
  typeset -g POWERLEVEL9K_TODO_FOREGROUND=110
  # Hide todo when the total number of tasks is zero.
  typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
  # Hide todo when the number of tasks after filtering is zero.
  typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false

  # Todo format. The following parameters are available within the expansion.
  #
  # - P9K_TODO_TOTAL_TASK_COUNT     The total number of tasks.
  # - P9K_TODO_FILTERED_TASK_COUNT  The number of tasks after filtering.
  #
  # These variables correspond to the last line of the output of `todo.sh -p ls`:
  #
  #   TODO: 24 of 42 tasks shown
  #
  # Here 24 is P9K_TODO_FILTERED_TASK_COUNT and 42 is P9K_TODO_TOTAL_TASK_COUNT.
  #
  # typeset -g POWERLEVEL9K_TODO_CONTENT_EXPANSION='$P9K_TODO_FILTERED_TASK_COUNT'

  # Custom icon.
  # typeset -g POWERLEVEL9K_TODO_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ timewarrior: timewarrior tracking status (https://timewarrior.net/) ]############
  # Timewarrior color.
  typeset -g POWERLEVEL9K_TIMEWARRIOR_FOREGROUND=110
  # If the tracked task is longer than 24 characters, truncate and append "…".
  # Tip: To always display tasks without truncation, delete the following parameter.
  # Tip: To hide task names and display just the icon when time tracking is enabled, set the
  # value of the following parameter to "".
  typeset -g POWERLEVEL9K_TIMEWARRIOR_CONTENT_EXPANSION='${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}'

  # Custom icon.
  # typeset -g POWERLEVEL9K_TIMEWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############
  # Taskwarrior color.
  typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=74

  # Taskwarrior segment format. The following parameters are available within the expansion.
  #
  # - P9K_TASKWARRIOR_PENDING_COUNT   The number of pending tasks: `task +PENDING count`.
  # - P9K_TASKWARRIOR_OVERDUE_COUNT   The number of overdue tasks: `task +OVERDUE count`.
  #
  # Zero values are represented as empty parameters.
  #
  # The default format:
  #
  #   '${P9K_TASKWARRIOR_OVERDUE_COUNT:+"!$P9K_TASKWARRIOR_OVERDUE_COUNT/"}$P9K_TASKWARRIOR_PENDING_COUNT'
  #
  # typeset -g POWERLEVEL9K_TASKWARRIOR_CONTENT_EXPANSION='$P9K_TASKWARRIOR_PENDING_COUNT'

  # Custom icon.
  # typeset -g POWERLEVEL9K_TASKWARRIOR_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################################[ cpu_arch: CPU architecture ]################################
  # CPU architecture color.
  typeset -g POWERLEVEL9K_CPU_ARCH_FOREGROUND=172

  # Hide the segment when on a specific CPU architecture.
  # typeset -g POWERLEVEL9K_CPU_ARCH_X86_64_CONTENT_EXPANSION=
  # typeset -g POWERLEVEL9K_CPU_ARCH_X86_64_VISUAL_IDENTIFIER_EXPANSION=

  # Custom icon.
  # typeset -g POWERLEVEL9K_CPU_ARCH_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##################################[ context: user@hostname ]##################################
  # Context color when running with privileges.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=178
  # Context color in SSH without privileges.
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=180
  # Default context color (no privileges, no SSH).
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180

  # Context format when running with privileges: bold user@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n@%m'
  # Context format when in SSH without privileges: user@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
  # Default context format (no privileges, no SSH): user@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  # Don't show context unless running with privileges or in SSH.
  # Tip: Remove the next line to always show context.
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

  # Custom icon.
  # typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
  # typeset -g POWERLEVEL9K_CONTEXT_PREFIX='%fwith '

  ###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
  # Python virtual environment color.
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=37
  # Don't show Python version next to the virtual environment name.
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  # If set to "false", won't show virtualenv if pyenv is already shown.
  # If set to "if-different", won't show virtualenv if it's the same as pyenv.
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  # Separate environment name from Python version only with a space.
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=
  # Custom icon.
  # typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################[ anaconda: conda environment (https://conda.io/) ]######################
  # Anaconda environment color.
  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=37

  # Anaconda segment format. The following parameters are available within the expansion.
  #
  # - CONDA_PREFIX                 Absolute path to the active Anaconda/Miniconda environment.
  # - CONDA_DEFAULT_ENV            Name of the active Anaconda/Miniconda environment.
  # - CONDA_PROMPT_MODIFIER        Configurable prompt modifier (see below).
  # - P9K_ANACONDA_PYTHON_VERSION  Current python version (python --version).
  #
  # CONDA_PROMPT_MODIFIER can be configured with the following command:
  #
  #   conda config --set env_prompt '({default_env}) '
  #
  # The last argument is a Python format string that can use the following variables:
  #
  # - prefix       The same as CONDA_PREFIX.
  # - default_env  The same as CONDA_DEFAULT_ENV.
  # - name         The last segment of CONDA_PREFIX.
  # - stacked_env  Comma-separated list of names in the environment stack. The first element is
  #                always the same as default_env.
  #
  # Note: '({default_env}) ' is the default value of env_prompt.
  #
  # The default value of POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION expands to $CONDA_PROMPT_MODIFIER
  # without the surrounding parentheses, or to the last path component of CONDA_PREFIX if the former
  # is empty.
  typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='${${${${CONDA_PROMPT_MODIFIER#\(}% }%\)}:-${CONDA_PREFIX:t}}'

  # Custom icon.
  # typeset -g POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
  # Pyenv color.
  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=37
  # Hide python version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
  # If set to false, hide python version if it's the same as global:
  # $(pyenv version-name) == $(pyenv global).
  typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide python version if it's equal to "system".
  typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

  # Pyenv segment format. The following parameters are available within the expansion.
  #
  # - P9K_CONTENT                Current pyenv environment (pyenv version-name).
  # - P9K_PYENV_PYTHON_VERSION   Current python version (python --version).
  #
  # The default format has the following logic:
  #
  # 1. Display just "$P9K_CONTENT" if it's equal to "$P9K_PYENV_PYTHON_VERSION" or
  #    starts with "$P9K_PYENV_PYTHON_VERSION/".
  # 2. Otherwise display "$P9K_CONTENT $P9K_PYENV_PYTHON_VERSION".
  typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}'

  # Custom icon.
  # typeset -g POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ################[ goenv: go environment (https://github.com/syndbg/goenv) ]################
  # Goenv color.
  typeset -g POWERLEVEL9K_GOENV_FOREGROUND=37
  # Hide go version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
  # If set to false, hide go version if it's the same as global:
  # $(goenv version-name) == $(goenv global).
  typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide go version if it's equal to "system".
  typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_GOENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
  # Nodenv color.
  typeset -g POWERLEVEL9K_NODENV_FOREGROUND=70
  # Hide node version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
  # If set to false, hide node version if it's the same as global:
  # $(nodenv version-name) == $(nodenv global).
  typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide node version if it's equal to "system".
  typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
  # Nvm color.
  typeset -g POWERLEVEL9K_NVM_FOREGROUND=70
  # If set to false, hide node version if it's the same as default:
  # $(nvm version current) == $(nvm version default).
  typeset -g POWERLEVEL9K_NVM_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide node version if it's equal to "system".
  typeset -g POWERLEVEL9K_NVM_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
  # Nodeenv color.
  typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=70
  # Don't show Node version next to the environment name.
  typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
  # Separate environment name from Node version only with a space.
  typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
  # Custom icon.
  # typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##############################[ node_version: node.js version ]###############################
  # Node version color.
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=70
  # Show node version only when in a directory tree containing package.json.
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ go_version: go version (https://golang.org) ]########################
  # Go version color.
  typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=37
  # Show go version only when in a go project subdirectory.
  typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #################[ rust_version: rustc version (https://www.rust-lang.org) ]##################
  # Rust version color.
  typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=37
  # Show rust version only when in a rust project subdirectory.
  typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_RUST_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############[ dotnet_version: .NET version (https://dotnet.microsoft.com) ]################
  # .NET version color.
  typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND=134
  # Show .NET version only when in a .NET project subdirectory.
  typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_DOTNET_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #####################[ php_version: php version (https://www.php.net/) ]######################
  # PHP version color.
  typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND=99
  # Show PHP version only when in a PHP project subdirectory.
  typeset -g POWERLEVEL9K_PHP_VERSION_PROJECT_ONLY=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_PHP_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ laravel_version: laravel php framework version (https://laravel.com/) ]###########
  # Laravel version color.
  typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND=161
  # Custom icon.
  # typeset -g POWERLEVEL9K_LARAVEL_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ####################[ java_version: java version (https://www.java.com/) ]####################
  # Java version color.
  typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=32
  # Show java version only when in a java project subdirectory.
  typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
  # Show brief version.
  typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false
  # Custom icon.
  # typeset -g POWERLEVEL9K_JAVA_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###[ package: name@version from package.json (https://docs.npmjs.com/files/package.json) ]####
  # Package color.
  typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=117
  # Package format. The following parameters are available within the expansion.
  #
  # - P9K_PACKAGE_NAME     The value of `name` field in package.json.
  # - P9K_PACKAGE_VERSION  The value of `version` field in package.json.
  #
  # typeset -g POWERLEVEL9K_PACKAGE_CONTENT_EXPANSION='${P9K_PACKAGE_NAME//\%/%%}@${P9K_PACKAGE_VERSION//\%/%%}'
  # Custom icon.
  # typeset -g POWERLEVEL9K_PACKAGE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #############[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]##############
  # Rbenv color.
  typeset -g POWERLEVEL9K_RBENV_FOREGROUND=168
  # Hide ruby version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
  # If set to false, hide ruby version if it's the same as global:
  # $(rbenv version-name) == $(rbenv global).
  typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide ruby version if it's equal to "system".
  typeset -g POWERLEVEL9K_RBENV_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  #######################[ rvm: ruby version from rvm (https://rvm.io) ]########################
  # Rvm color.
  typeset -g POWERLEVEL9K_RVM_FOREGROUND=168
  # Don't show @gemset at the end.
  typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
  # Don't show ruby- at the front.
  typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false
  # Custom icon.
  # typeset -g POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ fvm: flutter version management (https://github.com/leoafarias/fvm) ]############
  # Fvm color.
  typeset -g POWERLEVEL9K_FVM_FOREGROUND=38
  # Custom icon.
  # typeset -g POWERLEVEL9K_FVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ##########[ luaenv: lua version from luaenv (https://github.com/cehoffman/luaenv) ]###########
  # Lua color.
  typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=32
  # Hide lua version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
  # If set to false, hide lua version if it's the same as global:
  # $(luaenv version-name) == $(luaenv global).
  typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide lua version if it's equal to "system".
  typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_LUAENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###############[ jenv: java version from jenv (https://github.com/jenv/jenv) ]################
  # Java color.
  typeset -g POWERLEVEL9K_JENV_FOREGROUND=32
  # Hide java version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
  # If set to false, hide java version if it's the same as global:
  # $(jenv version-name) == $(jenv global).
  typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide java version if it's equal to "system".
  typeset -g POWERLEVEL9K_JENV_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_JENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ plenv: perl version from plenv (https://github.com/tokuhirom/plenv) ]############
  # Perl color.
  typeset -g POWERLEVEL9K_PLENV_FOREGROUND=67
  # Hide perl version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
  # If set to false, hide perl version if it's the same as global:
  # $(plenv version-name) == $(plenv global).
  typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide perl version if it's equal to "system".
  typeset -g POWERLEVEL9K_PLENV_SHOW_SYSTEM=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_PLENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ###########[ perlbrew: perl version from perlbrew (https://github.com/gugod/App-perlbrew) ]############
  # Perlbrew color.
  typeset -g POWERLEVEL9K_PERLBREW_FOREGROUND=67
  # Show perlbrew version only when in a perl project subdirectory.
  typeset -g POWERLEVEL9K_PERLBREW_PROJECT_ONLY=true
  # Don't show "perl-" at the front.
  typeset -g POWERLEVEL9K_PERLBREW_SHOW_PREFIX=false
  # Custom icon.
  # typeset -g POWERLEVEL9K_PERLBREW_VISUAL_IDENTIFIER_EXPANSION='⭐'

  ############[ phpenv: php version from phpenv (https://github.com/phpenv/phpenv) ]############
  # PHP color.
  typeset -g POWERLEVEL9K_PHPENV_FOREGROUND=99
  # Hide php version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_PHPENV_SOURCES=(shell local global)
  # If set to false, hide php version if it's the same as global:
  # $(phpenv version-name) == $(phpenv global).
  typeset -g POWERLEVEL9K_PHPENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide php version if it's equal to "system".
  typeset -g POWERLEVEL9K_PHPENV_SHOW_SYSTEM=true
  typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND=160
  # Hide scala version if it doesn't come from one of these sources.
  typeset -g POWERLEVEL9K_SCALAENV_SOURCES=(shell local global)
  # If set to false, hide scala version if it's the same as global:
  # $(scalaenv version-name) == $(scalaenv global).
  typeset -g POWERLEVEL9K_SCALAENV_PROMPT_ALWAYS_SHOW=false
  # If set to false, hide scala version if it's equal to "system".
  typeset -g POWERLEVEL9K_SCALAENV_SHOW_SYSTEM=true
  typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND=172
  typeset -g POWERLEVEL9K_HASKELL_STACK_SOURCES=(shell local)
  # If set to false, hide haskell version if it's the same as in the implicit global project.
  typeset -g POWERLEVEL9K_HASKELL_STACK_ALWAYS_SHOW=true
  typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent|kubecolor|cmctl|sparkctl'
  typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      # '*prod*'  PROD    # These values are examples that are unlikely
      # '*test*'  TEST    # to match your needs. Customize them as needed.
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=134
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
  # Show P9K_KUBECONTEXT_CLOUD_CLUSTER if it's not empty and fall back to P9K_KUBECONTEXT_NAME.
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
  # Append the current context's namespace if it's not "default".
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'
  typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
      '*'         OTHER)
  typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=38
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND=38
  typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi|terragrunt'
  typeset -g POWERLEVEL9K_AWS_CLASSES=(
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=208
  typeset -g POWERLEVEL9K_AWS_CONTENT_EXPANSION='${P9K_AWS_PROFILE//\%/%%}${P9K_AWS_REGION:+ ${P9K_AWS_REGION//\%/%%}}'
  typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=70
  typeset -g POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|pulumi|terragrunt'
  typeset -g POWERLEVEL9K_AZURE_FOREGROUND=32
  typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs|gsutil'
  typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=32
  typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
  typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'
  typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND=('terraform|pulumi|terragrunt'
      '*'             DEFAULT)
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=32
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'
  typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND=178
  typeset -g POWERLEVEL9K_TOOLBOX_CONTENT_EXPANSION='${P9K_TOOLBOX_NAME:#fedora-toolbox-*}'
  typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=94
  typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=81
  typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(gpd|wg|(.*tun)|tailscale)[0-9]*|(zt.*)'
  typeset -g POWERLEVEL9K_VPN_IP_SHOW_ALL=false
  typeset -g POWERLEVEL9K_IP_FOREGROUND=38
  typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='$P9K_IP_IP${P9K_IP_RX_RATE:+ %70F⇣$P9K_IP_RX_RATE}${P9K_IP_TX_RATE:+ %215F⇡$P9K_IP_TX_RATE}'
  typeset -g POWERLEVEL9K_IP_INTERFACE='[ew].*'
  typeset -g POWERLEVEL9K_PROXY_FOREGROUND=68
  typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=160
  typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=70
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=178
  typeset -g POWERLEVEL9K_BATTERY_STAGES='\UF008E\UF007A\UF007B\UF007C\UF007D\UF007E\UF007F\UF0080\UF0081\UF0082\UF0079'
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false
  typeset -g POWERLEVEL9K_WIFI_FOREGROUND=68
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  function prompt_example() {
    p10k segment -f 208 -i '⭐' -t 'hello, %n'
  }

  function prompt_uname() {
    p10k segment -f 002 -t $(whoami)
  }

  function prompt_arrow() {
    p10k segment -f 002 -t ' 󰇘'
  }

  function prompt_divider() {
    p10k segment -f 007 -i '󰁥'
  }

  function prompt_hostname() {
    p10k segment -f 004 -t $(cat /etc/hostname)
  }

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
