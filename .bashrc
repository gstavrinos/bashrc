# ls on cd
function cd {
    builtin cd "$@" && ls -F
}

# check the weather
weather() {
    curl wttr.in/"$1"
}

# upload a file
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}
# upload a file
alias upload='transfer'
# shortcut to colcon build
alias cb='colcon build --symlink-install'
# weather in Peiraias
alias weather-peiraias='curl wttr.in/Peiraias'
# weather in Athens
alias weather-athens='curl wttr.in/Athens,Greece'
# weather in Cholargos
alias weather-cholargos='curl wttr.in/Cholargos'
# check my public ip
alias public-ip='curl ifconfig.co'
# shortcut to rosdep_install from workspace root and ROS2 Galactic
alias rosdep_install='rosdep install -i --from-path src --rosdistro galactic -y'
