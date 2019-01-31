function hist() {
	history 10000 | grep $1
}

# Parse the output (of cat, ps etc.) and highlight a word
# You can customize the color using one of these codes
#   30m black
#   31m red
#   32m green
#   33m yellow
#   34m blue
#   35m magenta
#   36m cyan
#   37m white
# Using 7m instead of a color code will put the string in reverse video.
grepc()
{
  pattern=$1
  shift
  esc=$(printf "\033")
  sed 's"'"$pattern"'"'$esc'[32m&'$esc'[0m"g' "$@"
}
# Alternatives:
highlight () { grep --color -E "$1|$" "${@:1}" ; }
# cat testt.c | sed $'s/word/\E[31m&\E[0m/g'
# grep -E --color=auto 'word|$' file

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

function grn() {
  # put current brnach in a variable
  OLD="$(gcu)"
  # rename current branch
  git branch -m $1
  # put new branchname in a variable
  NEW="$(gcu)"
  #  Delete the old-name remote branch and push the new-name local branch
  git push origin :$OLD $NEW
  # Reset the upstream branch for the new-name local branch
  git push origin -u $NEW
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
