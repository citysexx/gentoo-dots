#!/bin/bash

# 1. Should be root to run this script using SUDO only
# 2. Should specify ABSOLUTE paths in your input file
# for the script to work properly
# 3. Should not run this script as bare root or sudo as root
#

if [[ $SUDO_USER == "root" ]]; then
  echo Are you stupid?
  exit 1
elif [[ $SUDO_USER == "" ]]; then
  echo Aborting... Please run as sudo.
  exit 1
fi

dirs_created=0
files_created=0
dirs_removed=0
files_removed=0
backup_file ()
{
  file=$1
  output_root=$2
  if [[ -d $file ]]; then
    echo "$file is a directory, creating it in the output_root and adding all files to  it, as you specified the whole folder..."
    mkdir -pv $output_root/backup$file
    cp -rv $file/* $output_root/backup$file/
    ((dirs_created++))

  elif [[ -f $file ]]; then
    echo "$file is a file, so the path to it will be created and the file will be sited, if not exists. CAREFUL: If exists, will be overwritten"
    
    if test -f $output_root$file; then
      echo file exists, overwriting
    else
      echo no such file yet created. Strapping path to this file...
      mkdir -pv $(dirname $output_root/backup$file) 
    cp -v $file $output_root/backup$file
    ((files_created++))
    fi
  else
    echo "$file is not valid"
  fi
}

clean_folder() {
  backup_file=$1
  if [[ -z "$(ls -A $(dirname $backup_file))" ]]; then
    echo $(dirname $backup_file) is empty, removing it...
    rm -r $(dirname $backup_file)
  fi
}

flush() {
  used_to_be=$(pwd)
  output_root=$1
  cd $output_root/backup
  declare -a paths=( $(find .) )
  
  for i in "${!paths[@]}"; do
    real_file=$(echo ${paths[i]} | cut -c 2-)
    backup_file=${paths[i]}
    if test -e $real_file; then
      echo Checked that $real_file exists
    else
      echo $real_file exists no more. Initiating removal procedure...
      if [[ -d $backup_file ]]; then
        echo Removing dir $backup_file...
        rm -r $backup_file
        ((dirs_removed++))
        clean_folder $backup_file
      elif [[ -f $backup_file ]]; then
        echo Removing file $backup_file...
        rm $backup_file
        ((files_removed++))
        clean_folder $backup_file
      else
        echo not valid file kind for processing!
      fi
    fi
  done
  cd $used_to_be
  echo Came back to $used_to_be
}

help ()
{
  echo "Usage: ./backup.sh [OPTIONS]" && echo "-o: output directory, -f: input file with backup targets"
}

output=$(pwd) # by default creates a backup tree in the dir from where script is called
while getopts "f:o:-:" opt; do
  case $opt in 
    f) echo File path specified: $2. Will read lines from it
      pathToFile=$2
      if test -f "$pathToFile"; then
        echo Found file on the specified path
      else
        echo There is no such file. Please make sure the file exists and specify an absolute path
      exit 1
      fi

      declare -a files
      mapfile -t files < $pathToFile ;;
    o) # this option overrides the behavior with pwd
      echo Specified option output dir: $4
      echo Checking the validity of output dir
      if [[ -f $4 ]]; then
        echo You have specified a file, not a dir. Exiting...
        exit 1
      fi
      echo Overriding default pwd value
      output=$4
      ;;
    -)
      case "${OPTARG}" in
        *) help ;;
        help) help ;;
      esac
    ;;
    *) help ;;
  esac
done

for i in "${!files[@]}"; do
  if [[ ${files[i]} != "" ]]; then
    backup_file ${files[i]} $output
  fi
done

flush $output
echo Dirs created/rewritten: $dirs_created. Files created/rewritten: $files_created. Dirs removed: $dirs_removed. Files removed: $files_removeda

if [[ -z $SUDO_USER ]]; then
  echo You have fucked up permissions btw, cause you did not read the file beginning. It is NOT recommended to run this as bare root or sudo as root. Run this as user in sudo
else
  echo chown: Nice, it is all successful, you own the dir backup now type ls -al to make sure
  chown -R $SUDO_USER:$SUDO_USER $output/backup
  # Do not forget to chown the root folders BACK TO ROOT WHEN YOU DECIDE TO RESTORE SOME FILES to root. You can omit rechowning for home (if user not changed)
fi


