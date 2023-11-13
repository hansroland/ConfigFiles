# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Get and format the debian version
debian_version=$(cat /etc/issue )
debian_version=$(echo $debian_version|tr -d '\n' | tr -d '\l' )

# Get the local IP address
host_name=$(hostname -I | cut -d ' ' -f1)

# Returns the battery status: "Full", "Discharging", or "Charging".
# battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Temp of CPU
# tpkg=$(sensors|grep "Package")
# cpu_temp={tpkg:13:10}
# cpu_temp=$(cut -c 14-23 <<< $tpkg)
cpu_temp=$(sensors | grep "Package" | cut -c 14-23)



# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo  "CPU temp: " $cpu_temp "Uptime:" $uptime_formatted ↑  $debian_version $XDG_SESSION_TYPE 🐧 $host_name 🔋 $date_formatted

