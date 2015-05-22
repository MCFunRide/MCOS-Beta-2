version = 2
 
os.loadAPI("/apis/graphix")
graphix.bgColor(colors.cyan)
graphix.center(5,"MCOS Beta "..version)
sleep(0.25)
graphix.bgColor(colors.lightBlue)
graphix.center(5,"MCOS Beta "..version)
sleep(5)
shell.run("/MCOS/login")
 
local PROTECT = "/MCOS/"
local old_fsOpen = _G["fs"]["open"]
local old_fsDelete = _G["fs"]["delete"]
local old_fsMove = _G["fs"]["move"]
 
_G["fs"]["open"] = function (path, mode)
        mode = string.lower (mode)
 
        if shell.resolveProgram (path) == shell.resolveProgram (PROTECT) and  (mode == "w" or mode == "wb") then
                return nil
        end
 
        return old_fsOpen (path, mode)
end
_G["fs"]["delete"] = function (path)
        if shell.resolveProgram (path) == shell.resolveProgram(PROTECT) then
         return nil
        end
 
        return old_fsDelete(path)
end
_G["fs"]["move"] = function(fromPath, toPath)
        if shell.resolveProgram(fromPath) == shell.resolveProgram(PROTECT) then
          return nil
        end
       
        return old_fsMove(fromPath, toPath)
end
 
local PROTECTED_FILE = "/startup"
local old_fsOpen = _G["fs"]["open"]
local old_fsDelete = _G["fs"]["delete"]
local old_fsMove = _G["fs"]["move"]
 
_G["fs"]["open"] = function (path, mode)
        mode = string.lower (mode)
 
        if shell.resolveProgram (path) == shell.resolveProgram (PROTECTED_FILE) and  (mode == "w" or mode == "wb") then
                return nil
        end
 
        return old_fsOpen (path, mode)
end
_G["fs"]["delete"] = function (path)
        if shell.resolveProgram (path) == shell.resolveProgram(PROTECTED_FILE) then
         return nil
        end
 
        return old_fsDelete(path)
end
_G["fs"]["move"] = function(fromPath, toPath)
        if shell.resolveProgram(fromPath) == shell.resolveProgram(PROTECTED_FILE) then
          return nil
        end
       
        return old_fsMove(fromPath, toPath)
end
 
-- Init
term.setTextColor(colors.red)
print("Restricted Access")
term.setTextColor(colors.yellow)
