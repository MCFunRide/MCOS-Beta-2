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

version = 2
 
os.loadAPI("/apis/graphix")
graphix.bgColor(colors.cyan)
graphix.center(5,"MCOS Beta "..version)
sleep(0.25)
graphix.bgColor(colors.lightBlue)
graphix.center(5,"MCOS Beta "..version)
sleep(5)
graphix.bgColor(colors.lightBlue)
graphix.center(1,"Welcome to MCOS Beta "..version.."!")
graphix.center(3,"You need to set the system up before using it.")
term.setBackgroundColor(colors.gray)
graphix.center(5,"Begin")
local evt, button, x, y = os.pullEvent("mouse_click")

if y == 5 then
 graphix.bgColor(colors.lightBlue)
 graphix.center(1,"MCOS Beta "..version..": Password")
 graphix.center(3,"Input a password (leave blank for no password)")
 graphix.centerWrite(5,"Password: ")
 pass = read('*')
 graphix.centerWrite(6,"Repeat Password: ")
 rep = read('*')
 if pass == nil and rep ==  nil then
  graphix.bgColor(colors.lightBlue)
 graphix.center(1,"MCOS Beta "..version..": Done")
 graphix.center(3,"The OS has been set up!")
 graphix.center(5,"Press any key to reboot.")
 os.pullEvent("key")
 fs.delete("/startup")
 shell.run("rename .startup startup")
 os.reboot()
 elseif pass == rep then
  
 os.loadAPI("/MCOS/sha256")
 main = sha256.sha256(pass)
 f = fs.open("/MCOS/.pass","w")
 f.writeLine(main)
 f.close()
 graphix.bgColor(colors.lightBlue)
 graphix.center(1,"MCOS Beta "..version..": Done")
 graphix.center(3,"The OS has been set up!")
 graphix.center(5,"Press any key to reboot.")
 os.pullEvent("key")
 fs.delete("/startup")
 shell.run("rename .startup startup")
 os.reboot()
else
 return
end
end
