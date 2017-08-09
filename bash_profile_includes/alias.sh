# http://superuser.com/questions/1127067/macos-keeps-asking-my-ssh-passphrase-since-i-updated-to-sierra/1127520#1127520
alias add-server-key='ssh-add -K ~/.ssh/id_rsa'

alias stop-nginx='sudo nginx -s stop'
alias start-nginx='sudo nginx -c /Users/skwok/development/nginx/nginx.conf'
alias start-postgres='pg_ctl -D /usr/local/var/postgresql@9.5 start'

alias clean-branches='for k in $(git branch -a --merged|grep -v "\->"|sed s/^..//);do echo -e $(git log -1 --pretty=format:"%Cgreen%ci %Cred%cr%Creset" "$k")\\t"$k";done|sort'
alias clean-branches-delux='clean-branches | grep -v remote | cut -f 2 | grep -v release | grep -v master'

alias clean-gwt-files='sudo find /private/var/folders -name gwt | xargs rm -r'

alias ll='ls -lG'
alias utc='date -u'
alias one-liner='tr "\n" " "'

alias pbj='pbpaste | python -m json.tool'
alias pbs='pbpaste | sqlformat -r -k upper  -'

alias flushdns='dscacheutil -flushcache'
alias base64encode='openssl base64'
alias shell-server='ssh kashoo-stage-shell-01'

alias enable-java8='source /Users/skwok/bin/java8.sh'
alias enable-java7='source /Users/skwok/bin/java7.sh'
