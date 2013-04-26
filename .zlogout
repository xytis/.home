#
# Executes commands at logout.
#
# Authors:
#   Vytis Valentinavičius <xytis2000@gmail.com>
#

echo -e "BYE" | figlet -f small

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
