# Mostrar o ruby version e a gemset no PS1

function rvm_version {
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != "" ] && gemset="@$gemset"
    local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
    [ "$version" != "" ] && version="$version"
    local full="$version$gemset"
    [ "$full" != "" ] && echo "$full"
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\$(rvm_version) \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
