#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Please install it and try again."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p transcoded

# Counter for processed files
processed=0
failed=0

# Array of common video file extensions
video_extensions=("mp4" "mkv" "avi" "mov" "flv" "wmv" "webm" "m4v" "mpeg" "mpg" "m2v" "3gp" "3g2" "mxf" "roq" "nsv" "f4v" "f4p" "f4a" "f4b")

# Function to check if a file is a video
is_video_file() {
    file_output=$(file -b --mime-type "$1")
    [[ $file_output == video/* ]] && return 0 || return 1
}

# Loop through all files in the current directory
for input_file in *; do
    # Skip if it's not a file
    [ ! -f "$input_file" ] && continue

    # Check if the file extension is in our list or if it's detected as a video file
    if [[ " ${video_extensions[@]} " =~ " ${input_file##*.} " ]] || is_video_file "$input_file"; then
        output_file="transcoded/${input_file%.*}.mov"

        echo "Transcoding: $input_file"
        echo "--------------------------------------------------------------------------------"

        # Perform the transcoding
        if ffmpeg -i "$input_file" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "$output_file"; then
            echo "--------------------------------------------------------------------------------"
            echo "Successfully transcoded: $input_file -> $output_file"
            ((processed++))
        else
            echo "--------------------------------------------------------------------------------"
            echo "Failed to transcode: $input_file"
            ((failed++))
        fi
        echo  # Empty line for better readability
    fi
done

echo "Transcoding complete."
echo "Processed successfully: $processed file(s)"
if [ $failed -gt 0 ]; then
    echo "Failed to process: $failed file(s)"
fi
