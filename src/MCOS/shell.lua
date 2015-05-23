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
term.setTextColor(colors.yellow)
print("MCOS Beta "..version.." Shell")
print()
while true do
  term.setTextColor(colors.white)
  write(shell.dir().."> ")
  cmd = read()
  if cmd == "edit FileManager" then
    printError("edit:60: Access denied.")
  elseif cmd == "edit startup" then
    printError("edit:60: Access denied.")
  elseif cmd == "edit shell" then
    printError("edit:60: Access denied")
  elseif cmd == "exit" then
    shell.run("/MCOS/desktop")
  else
    shell.run(cmd)
  end
end
