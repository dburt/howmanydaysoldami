#!/bin/bash
this_dir=`dirname $0`
unset GEM_HOME
unset GEM_PATH
export HOME=/home/illuminu
export PATH=$HOME/.rvm/bin:"$PATH"
eval "$($HOME/.rvm/scripts/rvm)"
cd . # invoke rvm magic
err_log_file="${this_dir}/log/dispatch_err.log"
exec $HOME/.rvm/bin/ruby-rvm-env "${this_dir}/dispatch_fcgi.rb" "$@" 2>>"${err_log_file}"
