# OneNote 2016: make screen clippings auto-fit into tables again
This script allows screen captures (or any copied image) to be pasted into a OneNote table with automatic resizing enabled - so the image won't mess up your table and the images will scale when the table size is changed! Alternatively, you could also use this script to paste images from your clipboard into any directory.

### How does it work?
AutoHotKey (AHK) v1.1 script: automatically saves screen captures from Windows+Shift+S (or every image copied to the clipboard - see options) to a file and then adds the file path to the clipboard. 

Uses WinClip class: [AHK forum post](https://autohotkey.com/board/topic/74670-class-winclip-direct-clipboard-manipulations/), [Website](https://apathysoftworks.com/ahk/index.html).

# Usage:
1. Install AHK v1.1 (not V1.0, not V2) from https://www.autohotkey.com/
2. (Optional) Edit options in Clipboard.ahk (global variables at the top of the file)
       
   e.g. with ALL_IMAGES = true and REQUIRE_CTRL = true, the script will place every image as a file into the clipboard, so you can also paste the image as a file into any directory in Explorer, but only when you hold down the Control key.

3. Run script - you can now use Win+Shift+S to take a screen snip and then just paste it into OneNote! If you haven't changed the options (step 2), you will get a tooltip like this if the script is running: 
       
   ![](https://raw.githubusercontent.com/Henri-J-Norden/OneNote-make-screen-clippings-fit-into-tables/c25a0dea099c63fad0db209c0814f0f5d3181823/Example%20tooltip.png)
4. (Optional) To make the script run on Windows startup, create a shortcut to the script in the Startup folder (shell:startup).



## Links
[AHK forum post](https://www.autohotkey.com/boards/viewtopic.php?f=6&t=91178)

[Semi-relevant OneNote uservoice issue](https://onenote.uservoice.com/forums/327186-onenote-for-windows/suggestions/17914975-onenote-2016-add-ability-to-fix-table-column-wid)
