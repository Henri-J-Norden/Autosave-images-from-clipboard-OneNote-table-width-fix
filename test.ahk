setDropEffect( ByRef clipData, clipSize, isCut = 0 )
  {
    
    objFormats := WinClip._parseClipboardData( clipData, clipSize )
    ToolTip 1
    prefFmt := WinClipAPI.RegisterClipboardFormat( "Preferred DropEffect" )
    ToolTip 2
    objFormats[ prefFmt ] := { size : 4 }
    ToolTip 3
    ObjSetCapacity( objFormats[ prefFmt ], "buffer", 4 )
    ToolTip 4
    NumPut( isCut ? 2 : 5, ObjGetAddress( objFormats[ prefFmt ], "buffer" ), 0 "UInt" )
    ToolTip 5
    return WinClip._compileClipData( clipData, objFormats )
  }
  
clipboardReady() {
    if !( clipSize := WinClip._fromclipboard( clipData ) )
      return 0
    if !( DIBsize := WinClip._getFormatData( DIB, clipData, clipSize, WinClip.ClipboardFormats.CF_DIB ) )
      return 0
    return 1
  }
      

ClipChanged2(clipType) {
    if (WinClip.HasFormat(WinClip.ClipboardFormats.CF_BITMAP)) {
        origSize := WinClip._fromclipboard( clipData )
        newSize := setDropEffect( clipData, origSize )
        finalSize := WinClip._toclipboard( clipData, newSize )
        ToolTip % " size: " . origSize . " -> " . newSize . " -> " . finalSize
        Sleep 1500
        ToolTip
    }
}