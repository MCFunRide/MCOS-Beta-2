version = 2
term.clear()
term.setCursorPos(1,1)
api = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/apis/graphix.lua").readAll()
f = fs.open("/apis/graphix","w")
f.writeLine(api)
f.close()
os.loadAPI("/apis/graphix")

graphix.bgColor(colors.lightBlue)
graphix.center(1,"MCOS Beta "..version.." Installer")
graphix.center(3,"Downloading:")
term.setBackgroundColor(colors.green)
write("  ")
start = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/startup.lua").readAll()
f = fs.open("/startup","w")
f.writeLine(start)
f.close()
write("   ")
desk = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/desktop.lua").readAll()
f = fs.open("/MCOS/desktop","w")
f.writeLine(desk)
f.close()
write("    ")
shell = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/shell.lua").readAll()
f = fs.open("/MCOS/shell","w")
f.writeLine(shell)
f.close()
write("     ")
gl = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/GameList.lua").readAll()
f = fs.open("/MCOS/GameList","w")
f.writeLine(gl)
f.close()
about = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/about.lua").readAll()
f = fs.open("/MCOS/about","w")
f.writeLine(about)
f.close()
edit = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/editor.lua")
f = fs.open("/MCOS/editor","w")
f.writeLine(edit)
f.close()
power = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/power.lua").readAll()
f = fs.open("/MCOS/power","w")
f.writeLine(power)
f.close()
login = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/login.lua")
f = fs.open("/MCOS/login","w")
f.writeLine(login)
f.close()
first = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/welcome.lua")
f = fs.open("/startup","w")
f.write(first)
f.close()
sleep(5)
os.reboot()
