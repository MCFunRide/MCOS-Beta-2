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

