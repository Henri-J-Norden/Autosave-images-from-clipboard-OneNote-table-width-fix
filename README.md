# OneNote-make-screen-clippings-fit-into-tables
AutoHotKey (AHK) v1.1 script: automatically saves screen captures from Windows+Shift+S to a file and adds the file to the clipboard.

Uses WinClip class: [AHK forum post](https://autohotkey.com/board/topic/74670-class-winclip-direct-clipboard-manipulations/), [Website](https://apathysoftworks.com/ahk/index.html).

# Usage:
1. Install AHK v1.1 (not V1.0, not V2) from https://www.autohotkey.com/
2. (Optional) Edit options in Clipboard.ahk (global variables at the top of the file)
3. Run script - you can now use Windows+shift+S to take a screen snip and just paste it into OneNote without messing up your tables! If you haven't changed the options (step 2), you will get a tooltip like this if the script is running: ![](https://raw.githubusercontent.com/Henri-J-Norden/OneNote-make-screen-clippings-fit-into-tables/c25a0dea099c63fad0db209c0814f0f5d3181823/Example%20tooltip.png)
4. (Optional) To make the script run on Windows startup, create a shortcut to the script in the Startup folder (shell:startup).

