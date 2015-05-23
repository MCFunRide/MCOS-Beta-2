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

if fs.exists("/MCOS/.pass") then
f = fs.open("/MCOS/.pass","r")
m = f.readAll()


if m == " " then
 shell.run("/MCOS/desktop")
else
os.loadAPI("/MCOS/sha256")
os.loadAPI("/apis/graphix")
graphix.bgColor(colors.blue)
graphix.center(1,"MCOS Login")
graphix.centerWrite(3,"Password: ")
pass = read('*')
main = sha256.sha256(pass)
f = fs.open("/MCOS/.pass","r")
m = f.readAll()
 
if main == m then
  shell.run("/MCOS/desktop")
else
  shell.run("/MCOS/login")
end
end
else
shell.run("/MCOS/desktop")
end

