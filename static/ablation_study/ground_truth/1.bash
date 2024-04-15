convert_video() {
    input="$1"
    output="${input%.*}_converted.mp4"

    ffmpeg -i "$input" -c:v libx264 -crf 23 -preset medium -c:a aac -strict experimental -b:a 192k "$output"
}

export -f convert_video

# 搜寻当前目录及子目录中的所有mp4、mkv和avi视频文件，并对每个文件运行convert_video函数
find . -type f \( -name "*.mp4" -o -name "*.mkv" -o -name "*.avi" \) -exec bash -c 'convert_video "$0"' {} \;