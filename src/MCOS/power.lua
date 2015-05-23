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
graphix.bgColor(colors.blue)
term.setCursorPos(1,1)
term.setBackgroundColor(colors.green)
term.setTextColor(colors.red)
term.clearLine()
graphix.center(1,"MCOS Beta "..version)
term.setCursorPos(1,3)
term.setTextColor(colors.yellow)
term.setBackgroundColor(colors.red)
graphix.center(3,"Reboot")
graphix.center(5,"Shutdown")
graphix.center(7,"Lock")
graphix.center(9,"Back")
 
local evt, button, x, y  = os.pullEvent("mouse_click")
 
if y == 3 then
  os.reboot()
elseif y == 5 then
  os.shutdown()
elseif y == 7 then
  shell.run("/MCOS/login")
elseif y == 9 then
  shell.run("/MCOS/desktop")
else
  shell.rum("/MCOS/power")
end
