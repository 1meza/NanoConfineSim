#!/bin/zsh

# Function to convert WSL path to Windows path
convert_wsl_to_windows() {
    local wsl_path="$1"
    local windows_path=$(wslpath -w "$wsl_path")
    echo "$windows_path"
}

# Check if a file path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_file>"
    exit 1
fi

# Convert the provided WSL path to Windows path
wsl_path="$1"
windows_path=$(convert_wsl_to_windows "$wsl_path")

# Command to open VMD with the specified file
# Replace the path with the correct path to your VMD executable
vmd_path="/mnt/c/Program Files/VMD/vmd.exe"

# Use sudo if needed to open VMD with elevated privileges
sudo "$vmd_path"  "/$windows_path"

