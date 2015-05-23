--[[
MCOS - (Minecraft Operating System) ComputerCraft "OS"
Copyright (C) 2015 The CubeSpaceCC Team

MCOS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MCOS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MCOS.  If not, see <http://www.gnu.org/licenses/>
--]]

os.loadAPI("/apis/graphix")
graphix.totalClear()
graphix.bgColor(colors.lightBlue)
term.setCursorPos(1,1)
term.setBackgroundColor(colors.blue)
term.clearLine()
term.setTextColor(colors.red)
graphix.centerWrite(1,"MCOS Beta "..version)
term.setBackgroundColor(colors.lightBlue)
print()
term.setCursorPos(1,3)
term.setTextColor(colors.yellow)
term.setBackgroundColor(colors.green)
graphix.center(3,"App Editor")
graphix.center(5,"File Manager")
graphix.center(7,"Games")
graphix.center(9,"Power (i)")
graphix.center(11,"Shell")
graphix.center(13,"Information")
graphix.center(15,"Settings")
 
while true do
 
  local evt, button, x, y = os.pullEvent("mouse_click")
 
  if y == 3 then
    shell.run("/MCOS/editor")
  elseif y == 5 then
    shell.run("/MCOS/3rdParty/Gonow32/FileManager")
  elseif y == 7 then
    shell.run("/MCOS/GameList")
  elseif y == 9 then
    shell.run("/MCOS/power")
  elseif y == 11 then
    shell.run("/MCOS/shell")
  elseif y == 13 then
    shell.run("/MCOS/about")
  elseif y == 15 then
    shell.run("/MCOS/settings")
  else
    shell.run("/MCOS/desktop")
  end
end
