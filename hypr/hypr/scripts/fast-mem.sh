FILENAME="$(uuidgen).png"
BASEDIR="/tmp/fast-mem"
mkdir -pv $BASEDIR
grim -g "$(slurp)" "$BASEDIR/$FILENAME"
feh "$BASEDIR/$FILENAME" > /dev/null 2>&1 & disown
