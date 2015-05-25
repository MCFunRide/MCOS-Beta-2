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
