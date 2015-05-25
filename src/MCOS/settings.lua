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
