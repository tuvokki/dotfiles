function snapshot() {
if [[ $# == 0 ]]
  then
    echo "Usage: snapshot {directory} [-i|-l]\n"
    echo "Creates a snapshot either in the environment set dir \$SNAPSHOTS"
    echo "\tif that directory is not set it will check for a directory ./snapshots"
    echo "\tadd -l to create a snapshot in the current dir."
    echo "\tadd -i to create a snapshot in ./snapshots or if that does not exist in the current dir."
  else
    CREATEDIR="."
    if [[ $# == 1 ]]; then
      #no override so we check the situation
      if [[ -d $SNAPSHOTDIR ]]; then
        #do nothing use the global setting
        CREATEDIR=$SNAPSHOTDIR
      else
        if [[ -d "./snapshots" ]]; then
          #use the snapshots directory in the current dir
          CREATEDIR="snapshots"
        fi
      fi
    else
      #override the global settings
      if [[ $2 != "-l" ]]; then
        # -i implied TODO: check and do something with it
        if [[ -d "./snapshots" ]]; then
          #use the snapshots directory in the current dir
          CREATEDIR="snapshots"
        fi
      fi
    fi

    SNAPSHOTNAME="$1.`date '+%s'`.tbz"
    tar cjf $CREATEDIR/$SNAPSHOTNAME $1/
    echo "Created snapshot: $CREATEDIR/$SNAPSHOTNAME"
fi
}
# Snapshot function testscript
# $ echo $SNAPSHOTDIR
# /cygdrive/d/Archives/snapshots

# $ snapshot zshfunctions
# Created snapshot: /cygdrive/d/Archives/snapshots/zshfunctions.1354876383.tbz

# $ mkdir snapshots

# $ snapshot zshfunctions
# Created snapshot: /cygdrive/d/Archives/snapshots/zshfunctions.1354876397.tbz

# $ rm -rf snapshots

# $ snapshot zshfunctions -i
# Created snapshot: ./zshfunctions.1354876409.tbz

# $ snapshot zshfunctions -l
# Created snapshot: ./zshfunctions.1354876412.tbz

# $ mkdir snapshots

# $ snapshot zshfunctions
# Created snapshot: /cygdrive/d/Archives/snapshots/zshfunctions.1354876420.tbz

# $ snapshot zshfunctions -i
# Created snapshot: snapshots/zshfunctions.1354876424.tbz

# $ snapshot zshfunctions -l
# Created snapshot: ./zshfunctions.1354876427.tbz

# $ echo $SNAPSHOTDIR
# /cygdrive/d/Archives/snapshots


function ssnapshot() {
if [[ $# == 0 ]]
  then
    echo "Usage: snapshot {directory}"
  else
    SNAPSHOTDIR="snapshots"
    SNAPSHOTNAME="$1.`date '+%s'`.tbz"
    if [[ -d $SNAPSHOTDIR ]]
      then
        sudo tar cjf $SNAPSHOTDIR/$SNAPSHOTNAME $1/
        echo "Created snapshot: $SNAPSHOTDIR/$SNAPSHOTNAME"
      else
        sudo tar cjf $SNAPSHOTNAME $1/
        echo "Created snapshot: $SNAPSHOTNAME"
    fi
fi
}
