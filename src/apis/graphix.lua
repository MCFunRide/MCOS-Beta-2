-- Graphix API v1: Coded by datcoder1208 


function center(yPos,sText)
  local w, h = term.getSize()
  local x = term.getCursorPos()
  x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
  term.setCursorPos(x,yPos)
  print(sText)
end

function centerWrite(yPos,sText)
  local w, h = term.getSize()
  local x = term.getCursorPos()
  x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
  term.setCursorPos(x,yPos)
  write(sText)
end
 
function totalClear()
  term.setCursorPos(1,1)
  term.clear()
end
 
function bgColor(color)
  term.setBackgroundColor(color)
  totalClear()
end
