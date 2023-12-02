#!/bin/bash
#futuras mejoras..
#A Y B son token y id que son generado por tu propio bot
#============*SON OBLIGATORIO A Y B ================================
A="TOKEN:";
B="ID:";
#====================================================================
C="https://api.telegram.org/bot$A";F="sendVideo";G="getUpdates";I=0;J="url.log";K=""
L(){ M="▰▱▱▱▱▱▱▱▱▱"; N=${#M};for((O=N;O>=0;O--));do echo -ne "\rLeyendo entradas ${M:$O}${M:0:$O}";sleep 1;done; }
P(){ chmod +x *.mp4;Q=$(find ./ -type f -name "*.mp4");[ -n "$Q" ] && curl -s -F chat_id="$B" -F video=@"$Q" -F caption="Si" "${C}/${Q}" > /dev/null 2>&1 && rm *.mp4; }
R(){ ST=$(echo "$1" | cut -c1-);yt-dlp --format 'bestvideo[height<=480]+bestaudio[height<=480]/mp4' -o "video.%(ext)s" "$ST" && [ -e "video.mp4" ] && P; }
U(){ while true;do sleep 5;L;V=$(curl -s "${C}/${G}");W=$(echo "$V" | jq -r '.result[-1].message');X=$(echo "$W" | jq -r '.text' | sed -n 's#/d\s*\(https\?://[^[:space:]]*\).*#\1#p');Y=$(tail -n 1 "$J");[ -n "$X" ] && [ "$X" != "$Y" ] && R "$X" && echo "$X" >> "$J";done; }
U
