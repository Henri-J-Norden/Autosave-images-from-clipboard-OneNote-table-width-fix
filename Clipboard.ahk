#Persistent
#Include WinClipAPI.ahk
#Include WinClip.ahk

global IMG_PATH := "clipboard.png" ; relative to script location
global REQUIRE_CTRL := false ; if true, CTRL must be held when snipping for the script to activate
global ENABLE_TOOLTIP := true ; show/hide tooltips
global CLEAR_CLIPBOARD := false ; if false then the image data will also be kept in the clipboard (in addition to the img file path)
global ALL_IMAGES := false ; if false then only images from win+shift+s will be saved to a file, 
                          ; if true, then EVERY image copied to clipboard will be saved to a file

global TRIES := 30 ; total number of times to try the winclip functions + 1
global RETRY_SLEEP := 50 ; ms to sleep after a winclip function fails before retrying


global SNIPPING

OnClipboardChange("ClipChanged")
return


~#+s::
  SNIPPING := true
  return

retry(limit, wait, fcn, args*) {
    while ((limit -= 1) > 0 && !(%fcn%(args*)))
        Sleep wait
    return limit
}

ClipChanged(clipType) {
    if ((GetKeyState("Control") || !REQUIRE_CTRL) && clipType == 2 
      && (ALL_IMAGES || SNIPPING) && WinClip.HasFormat(WinClip.ClipboardFormats.CF_BITMAP)) {
        SNIPPING := false
        
        saved := retry(TRIES, RETRY_SLEEP, WinClip.SaveBitmap, WinClip, IMG_PATH, "png")
        
        if (CLEAR_CLIPBOARD) 
            WinClip.Clear()
        path := A_WorkingDir . "\" . IMG_PATH
        filesSet := retry(TRIES, RETRY_SLEEP, WinClip.SetFiles, WinClip, path)
        
        ; --- show tooltip ---
        if (!ENABLE_TOOLTIP) 
            return
            
        if (saved) {
            ToolTip % "Clipboard saved to " . IMG_PATH . " (" . TRIES - saved . " tries) `r"
                . (filesSet ? "Path added to clipboard (" . TRIES - filesSet . " tries)" : "FAILED to add to clipboard: " . path)
        } else {
            ToolTip % "FAILED to save clipboard to file (" . TRIES - saved . " tries)"
        }

        Sleep ((filesSet && saved) ? 1500 : 5000)
        
        ToolTip  ; Turn off the tip.
    } else if (SNIPPING) {
      SNIPPING := false
    }
}