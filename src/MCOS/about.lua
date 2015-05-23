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
graphix.center(1,"MCOS Beta "..version)
graphix.center(2,"Coded by: datcoder1208")
graphix.center(3,"This code is copyrighed.")
graphix.center(5,"Credits:")
graphix.center(7,"Gonow32 for File Manager")
graphix.center(9,"GravityScore for SHA256 API")
graphix.center(11,"Thank you for using MCOS Beta "..version.."!")
sleep(5)
shell.run("/MCOS/desktop")
