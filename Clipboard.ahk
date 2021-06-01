#Persistent
#Include WinClipAPI.ahk
#Include WinClip.ahk

global IMG_PATH = ".clipboard.png" ; relative to script location
global REQUIRE_CTRL = false ; if true, CTRL must be held when snipping for the script to activate
global ENABLE_TOOLTIP = true
global CLEAR_CLIPBOARD = false ; if false then the image data will also be kept in the clipboard (in addition to the img file path)
global ALL_IMAGES = true ; if false then only images from win+shift+s will be saved to a file, 
                          ; if true, then EVERY image copied to clipboard will be saved to a file

OnClipboardChange("ClipChanged")
return


ClipChanged(clipType) {
    if ((GetKeyState("Control") || !REQUIRE_CTRL) && clipType == 2 
      && (ALL_IMAGES && WinClip.HasFormat(WinClip.ClipboardFormats.CF_BITMAP) 
        || WinClip.HasFormat( 49434 ) && WinClip.HasFormat( 49595 ) )) {
        count := 1
        while (!(saved := WinClip.SaveBitmap(IMG_PATH, "png"))) {
            count += 1
            Sleep 50
            if (count >= 20) {
                Break
            }
        }
        if (CLEAR_CLIPBOARD) 
            WinClip.Clear()
        path := A_WorkingDir . "\" . IMG_PATH
        setFiles := WinClip.SetFiles(path)
        if (!ENABLE_TOOLTIP) 
            return
        if (saved) {
            ToolTip % "Clipboard saved to " . IMG_PATH . " (" . count . " tries) `r"
                . ((setFiles > 0) ? "Path added to clipboard" : "FAILED to add to clipboard: " . path)
        } else {
            ToolTip % "FAILED to save clipboard to file (" . count . " tries)"
        }
        
        if (!setFiles || !saved) {
            Sleep 5000
        } else {
            Sleep 1500
        }
        ToolTip  ; Turn off the tip.
    }
}