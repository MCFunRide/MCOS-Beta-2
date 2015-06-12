local w,h = term.getSize()
local previousDir = currentDir
local currentDir = "/"
local dirFiles = fs.list(currentDir)
local choice = 1
 
function printCentered(string, y)
  local x = (w/2)-(string.len(string)/2)
  term.setCursorPos(x,y)
  term.write(string)
end
 
function clearScr()
  term.clear()
  term.setCursorPos(1,1)
end
 
clearScr()
printCentered("Simple File Manager",2)
printCentered("By Gonow32",3)
printCentered("Press B to go back a folder",5)
printCentered("Press C to create a file",6)
printCentered("Press D to delete a file/folder",7)
printCentered("Press M to make a folder",8)
sleep(5)
 
function renderDir()
  clearScr()
  for i = 1,#dirFiles do
    if fs.isDir(dirFiles[i]) then
      if choice == i then
        term.setBackgroundColour(colours.white)
      end
      term.setTextColour(colours.green)
      printCentered(dirFiles[i], i)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.black)
    else
      if choice == i then
        term.setBackgroundColour(colours.white)
        term.setTextColour(colours.black)
      end
      printCentered(dirFiles[i], i)
      term.setBackgroundColour(colours.black)
      term.setTextColour(colours.white)
    end
  end
  printCentered("Simple File Manager",h)
  --printCentered("Press B to go back",h-1)
  --printCentered("Press C to make a new file",h-2)
  if fs.exists("partitiontable") then
    file = fs.open("partitiontable","r")
    if not tonumber(file.readLine()) then
      term.setCursorPos(1,h)
      term.write("Corrupt Disk")
    else
      term.setCursorPos(1,h)
      term.write("FDisk Format")
    end
    file.close()
  else
    term.setCursorPos(1,h)
    term.write("Regular Disk")
  end
  local freeSpace = tostring(fs.getFreeSpace(currentDir))
  term.setCursorPos((w-string.len(freeSpace))-1,h)
  term.write(freeSpace.."B")
end
 
while true do
  renderDir()
  local event, key = os.pullEvent("key")
  if key == keys.up then
    if choice == 1 then
      choice = #dirFiles
    else
      choice = choice - 1
    end
  elseif key == keys.down then
    if choice == #dirFiles then
      choice = 1
    else
      choice = choice + 1      
    end
  elseif key == keys.c then
    local filename = ""
    while filename == "" do
      clearScr()
      term.write("Filename: ")
      filename = read()
    end
    shell.run("edit "..filename)
    dirFiles = fs.list(currentDir)
    renderDir()
  elseif key == keys.d then
    printCentered("Confirm Delete [Y/N]",h-1)
    local event, key = os.pullEvent("key")
    if key == keys.y then
      if not fs.isReadOnly(dirFiles[choice]) then
        fs.delete(dirFiles[choice])
        dirFiles = fs.list(currentDir)
        choice = 1
        renderDir()
      end
    end
  elseif key == keys.m then
    local name = ""
    while name == "" do
      clearScr()
      term.write("Folder Name: ")
      name = read()
    end
    splitter = "/"
    if currentDir == "/" then
      splitter = ""
    end
    fs.makeDir(currentDir..splitter..name)
    dirFiles = fs.list(currentDir)
    renderDir()
  elseif key == keys.b then
    local pseudoDir = previousDir
    previousDir = currentDir
    currentDir = pseudoDir
    dirFiles = fs.list(currentDir)
    choice = 1
    renderDir()
  elseif key == keys.enter then
    if fs.isDir(dirFiles[choice]) then
      previousDir = currentDir
      currentDir = dirFiles[choice]
      dirFiles = fs.list(currentDir)
      choice = 1
      renderDir()
    else
      clearScr()
      local invald = true
      --error("I reached here!")
      repeat
        clearScr()
        term.write("Run, Edit, Cancel or Delete? [R/E/C/D] ")
        option = read()
        if option == "r" or option == "R" then
          invalid = false
          shell.run(dirFiles[choice])
        elseif option == "e" or option == "E" then
          invalid = false
          shell.run("edit "..dirFiles[choice])
        elseif option == "c" or option == "C" then
          invalid = false
        elseif option == "d" or option == "D" then
          invalid = false
          fs.delete(dirFiles[choice])
          dirFiles = fs.list(currentDir)
        end
      until invalid == false
    end
  end
end
