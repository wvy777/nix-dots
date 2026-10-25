tell application id "com.mitchellh.ghostty"
    if it is running then
        «event GhstNWin»
        activate
    else
        do shell script "open -a \"$HOME/Applications/Home Manager Apps/Ghostty.app\""
    end if
end tell
