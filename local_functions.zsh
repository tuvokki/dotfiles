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
