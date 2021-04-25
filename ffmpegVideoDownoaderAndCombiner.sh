#!/bin/bash

#合并文件
ffmpeg -f concat -safe 0 -i list.txt -c copy -bsf:a aac_adtstoasc output.mp4

#下载m3u8文件
ffmpeg -protocol_whitelist "file,http,https,tls,tcp" -i "01 - linux-the-productive-programmer-s-best-friend.m3u8" -codec copy "01 - linux-the-productive-programmer-s-best-friend.mp4"
ffmpeg -protocol_whitelist "crypto,file,http,https,tls,tcp" -i "newplay.m3u8" -codec copy "newplay.mp4"