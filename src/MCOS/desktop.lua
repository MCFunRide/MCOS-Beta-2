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

-- StartGUI v2
-- Original Idea by Gonow32
-- Coded by datcoder1208
 
-- Functions
 
local w, h = term.getSize()
 
function drawMenu()
  term.setBackgroundColor(colors.cyan)
  term.setCursorPos(1,h-1)
  term.write("  Exit  ")
  term.setCursorPos(1,h-3)
  term.write("Explorer")
  term.setCursorPos(1,h-2)
  term.write("Settings")
  term.setCursorPos(1,h-4)
  term.write("NoteMake")
  term.setCursorPos(1,h-5)
  term.write("  Info  ")
  term.setCursorPos(1,h-6)
  term.write(" OSUser ")
end
 
function drawDesktop()
  term.setBackgroundColor(colors.white)
  term.clear()
  term.setCursorPos(1,19)
  term.setBackgroundColor(colors.blue)
  term.clearLine()
  term.setCursorPos(1,19)
  term.setBackgroundColor(colors.green)
  term.setTextColor(colors.black)
  write("Start")
end
 
drawDesktop()
menu = 0
while true do
  local evt, button, x, y = os.pullEvent("mouse_click")
  if x >= 1 and x <= 5 and menu == 0 then
    drawDesktop()
    drawMenu()
    menu = 1
  elseif x >= 1 and x <= 5 and y == 19 and menu == 1 then
    drawDesktop()
    menu = 0
  elseif x >= 1 and x <= 8 and y == h - 1 and menu == 1 then
    os.shutdown()
    menu = 0
  elseif x <= 1 and x <= 8 and y == h - 2 and menu == 1 then
    shell.run("/MCOS/settings")
    menu = 0
  elseif x <= 1 and x <= 8 and y == h - 3 and menu == 1 then
    shell.run("/MCOS/3rdParty/Gonow32/FileManager")
    menu = 0
  elseif x <= 1 and x <= 8 and y == h - 4 and menu == 1 then
    shell.run("/MCOS/editor")
    menu = 0
  elseif x <= 1 and x <= 8 and y == h - 5 and menu == 1 then
    shell.run("/MCOS/about")
  else
    drawDesktop()
    menu = 0
  end
end
