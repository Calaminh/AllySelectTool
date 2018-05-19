;Dota 2 - Ally Selection Tool
;Made by Calaminh and BronzePickaxe 2018

#SingleInstance, Force
global testarray := [143,334,14,31,39,77,88,66,123,765]
;global CurrentPositionX := 50
global PositionArrayX := Object() 
global PositionArrayY := Object()
global CurrentPositionX := 0
global Team = ""
global PortraitPosition = ""

ExtrapolateDifference := 0

RP1X:=PositionArrayX[1]
RP1Y:=PositionArrayY[1]
RP2X:=PositionArrayX[2]
RP2Y:=PositionArrayY[2]
RP3X:=PositionArrayX[3]
RP3Y:=PositionArrayY[3]
RP4X:=PositionArrayX[4]
RP4Y:=PositionArrayY[4]
RP5X:=PositionArrayX[5]
RP5Y:=PositionArrayY[5]

DP1X:=PositionArrayX[6]
DP1Y:=PositionArrayY[6]
DP2X:=PositionArrayX[7]
DP2Y:=PositionArrayY[7]
DP3X:=PositionArrayX[8]
DP3Y:=PositionArrayY[8]
DP4X:=PositionArrayX[9]
DP4Y:=PositionArrayY[9]
DP5X:=PositionArrayX[10]
DP5Y:=PositionArrayY[10]

IniRead, RP1X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable1
IniRead, RP1Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable2

IniRead, RP2X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable3
IniRead, RP2Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable4

IniRead, RP3X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable5
IniRead, RP3Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable6

IniRead, RP4X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable7
IniRead, RP4Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable8

IniRead, RP5X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable9
IniRead, RP5Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable10

IniRead, DP1X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable11
IniRead, DP1Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable12

IniRead, DP2X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable13
IniRead, DP2Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable14

IniRead, DP3X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable15
IniRead, DP3Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable16

IniRead, DP4X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable17
IniRead, DP4Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable18

IniRead, DP5X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable19
IniRead, DP5Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable20

PositionArrayX[1] := RP1X
PositionArrayY[1] := RP1Y

PositionArrayX[2] := RP2X
PositionArrayY[2] := RP2Y

PositionArrayX[3] := RP3X
PositionArrayY[3] := RP3Y

PositionArrayX[4] := RP4X
PositionArrayY[4] := RP4Y

PositionArrayX[5] := RP5X
PositionArrayY[5] := RP5Y

PositionArrayX[6] := DP1X
PositionArrayY[6] := DP1Y

PositionArrayX[7] := DP2X
PositionArrayY[7] := DP2Y

PositionArrayX[8] := DP3X
PositionArrayY[8] := DP3Y

PositionArrayX[9] := DP4X
PositionArrayY[9] := DP4Y

PositionArrayX[10] := DP5X
PositionArrayY[10] := DP5Y


Gui, FrontEnd:Add, Text, w200, Ally Selection Tool (by Calaminh and John)
Gui, FrontEnd:Add, Text, w200, __________________________________
Gui, FrontEnd:Add, Text, w200, Note: You will not always have the same team or portrait. Please update the information for every game.

GUI, FrontEnd:Add, Text, w200 vTeam , Team:
GUI, FrontEnd:Add, Text, w200 vPortraitPosition , Portrait Position:
GUI, FrontEnd:Add, Text,  , Selection Method:


SelectionMethod:="Snap To Ally, Return (Hold & Release)|Stay On Ally (Single Click)|"

GUI, FrontEnd:Add, DropDownList, xs w200 r10 vDDL3 gSubmit_All, % SelectionMethod

GUI, FrontEnd:Add, Button, xs w200 h40 gSetting, Setting
GUI, FrontEnd:Add, Button, xs w200 h40 gTEST, TEST


GUI, FrontEnd:Show, ,Ally Selection
return

GUIClose:
	ExitApp
    
2GuiClose:
ExitApp 

Submit_All:
	GUI, Submit, NoHide
	Tooltip, % DDL
	return

;----------------------------------------------------------------------------------------------	
	
Setting:
Gui, BackEnd:Add, Text, w205, Hotkey (Note: Choose your desired hotkeys. Do not overlap with in-game hotkeys!)

Gui, BackEnd:Add, Text, w205, Select Your Portrait Hotkey
Gui, BackEnd:Add, Edit, w205 vUpdateHotkeyPart1

Gui, BackEnd:Add, Text, w205, Ally 1
Gui, BackEnd:Add, Edit, w205 vAlly1HotkeyPart1,
Gui, BackEnd:Add, Text, w205, Ally 2
Gui, BackEnd:Add, Edit, w205 vAlly2HotkeyPart1,
Gui, BackEnd:Add, Text, w205, Ally 3
Gui, BackEnd:Add, Edit, w205 vAlly3HotkeyPart1,
Gui, BackEnd:Add, Text, w205, Ally 4
Gui, BackEnd:Add, Edit, w205 vAlly4HotkeyPart1,

Gui, BackEnd:Add, Text, w205, IMPORTANT SETUP
Gui, BackEnd:Add, Text, w205, What is your current in-game select hero hotkey?
Gui, BackEnd:Add, Edit, w205 vIngameSelectHeroPart1,

Gui, BackEnd:Add, Checkbox, vExtrapolate Checked, Extrapolate
if(Extrapolate=1)
{
    GuiControl, Disable, Record3
    GuiControl, Disable, Reset3
    GuiControl, Disable, Record4
    GuiControl, Disable, Reset4
    GuiControl, Disable, Record5
    GuiControl, Disable, Reset5
    GuiControl, Disable, Record6
    GuiControl, Disable, Reset6
    GuiControl, Disable, Record7
    GuiControl, Disable, Reset7
    GuiControl, Disable, Record8
    GuiControl, Disable, Reset8
    GuiControl, Disable, Record9
    GuiControl, Disable, Reset9
    GuiControl, Disable, Record10
    GuiControl, Disable, Reset10
}

Gui, BackEnd:Add, Text, w205, Get Radiant Portrait Position
Gui, BackEnd:Add, Button, w60 section gRecord1, Portrait 1
Gui, BackEnd:Add, Text, vCoordinateText1 ys w80, X=%RP1X% Y=%RP1Y%
Gui, BackEnd:Add, Button, ys w45 gReset1, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord2, Portrait 2
Gui, BackEnd:Add, Text, vCoordinateText2 ys w80, X=%RP2X% Y=%RP2Y%
Gui, BackEnd:Add, Button, ys w45 gReset2, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord3, Portrait 3
Gui, BackEnd:Add, Text, vCoordinateText3 ys w80, X=%RP3X% Y=%RP3Y%
Gui, BackEnd:Add, Button, ys w45 gReset3, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord4, Portrait 4
Gui, BackEnd:Add, Text, vCoordinateText4 ys w80, X=%RP4X% Y=%RP4Y%
Gui, BackEnd:Add, Button, ys w45 gReset4, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord5, Portrait 5
Gui, BackEnd:Add, Text, vCoordinateText5 ys w80, X=%RP5X% Y=%RP5Y%
Gui, BackEnd:Add, Button, ys w45 gReset5, Reset

Gui, BackEnd:Add, Text, xs w205, Get Dire Portrait Position

Gui, BackEnd:Add, Button, xs w60 section gRecord6, Portrait 1
Gui, BackEnd:Add, Text, vCoordinateText6 ys w80, X=%DP1X% Y=%DP1Y% 
Gui, BackEnd:Add, Button, ys w45 gReset6, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord7, Portrait 2
Gui, BackEnd:Add, Text, vCoordinateText7 ys w80, X=%DP2X% Y=%DP2Y%
Gui, BackEnd:Add, Button, ys w45 gReset7, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord8, Portrait 3
Gui, BackEnd:Add, Text, vCoordinateText8 ys w80, X=%DP3X% Y=%DP3Y%
Gui, BackEnd:Add, Button, ys w45 gReset8, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord9, Portrait 4
Gui, BackEnd:Add, Text, vCoordinateText9 ys w80, X=%DP4X% Y=%DP4Y%
Gui, BackEnd:Add, Button, ys w45 gReset9, Reset

Gui, BackEnd:Add, Button, xs w60 section gRecord10, Portrait 5
Gui, BackEnd:Add, Text, vCoordinateText10 ys w80, X=%DP5X% Y=%DP5Y% 
Gui, BackEnd:Add, Button, ys w45 gReset10, Reset

GUI, BackEnd:Add, Button, xs w205 h40 gSave, Save

Gui, BackEnd:Add, Button, xs w205 gButton1, Press Me
Gui BackEnd:show


return

;---------------------------------------------------------------------------

Record(Index) {
    loop {
        MouseGetPos, xpos, ypos
        ToolTip, X=%xpos% Y=%ypos%
        
        LButtonDown := GetKeyState("LButton","P")
        If (LButtonDown = 1)
        {
            PositionArrayX[Index] := xpos
            PositionArrayY[Index] := ypos
            ToolTip
            return
        }
        sleep 1
    }
}

ListenHotkey() {
    loop {
        MouseGetPos, xpos, ypos
        ToolTip, X=%xpos% Y=%ypos%
        
        LButtonDown := GetKeyState("LButton","P")
        If (LButtonDown = 1)
        {
            CurrentPositionX := xpos
            MsgBox "SAVED" %CurrentPositionX%
            ToolTip
            return
        }
        sleep 1
    }
}
;---

ExtrapolateDifference:=RP2X-RP1X
RP3X:=ExtrapolateDifference+RP2X
RP4X:=ExtrapolateDifference+RP3X
RP5X:=ExtrapolateDifference+RP4X

DP1X:=RP5X*4.5
DP2X:=ExtrapolateDifference+DP1X
DP3X:=ExtrapolateDifference+RP2X
DP4X:=ExtrapolateDifference+RP3X
DP5X:=ExtrapolateDifference+RP4X

;---------------------------------------------------------------------------

Record1:
Record(1)
TempStorage1:= PositionArrayX[1]
TempStorage2:= PositionArrayY[1]
IniWrite, %TempStorage1%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable1
IniWrite, %TempStorage2%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable2
IniRead, RP1X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable1
IniRead, RP1Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable2
GuiControl,,CoordinateText1, X=%RP1X% Y=%RP1Y%
PositionArrayX[1] := RP1X
PositionArrayY[1] := RP1Y
return

Reset1:
RP1X = 0
RP1Y = 0
GuiControl,,CoordinateText1, X=%RP1X% Y=%RP1Y%
PositionArrayX[1] := RP1X
PositionArrayY[1] := RP1Y
return

Record2:
Record(2)
TempStorage3:= PositionArrayX[2]
TempStorage4:= PositionArrayY[2]
IniWrite, %TempStorage3%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable3
IniWrite, %TempStorage4%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable4
IniRead, RP2X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable3
IniRead, RP2Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable4
GuiControl,,CoordinateText2, X=%RP2X% Y=%RP2Y%
PositionArrayX[2] := RP2X
PositionArrayY[2] := RP2Y
return

Reset2:
RP2X = 0
RP2Y = 0
GuiControl,,CoordinateText2, X=%RP2X% Y=%RP2Y%
return

Record3:
Record(3)
TempStorage5:= PositionArrayX[3]
TempStorage6:= PositionArrayY[3]
IniWrite, %TempStorage5%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable5
IniWrite, %TempStorage6%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable6
IniRead, RP3X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable5
IniRead, RP3Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable6
GuiControl,,CoordinateText3, X=%RP3X% Y=%RP3Y%
PositionArrayX[3] := RP3X
PositionArrayY[3] := RP3Y
return

Reset3:
RP3X = 0
RP3Y = 0
GuiControl,,CoordinateText3, X=%RP3X% Y=%RP3Y%
PositionArrayX[3] := RP3X
PositionArrayY[3] := RP3Y
return

Record4:
Record(4)
TempStorage7:= PositionArrayX[4]
TempStorage8:= PositionArrayY[4]
IniWrite, %TempStorage7%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable7
IniWrite, %TempStorage8%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable8
IniRead, RP4X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable7
IniRead, RP4Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable8
GuiControl,,CoordinateText4, X=%RP4X% Y=%RP4Y%
PositionArrayX[4] := RP4X
PositionArrayY[4] := RP4Y
return

Reset4:
RP4X = 0
RP4Y = 0
GuiControl,,CoordinateText4, X=%RP4X% Y=%RP4Y%
PositionArrayX[4] := RP4X
PositionArrayY[4] := RP4Y
return

Record5:
Record(5)
TempStorage9:= PositionArrayX[5]
TempStorage10:= PositionArrayY[5]
IniWrite, %TempStorage9%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable9
IniWrite, %TempStorage10%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable10
IniRead, RP5X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable9
IniRead, RP5Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable10
GuiControl,,CoordinateText5, X=%RP5X% Y=%RP5Y%
PositionArrayX[5] := RP5X
PositionArrayY[5] := RP5Y
return

Reset5:
RP5X = 0
RP5Y = 0
GuiControl,,CoordinateText5, X=%RP5X% Y=%RP5Y%
PositionArrayX[5] := RP5X
PositionArrayY[5] := RP5Y
return

Record6:
Record(6)
TempStorage11:= PositionArrayX[6]
TempStorage12:= PositionArrayY[6]
IniWrite, %TempStorage11%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable11
IniWrite, %TempStorage12%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable12
IniRead, RP6X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable11
IniRead, RP6Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable12
GuiControl,,CoordinateText6, X=%RP6X% Y=%RP6Y%
PositionArrayX[6] := DP1X
PositionArrayY[6] := DP1Y
return

Reset6:
RP6X = 0
RP6Y = 0
GuiControl,,CoordinateText6, X=%RP6X% Y=%RP6Y%
PositionArrayX[6] := DP1X
PositionArrayY[6] := DP1Y
return

Record7:
Record(7)
TempStorage13:= PositionArrayX[7]
TempStorage14:= PositionArrayY[7]
IniWrite, %TempStorage13%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable13
IniWrite, %TempStorage14%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable14
IniRead, RP7X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable13
IniRead, RP7Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable14
GuiControl,,CoordinateText7, X=%RP7X% Y=%RP7Y%
PositionArrayX[7] := DP2X
PositionArrayY[7] := DP2Y
return

Reset7:
RP7X = 0
RP7Y = 0
GuiControl,,CoordinateText7, X=%RP7X% Y=%RP7Y%
PositionArrayX[7] := DP2X
PositionArrayY[7] := DP2Y
return

Record8:
Record(8)
TempStorage15:= PositionArrayX[8]
TempStorage16:= PositionArrayY[8]
IniWrite, %TempStorage15%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable15
IniWrite, %TempStorage16%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable16
IniRead, RP8X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable15
IniRead, RP8Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable16
GuiControl,,CoordinateText8, X=%RP8X% Y=%RP8Y%
PositionArrayX[8] := DP3X
PositionArrayY[8] := DP3Y
return

Reset8:
RP8X = 0
RP8Y = 0
GuiControl,,CoordinateText8, X=%RP8X% Y=%RP8Y%
PositionArrayX[8] := DP3X
PositionArrayY[8] := DP3Y
return

Record9:
Record(9)
TempStorage17:= PositionArrayX[9]
TempStorage18:= PositionArrayY[9]
IniWrite, %TempStorage17%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable17
IniWrite, %TempStorage18%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable18
IniRead, RP9X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable17
IniRead, RP9Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable18
GuiControl,,CoordinateText9, X=%RP9X% Y=%RP9Y%
PositionArrayX[9] := DP4X
PositionArrayY[9] := DP4Y
return

Reset9:
RP9X = 0
RP9Y = 0
GuiControl,,CoordinateText9, X=%RP9X% Y=%RP9Y%
PositionArrayX[9] := RP4X
PositionArrayY[9] := DP4Y
return

Record10:
Record(10)
TempStorage19:= PositionArrayX[10]
TempStorage20:= PositionArrayY[10]
IniWrite, %TempStorage19%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable19
IniWrite, %TempStorage20%, AllySelectToolSettings.ini, SavedPortraitPosition, Variable20
IniRead, RP10X, AllySelectToolSettings.ini, SavedPortraitPosition, Variable19
IniRead, RP10Y, AllySelectToolSettings.ini, SavedPortraitPosition, Variable20
GuiControl,,CoordinateText10, X=%RP10X% Y=%RP10Y%
PositionArrayX[10] := DP5X
PositionArrayY[10] := DP5Y
return

Reset10:
RP10X = 0
RP10Y = 0
GuiControl,,CoordinateText10, X=%RP10X% Y=%RP10Y%
PositionArrayX[10] := DP5X
PositionArrayY[10] := DP5Y
return
;----------------------------------------------------------------------------------------------
return
esc::ExitApp

;----------------------------------------------------------------------------------------------
;SAVE SECTION (Stores values into .ini and recalls them)

Save:
Gui, Submit, NoHide

IniWrite, %UpdateHotkeyPart1%, AllySelectToolSettings.ini, Hotkeys, UpdateHotkeyPart2
IniRead, UpdateHotkeyPart3, AllySelectToolSettings.ini, Hotkeys, UpdateHotkeyPart2
Hotkey, % UpdateHotkeyPart3, GetCurrentPortrait

IniWrite, %Ally1HotkeyPart1%, AllySelectToolSettings.ini, Hotkeys, Ally1HotkeyPart2
IniRead, Ally1HotkeyPart3, AllySelectToolSettings.ini, Hotkeys, Ally1HotkeyPart2
Hotkey, %Ally1HotkeyPart3%, Ally1Hotkey

IniWrite, %Ally2HotkeyPart1%, AllySelectToolSettings.ini, Hotkeys, Ally2HotkeyPart2
IniRead, Ally2HotkeyPart3, AllySelectToolSettings.ini, Hotkeys, Ally2HotkeyPart2
Hotkey, %Ally2HotkeyPart3%, Ally2Hotkey

IniWrite, %Ally3HotkeyPart1%, AllySelectToolSettings.ini, Hotkeys, Ally3HotkeyPart2
IniRead, Ally3HotkeyPart3, AllySelectToolSettings.ini, Hotkeys, Ally3HotkeyPart2
Hotkey, %Ally3HotkeyPart3%, Ally3Hotkey

IniWrite, %Ally4HotkeyPart1%, AllySelectToolSettings.ini, Hotkeys, Ally4HotkeyPart2
IniRead, Ally4HotkeyPart3, AllySelectToolSettings.ini, Hotkeys, Ally4HotkeyPart2
Hotkey, %Ally4HotkeyPart3%, Ally4Hotkey

IniWrite, %Ally4HotkeyPart1%, AllySelectToolSettings.ini, Hotkeys, Ally4HotkeyPart2
IniRead, Ally4HotkeyPart3, AllySelectToolSettings.ini, Hotkeys, Ally4HotkeyPart2
Hotkey, %Ally4HotkeyPart3%, Ally4Hotkey

IniWrite, %IngameSelectHeroPart1%, AllySelectToolSettings.ini, Hotkeys, IngameSelectHeroPart2
IniRead, IngameSelectHeroPart3, AllySelectToolSettings.ini, Hotkeys, IngameSelectHeroPart2
Hotkey, %IngameSelectHeroPart3%, IngameSelectHero

GuiControl, Disable, UpdateHotkeyPart1
GuiControl, Disable, Ally1HotkeyPart1
GuiControl, Disable, Ally2HotkeyPart1
GuiControl, Disable, Ally3HotkeyPart1
GuiControl, Disable, Ally4HotkeyPart1
GuiControl, Disable, IngameSelectHeroPart1
return

;NOTE TO SELF
;GuiControlGet, UpdateHotkey
;MsgBox The hotkey is %UpdateHotkey%

;---------------------------------------------------------------------------------------------------

min() {
    DifferenceArray:=[]
    Mindex := 1
    temp = 0

    for currNdx, element in PositionArrayX
    {
        DifferenceArray[currNdx] = Abs(CurrentPositionX - element)
        temp := DifferenceArray[currNdx]
    }

    SmallestDifference := DifferenceArray[1]
    
    for currNdx, element in DifferenceArray
    {
        if(SmallestDifference > element)
        {
            SmallestDifference = element
            Mindex = currNdx
        }
    }

    return PositionArrayX[Mindex]
}

TEST:
msgbox DO NOTHING
return

;-------------------

GuiControl, Disable, Record3
GuiControl, Disable, Reset3
GuiControl, Disable, Record4
GuiControl, Disable, Reset4
GuiControl, Disable, Record5
GuiControl, Disable, Reset5
GuiControl, Disable, Record6
GuiControl, Disable, Reset6
GuiControl, Disable, Record7
GuiControl, Disable, Reset7
GuiControl, Disable, Record8
GuiControl, Disable, Reset8
GuiControl, Disable, Record9
GuiControl, Disable, Reset9
GuiControl, Disable, Record10
GuiControl, Disable, Reset10

;----------------------------------------------------------------------------------------------------
;HOTKEYS SECTION

GetCurrentPortrait:
ListenHotkey()
CurrentPositionX := min()

str1 = Team: Horde
str2 = Portrait Position: -1

if(CurrentPositionX=RP1X)
{
    GuiControl, FrontEnd:,Team, %str1%
    GuiControl, FrontEnd:,PortraitPosition, %str2%
}

if(CurrentPositionX=RP2X)
{
CurrentTeam:=Radiant
CurrentPortraitPosition:=1
}

if(CurrentPositionX=RP3X)
{
CurrentTeam:=Radiant
CurrentPortraitPosition:=3
}

if(CurrentPositionX=RP4X)
{
CurrentTeam:=Radiant
CurrentPortraitPosition:=4
}

if(CurrentPositionX=RP5X)
{
CurrentTeam:=Radiant
CurrentPortraitPosition:=5
}

if(CurrentPositionX=RP2X)
{
CurrentTeam:=Radiant
CurrentPortraitPosition:=1
}

if(CurrentPositionX=DP1X)
{
CurrentTeam:=Dire
CurrentPortraitPosition:=1
}

if(CurrentPositionX=DP2X)
{
CurrentTeam:=Dire
CurrentPortraitPosition:=2
}

if(CurrentPositionX=DP3X)
{
CurrentTeam:=Dire
CurrentPortraitPosition:=3
}

if(CurrentPositionX=DP4X)
{
CurrentTeam:=Dire
CurrentPortraitPosition:=4
}

if(CurrentPositionX=DP1X)
{
CurrentTeam:=Dire
CurrentPortraitPosition:=5
}

return

Ally1Hotkey:
msgbox TADA
return

Ally2Hotkey:
msgbox TADA
return

Ally3Hotkey:
msgbox TADA
return

Ally4Hotkey:
msgbox TADA
return

IngameSelectHero:
msgbox TADA
return

;----
Button1:
msgbox % Ally1Hotkey
return

;---

join( arr )
{
  s := ""
  for i,v in strArray
    s .= ", " . v
  return substr(s, 3)
}
