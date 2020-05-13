#/bin/bash

TMP_FILE_LOCATION_VISIBLE=/tmp/i3_visible_tmp
TMP_FILE_LOCATION_FOCUSED=/tmp/i3_focused_tmp
get_i3_workspace_id() {
    field=$1
    i3-msg -t get_workspaces \
  | jq '.[] | select(.'"$field"'==true).name' \
  | cut -d"\"" -f2
}
save_visible_workspaces() {
        get_i3_workspace_id visible > $TMP_FILE_LOCATION_VISIBLE
}
save_active_workspace() {
        get_i3_workspace_id focused > $TMP_FILE_LOCATION_FOCUSED
}

if [[ $(get_i3_workspace_id focused) == "9" ]]
then
        currently_visible_workspaces=$(get_i3_workspace_id visible)
        intermediate_workspace=$(grep -v "$currently_visible_workspaces" $TMP_FILE_LOCATION_VISIBLE)
        if [[ "$intermediate_workspace" != $(cat $TMP_FILE_LOCATION_FOCUSED) ]]
        then
                i3-msg workspace $intermediate_workspace
        fi
        i3-msg workspace "$(cat $TMP_FILE_LOCATION_FOCUSED)"
else
        save_visible_workspaces
        save_active_workspace
        i3-msg workspace 9
fi