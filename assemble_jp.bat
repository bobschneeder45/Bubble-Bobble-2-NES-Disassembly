del bubbob2_jp.nes bubbob2_jp.map bubbob2_jp_labels.txt

ca65 -g -D REGION_JP src/main.asm
ld65 -C config_jp -Ln bubbob2_jp_labels.txt -m bubbob2_jp.map -o bubbob2_jp.nes src\main.o

del src\*.o