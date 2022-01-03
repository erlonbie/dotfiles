#!/usr/bin/env bash
#
# script name: dm-wifi
# Description: Connect to wifi using dmenu
# Dependencies: dmenu, nmcli, Any Nerd Font
# Contributor: WitherCubes

set -euo pipefail
_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"
if [[  -f "${_path}/_dm-helper.sh" ]]; then
  # shellcheck disable=SC1090,SC1091
  source "${_path}/_dm-helper.sh"
else
  # shellcheck disable=SC1090
  echo "No helper-script found"
fi

# script will not hit this if there is no config-file to load
# shellcheck disable=SC1090
source "$(get_config)"

main() {
  # TODO: Fix cut line at some point
  bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | ${DMENU} "Select Wifi  :" | cut -d' ' -f1)
  pass=$(echo "" | ${DMENU} "Enter Password  :")
  [ -n "$pass" ] && nmcli device wifi connect "$bssid" password "$pass" || nmcli device wifi connect "$bssid"
  sleep 10
  if ping -q -c 2 -W 2 google.com >/dev/null; then
    notify-send "Your internet is working :)"
  else
    notify-send "Your internet is not working :("
  fi
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"

