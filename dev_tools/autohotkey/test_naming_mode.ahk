;=======================================================================================
;BDD Test Naming Mode AHK Script
;
;Description:
;  Replaces spaces with underscores while typing, to help with writing BDD test names.
;  Toggle on and off with Ctrl + Shift + U.
;=======================================================================================


;==========================
;Initialise
;==========================
#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir% 

enabledIcon := "testnamingmode_16.ico"
disabledIcon := "testnamingmode_disabled_16.ico"
IsInTestNamingMode := false
SetTestNamingMode(false)

;==========================
;Functions
;==========================
SetTestNamingMode(toActive) {
  local iconFile := toActive ? enabledIcon : disabledIcon
  local state := toActive ? "ON" : "OFF"

  IsInTestNamingMode := toActive
  Menu, Tray, Icon, %iconFile%,
  Menu, Tray, Tip, Test naming mode is %state%  

  Send {Shift Up}
}

;==========================
;Test Mode toggle
;==========================
^+u::
  SetTestNamingMode(!IsInTestNamingMode)
return


;==========================
;Handle Enter press
;==========================
$Enter::
  if (IsInTestNamingMode){
	SetTestNamingMode(!IsInTestNamingMode)
  }
  else{
	  Send, {Enter}
 }
return

;==========================
;Handle Escape press
;==========================
$Escape::
  if (IsInTestNamingMode){
	SetTestNamingMode(!IsInTestNamingMode)
  }
  else{
  Send, {Escape}
  }
return

;==========================
;Handle SPACE press
;==========================
$Space::
  if (IsInTestNamingMode) {
    Send, _
  } else {
    Send, {Space}
  }


