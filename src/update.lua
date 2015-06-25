os.loadAPI("/apis/graphix")
graphix.bgColor(colors.black)
h = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/.version").readAll()

if h == version then
   graphix.bgColor(colors.green)
   graphix.center(1,"Current Version/Build is: "..h)
   graphix.center(3,"You are up to date!")
   sleep(5)
   shell.run("/MCOS/desktop")
else
   graphix.bgColor(colors.red)
   fs.delete("/startup")
   graphix.center(1,"Current Version/Build is: "..h)
   graphix.center(3,"You are out of date!")
   graphix.center(4,"Updating...")
   sleep(3)
   trolls = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/installer.lua").readAll()
   f = fs.open("/.install","w")
   f.writeLine(trolls)
   f.close()
   shell.run("/.install") 
end
