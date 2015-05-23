-- Graphix API v1: Coded by datcoder1208 

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

function center(yPos,sText)
  local w, h = term.getSize()
  local x = term.getCursorPos()
  x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
  term.setCursorPos(x,yPos)
  print(sText)
end

function centerWrite(yPos,sText)
  local w, h = term.getSize()
  local x = term.getCursorPos()
  x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
  term.setCursorPos(x,yPos)
  write(sText)
end
 
function totalClear()
  term.setCursorPos(1,1)
  term.clear()
end
 
function bgColor(color)
  term.setBackgroundColor(color)
  totalClear()
end
