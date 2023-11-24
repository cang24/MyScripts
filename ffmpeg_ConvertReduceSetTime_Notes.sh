# Change codec to save disk space with high quality videos
ls -1 | awk -v FFMPEG="~/Downloads/ffmpeg-master-latest-win64-gpl/bin/ffmpeg.exe" '{out=substr($0,1,index($0,".")-1)"_resized.mp4";print FFMPEG" -i "$0" -vcodec libx265 -crf 28 -map 0 -map_metadata 0 "out}'

# Change datetime in file
touch -d "Nov 22 2019 05:28" test

# Display fulltime information
ls --full-time test

# ================================================================
# Set the datetime of the file
# ================================================================
# Using a file as reference
# ----------------------------------------------------------------
# It doesn't works :( just copying the same date, maybe with a reference file (myfile.jpg) can change another (myfile_resized.jpg)
# ls --full-time *resized* | awk '{print "touch -d \""$6" "$7"\" "$NF}'

# ----------------------------------------------------------------
# It extracts the info from the filename
#     VID_20231119_192416._resized.mp4
# ----------------------------------------------------------------
ls --full-time *resized* | awk '{y=substr($NF,5,4);m=substr($NF,9,2);d=substr($NF,11,2);hh=substr($NF,14,2);mm=substr($NF,16,2);ss=substr($NF,18,2);printf("touch -d \"%s-%s-%s %s:%s:%s\" %s\n", y, m, d, hh, mm, ss, $NF)}'
