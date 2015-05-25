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

