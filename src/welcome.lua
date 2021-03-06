--[[
Copyright (c) 2015, The CubeSpaceCC Team

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted,
provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE
INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL,
DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA
OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
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
