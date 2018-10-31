function hist() {
	history 10000 | grep $1
}

# Find all aliasses for a certain search key
#
# Ex: galias commit
function galias() {
    if [[ $# != 1 ]] {
        alias
    } else {
        alias | grep $1
    }
}

function open_code() {
	ws=(*.code-workspace(ND.))
	if [[ $#ws -ne 0 ]]; then
		if [[ $#ws -eq 1 ]]; then
			code ${ws}
		else
			print -r "Directory contains ${#ws} workspace files"
		fi
	else
		code .
	fi
}