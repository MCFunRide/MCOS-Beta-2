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

graphix.bgColor(colors.lightBlue)
graphix.center(1,"MCOS Beta "..version..": Settings")
term.setBackgroundColor(colors.green)
if fs.exists("/MCOS/.pass") then
graphix.center(3,"Change Password")
else
graphix.center(3,"Create Password")
end
term.setBackgroundColor(colors.gray)
graphix.center(5,"Back")


while true do
local evt, button, x, y = os.pullEvent("mouse_click")

if y == 3 then
graphix.bgColor(colors.blue)
graphix.center(1,"MCOS Beta "..version..": Password")
if not fs.exists("/MCOS/.pass") then
graphix.centerWrite(3,"New Password: ")
pass = read()
if not pass == nil then
f = fs.open("/MCOS/.pass","w")
f.writeLine(sha256.sha256(pass))
f.close()
shell.run("/MCOS/settings")
else
shell.run("/MCOS/settings")
end
end
else
graphix.centerWrite(3,"Old Password: ")
old = read()
f = fs.open("/MCOS/.pass","w")
m = f.readLine()
m2 = sha256.sha256(old)
if m == m2 then
graphix.centerWrite(5,"New Password: ")
pass1 = read('*')
graphix.centerWrite(7,"Repeat New Password: ")
pass2 = read('*')
if pass1 == pass2 then
fs.delete("/MCOS/.pass")
f = fs.open("/MCOS/.pass","w")
f.writeLine(sha256.sha256(pass1))
f.close()
shell.run("/MCOS/settings")
else
shell.run("/MCOS/settings")
end
end
end
end
