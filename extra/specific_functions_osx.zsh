# Find directories a process is running in
#
# Ex: runningDir node
function runningDir() {
	for i in `ps ax|grep $1|grep -v grep | awk '{print $1}'`
		lsof -a -d cwd -p $i
}

# Change ownership of all brew files to the current user
function own_brew() {
	sudo chown -R $(whoami) /usr/local/lib/pkgconfig
	sudo chown -R $(whoami) /usr/local/opt
	sudo chown -R $(whoami) /usr/local/include
	sudo chown -R $(whoami) /usr/local/share/info
	sudo chown -R $(whoami) /usr/local/Cellar
	sudo chown -R $(whoami) /usr/local/Homebrew
	sudo chown -R $(whoami) /usr/local/var/homebrew/locks/
	sudo chown -R $(whoami) /usr/local/var/homebrew/
	sudo chown -R $(whoami) /usr/local/sbin
	sudo chown -R $(whoami) /usr/local/var
	sudo chown -R $(whoami) /usr/local/Frameworks
}

# Change ownership of all npm files to the current user
function own_npm() {
	sudo chown -R $(whoami) /usr/local/lib/node_modules/
}
