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
