if status is-login
    if not set -q __sourced_profile
        set -x __sourced_profile 1
        exec bash -c "\
            test -e /etc/profile && source /etc/profile
            test -e $HOME/.bash_profile && source $HOME/.bash_profile
            exec fish --login
        "
    end
    set -e __sourced_profile
end
