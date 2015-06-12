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
log = fs.open("/.install_log","w")
version = 2
term.clear()
term.setCursorPos(1,1)
api = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/apis/graphix.lua").readAll()
f = fs.open("/apis/graphix","w")
f.writeLine(api)
f.close()
log.writeLine("[DL] Downloaded Graphix API")
os.loadAPI("/apis/graphix")
if fs.exists("/startup") then
 f.writeLine("[CHK] Startup File Found")
 graphix.bgColor(colors.red)
 graphix.center(1,"Startup File Detected")
 graphix.center(3,"Renaming to startup.old...")
 shell.run("rename startup startup.old")
 sleep(3)
else
 log.writeLine("[CHK] No startup file found")
 end
graphix.bgColor(colors.lightBlue)
graphix.center(1,"MCOS Beta "..version.." Installer")
graphix.center(3,"Downloading:")
term.setBackgroundColor(colors.green)
write("  ")
start = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/startup.lua").readAll()
f = fs.open("/.startup","w")
f.writeLine(start)
f.close()
log.writeLine("[DL] Downloaded OOBE")
write("   ")
desk = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/desktop.lua").readAll()
f = fs.open("/MCOS/desktop","w")
f.writeLine(desk)
f.close()
log.writeLine("[DL] Downloaded Desktop")
write("    ")
shell = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/shell.lua").readAll()
f = fs.open("/MCOS/shell","w")
f.writeLine(shell)
f.close()
log.writeLine("[DL] Downloaded Shell")
write("     ")
gl = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/GameList.lua").readAll()
f = fs.open("/MCOS/GameList","w")
f.writeLine(gl)
f.close()
log.writeLine("[DL][WIP] Game Lister Downloaded")
write("       ")
about = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/about.lua").readAll()
f = fs.open("/MCOS/about","w")
f.writeLine(about)
f.close()
log.writeLine("[DL] About Downloaded!")
write("         ")
edit = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/editor.lua").readAll()
f = fs.open("/MCOS/editor","w")
f.writeLine(edit)
f.close()
log.writeLine("[DL] Editor Downloaded!")
power = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/power.lua").readAll()
f = fs.open("/MCOS/power","w")
f.writeLine(power)
f.close()
log.writeLine("[DL] Power Downloaded!")
write("             ")
login = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/login.lua").readAll()
f = fs.open("/MCOS/login","w")
f.writeLine(login)
f.close()
log.writeLine("[DL] Login Downloaded!")
first = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/welcome.lua").readAll()
f = fs.open("/startup","w")
f.writeLine(first)
f.close()
sha = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/sha256.lua").readAll()
f = fs.open("/MCOS/sha256","w")
f.writeLine(sha)
f.close()
log.writeLine("[DL][API] SHA256 API downloaded!")
settings = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/settings.lua").readAll()
f = fs.open("/MCOS/settings","w")
f.writeLine(settings)
f.close()
log.writeLine("[DL][BUGGY] Settings Downloaded!")
filemanager = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/MCOS/3rdParty/Gonow32/FileManager.lua").readAll()
f = fs.open("/MCOS/3rdParty/Gonow32/FileManager","w")
f.writeLine(filemanager)
f.close()
log.writeLine("[DL][3RDPARTY] File Manager Downloaded")
upper = http.get("https://github.com/MCFunRide/MCOS-Beta-2/raw/master/src/update.lua").readAll()
f = fs.open("/MCOS/update","w")
f.writeLine(upper)
f.close()
log.writeLine("[DL] Updater Downloaded!")
term.clearLine()
log.writeLine("[MSG] Install Complete!")
sleep(5)
log.writeLine("[DEL] Main Installer Deleted")
fs.delete("/.install")
log.writeLine("[POWER] Rebooting...")
log.close()
os.reboot()
 
