#!/usr/bin/env bash
#Print the status bar for tmux.
# The powerline root directory.
cwd=$(dirname $0)/powerline

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Default status bar is the left one
position="left"

# Theme definition (based on Solarized)
base0="colour244"
base01="colour240"
base02="colour235"

case "$1" in
    ###############################################################
    # Status bar position
    ###############################################################
    --right)
        position="right"
    ;;

    # Configure left status bar
    --left)
        position="left"
    ;;
esac
shift

function separator {
    position=${1:-"left"};
    style=${2:-"bold"};
    sep="separator"

    case "$position" in
        left)   sep="${sep}_right" ;;
        right)  sep="${sep}_left"  ;;
    esac
    eval echo -ne \$${sep}_${style}
    return 1
}


while [ $# -gt 0 ]
do
    case "$1" in
        ###############################################################
        # Segments declarations
        ###############################################################
        tmux_session_info)
            declare -A tmux_session_info
            tmux_session_info=(
                ["script"]="${segments_path}/tmux_session_info.sh"
                ["foreground"]=$base02
                ["background"]="colour136"
                ["separator"]=$(separator $position "bold")
                ["separator_fg"]="default"
            )
            register_segment "tmux_session_info"
        ;;


        hostname)
            declare -A hostname
            hostname=(
                ["script"]="${segments_path}/hostname.sh"
                ["foreground"]="colour0"
                ["background"]="colour33"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "hostname"
        ;;

        lan_ip)
            declare -A lan_ip
            lan_ip=(
                ["script"]="${segments_path}/lan_ip.sh"
                ["foreground"]="colour255"
                ["background"]="colour24"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "lan_ip"
        ;;

        wan_ip)
            declare -A wan_ip
            wan_ip=(
                ["script"]="${segments_path}/wan_ip.sh"
                ["foreground"]="colour255"
                ["background"]="colour24"
                ["separator"]=$(separator $position "bold")
                ["separator_fg"]="colour33"
            )
            register_segment "wan_ip"
        ;;

        vcs_branch)
            declare -A vcs_branch
            vcs_branch=(
                ["script"]="${segments_path}/vcs_branch.sh"
                ["foreground"]="colour88"
                ["background"]=$base02
                ["separator"]=$(separator $position "bold")
            )
            register_segment "vcs_branch"
        ;;

        pwd)
            declare -A pwd
            pwd=(
                ["script"]="${segments_path}/pwd.sh"
                ["foreground"]="colour211"
                ["background"]="colour89"
                ["separator"]=$(separator $position "bold")
            )
        ;;

        mail_count)
            declare -A mail_count
            mail_count=(
                ["script"]="${segments_path}/mail_count_maildir.sh"
                #["script"]="${segments_path}/mail_count_gmail.sh"
                #["script"]="${segments_path}/mail_count_apple_mail.sh"
                ["foreground"]="white"
                ["background"]="red"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "mail_count"
        ;;

        now_playing)
            declare -A now_playing
            if [ "$PLATFORM" == "linux" ]; then
                now_playing+=(["script"]="${segments_path}/np_mpd.sh")
                #now_playing+=(["script"]="${segments_path}/np_mpd_simple.sh")
                #now_playing+=(["script"]="${segments_path}/np_mocp.sh")
                #now_playing+=(["script"]="${segments_path}/np_spotify_linux_wine.sh")
                #now_playing+=(["script"]="${segments_path}/np_spotify_linux_native.sh")
                #now_playing+=(["script"]="${segments_path}/np_rhythmbox.sh")
                #now_playing+=(["script"]="${segments_path}/np_banshee.sh")
                #now_playing+=(["script"]="${segments_path}/np_audacious.sh")
            elif [ "$PLATFORM" == "mac" ]; then
                now_playing+=(["script"]="${segments_path}/np_itunes_mac.sh")
            fi
            if [[ ${now_playing["script"]} ]]; then
                now_playing+=(["foreground"]="colour37")
                now_playing+=(["background"]=$base02)
                now_playing+=(["separator"]=$(separator $position "bold"))
                register_segment "now_playing"
            fi
        ;;

        cpu)
            declare -A cpu
            cpu=(
                ["script"]="${segments_path}/cpu.sh"
                ["foreground"]="colour136"
                ["background"]="colour240"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "cpu"
        ;;

        load)
            declare -A load
            load=(
                ["script"]="${segments_path}/load.sh"
                ["foreground"]=$base02
                ["background"]=$base01
                ["separator"]=$(separator $position "bold")
            )
            register_segment "load"
        ;;

        battery)
            declare -A battery
            battery=(
                ["foreground"]="colour127"
                ["background"]="colour137"
                ["separator"]=$(separator $position "bold")
            )

            if [ "$PLATFORM" == "mac" ]; then
                battery+=(["script"]="${segments_path}/battery_mac.sh")
            else
                battery+=(["script"]="${segments_path}/battery.sh")
            fi
            register_segment "battery"
        ;;

        weather)
            declare -A weather
            weather=(
                ["script"]="${segments_path}/weather_yahoo.sh"
                #["script"]="${segments_path}/weather_google.sh"
                ["foreground"]="colour255"
                ["background"]="colour37"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "weather"
        ;;

        xkb_layout)
            declare -A xkb_layout
            if [ "$PLATFORM" == "linux" ]; then
                xkb_layout=(
                    ["script"]="${segments_path}/xkb_layout.sh"
                    ["foreground"]="colour117"
                    ["background"]="colour125"
                    ["separator"]=$(separator $position "bold")
                )
            fi
            register_segment "xkb_layout"
        ;;

        date_day)
            declare -A date_day
            date_day=(
                ["script"]="${segments_path}/date_day.sh"
                ["foreground"]="colour136"
                ["background"]="colour235"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "date_day"
        ;;

        date_full)
            declare -A date_full
            date_full=(
                ["script"]="${segments_path}/date_full.sh"
                ["foreground"]="colour136"
                ["background"]="colour235"
                ["separator"]=$(separator $position "bold")
            )
            register_segment "date_full"
        ;;

        time)
            declare -A time
            time=(
                ["script"]="${segments_path}/time.sh"
                ["foreground"]="colour136"
                ["background"]="colour235"
                ["separator"]=$(separator $position "thin")
                ["separator_fg"]="default"
            )
            register_segment "time"
        ;;

    esac

    shift
done

# Mute this statusbar?
mute_status_check $position

case "$position" in
    left)
        print_status_line_left
    ;;
    right)
        print_status_line_right
    ;;
esac

exit 0
