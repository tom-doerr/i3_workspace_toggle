# What is it?
This script toggles a workspace.
In contrast to the standard i3 toggle behaviour, this script will restore your active workspaces.

# Why is this useful?
Imagine you are working on monitor 1 and want to quickly check another workspace on monitor 2. You would have to navigate to monitor 2 and select the workspace. After you finished you would need to select the original workspace and navigate back to monitor 1.
The script switches monitors, selects the demanded workspace and then does this in reverse after being executed a second time, saving you half of the keyboard inputs that would otherwise be necessary.

# Example
In this example the setup consists of 3 monitors with workspaces 1 to 3 active.

## Normal behaviour:

```
|  1  |  2  |  3  |
            (active)

|  $mod + 4
V

|  4  |  2  |  3  |
(active)

|  $mod + 3
V

|  4  |  2  |  3  |
            (active)
```

## Behaviour using this script:

```
|  1  |  2  |  3  |
            (active)

|  toggle_workspace.sh 4
V

|  4  |  2  |  3  |
(active)

|  toggle_workspace.sh 3
V

|  1  |  2  |  3  |
            (active)
```

# Installation
Copy the script to a directory in your path, for example `~/.local/bin`.

```sh
cp toggle_workspace.sh ~/.local/bin
```

After that you can use it in your i3 config.
Example:

```
bindsym $mod+9 exec bash toggle_workspace.sh 9
```
