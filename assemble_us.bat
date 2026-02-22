del bubbob2_us.nes bubbob2_us.map bubbob2_us_labels.txt

ca65 -g -D REGION_US src/main.asm
ld65 -C config_us -Ln bubbob2_us_labels.txt -m bubbob2_us.map -o bubbob2_us.nes src\main.o

del src\*.o