os.loadAPI("/apis/graphix")
graphix.totalClear()
graphix.bgColor(colors.lightBlue)
term.setCursorPos(1,1)
term.setBackgroundColor(colors.blue)
term.clearLine()
term.setTextColor(colors.red)
graphix.centerWrite(1,"MCOS Beta "..version)
term.setBackgroundColor(colors.lightBlue)
print()
term.setCursorPos(1,3)
term.setTextColor(colors.yellow)
term.setBackgroundColor(colors.green)
graphix.center(3,"App Editor")
graphix.center(5,"File Manager")
graphix.center(7,"Games")
graphix.center(9,"Power (i)")
graphix.center(11,"Shell")
graphix.center(13,"Information")
 
while true do
 
  local evt, button, x, y = os.pullEvent("mouse_click")
 
  if y == 3 then
    shell.run("/MCOS/editor")
  elseif y == 5 then
    shell.run("/MCOS/3rdParty/Gonow32/FileManager")
  elseif y == 7 then
    shell.run("/MCOS/GameList")
  elseif y == 9 then
    shell.run("/MCOS/power")
  elseif y == 11 then
    shell.run("/MCOS/shell")
  elseif y == 13 then
    shell.run("/MCOS/about")
  else
    shell.run("/MCOS/desktop")
  end
end
