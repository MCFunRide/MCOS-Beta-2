 
os.loadAPI("/apis/graphix")
graphix.bgColor(colors.green)
graphix.center(1,"Welcome to the MCOS Editor!")
graphix.centerWrite(5,"File Dir: /")
file = read()
if not file == nil then
shell.run("edit "..file)
else
shell.run("/MCOS/editor")
end
