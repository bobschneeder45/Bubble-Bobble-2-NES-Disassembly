# Bubble-Bobble-2-NES-Disassembly
Disassembly of Bubble Bobble 2 for the NES. Both US and JP ROMs buildable.

## Building

### Windows

Download cc65 and make sure its bin folder is added to the PATH variable.<br>
Run assemble_us.bat or assemble_jp.bat. The resulting ROM will be created in the base directory.

### Other systems

Should be pretty straightforward. Assemble main.asm with "REGION_US" or "REGION_JP" defined and link the single object file using the appropriate config file.

## Making edits

<p>The disassembled code is not fully labeled but I've gone for the most important parts to aid in porting, modding or further analysis of the code.<br>
Some banks (actually several ones in the Japanese version) have filler data included at the end. Take these out to get space for new content.</p>

<p>Everything should (hopefully) be disassembled and labeled enough to let you move stuff around without issues. Only the two sprite tables (ImageTable1 and ImageTable2) need to be at the start of their respective banks.</p>

## Introduction to the game engine

<p>This game uses the MMC3 mapper, resulting in the following memory setup:</p>

**$8000-$9FFF** - Switchable bank (referred to as PrgBankA): Mostly code-oriented content in these banks<br>
**$A000-$BFFF** - Switchable bank (referred to as PrgBankB): Mostly data-oriented content in these banks<br>
**$C000-$DFFF** - Bank 0E (fixed): Audio engine and some of the music tracks<br>
**$E000-$FFFF** - Bank 0F (fixed): Main engine code<br>
<br>
8 switchable CHR bank slots, controlled by these variables:<br>
<br>
**chrBankA:** BG tiles 1st and 2nd slot (should be an even number)<br>
**chrBankB:** BG tiles 3rd and 4th slot (should be an even number)<br>
**chrBankC:** Sprite tiles 1st slot<br>
**chrBankD:** Sprite tiles 2nd slot<br>
**chrBankE:** Sprite tiles 3rd slot<br>
**chrBankF:** Sprite tiles 4th slot<br>
<br>
We also get the ability to scroll parts of the background using IRQ handlers on specific scanlines.<br>
<br>
The game advances through various subroutines whose addresses are written to variables like **nmiBankedSub**, **nmiUnbankedSub** and **updateSub** to be run during VBlank. The game has color buffers and map buffers (for pieces of a full map) with accompanying routines that will transfer their contents to the PPU or do things like fade into the other buffer's colors.<br>
<br>
There are 40 object slots with specific ranges typically reserverd for the player, enemy projectiles, enemies, a single HUD icon and finally bubbles.<br>
<br>
During normal gameplay, the objects will only animate on every other frame and during cutscenes every actor can only move around every 4th frame.<br>
<br>
Sprite images are split across two banks, so all sprites on the screen need to reside in the same bank, determined by **sprPrgBank**. Luckily, certain sprites (like the player ones) are included in both banks.<br>
<br>
Songs can have tracks for the two square wave channels, the triangle channel and the noise channel. Sound effects are restricted to only the second square channel and the noise channel. There is also a jingle meant to be played when pausing the game, but it gets cancelled by the sound effect that plays at the same time. When audio code is being run, bank 0D will be swapped in so that all the music tracks are readable.<br>
<br>
Aside from the music/sound format (which isn't fully labeled), there is also scripting for cutscene actors and another one for enemy projectiles. Enemies simply update using their specific subroutines along with a state variable.<br>
<br>
All background maps consist of macro definitions (to make 16x16px tiles) paired with a list of macro tiles to fill the map space with.<br>
<br>
Backgrounds are animated either by updating the color buffer or by switching CHR banks, which is also done for some objects.<br>
