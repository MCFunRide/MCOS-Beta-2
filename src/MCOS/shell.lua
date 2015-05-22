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
