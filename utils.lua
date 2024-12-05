local utils = {}

local function readFile(file) -- https://stackoverflow.com/a/11204889
  local lines = {}
  for line in io.lines(file) do lines[#lines + 1] = line end
  return lines
end

utils.lines = readFile("input.txt")

utils.duplicates = function (tbl, elem)
  local total = 0
  for i,v in pairs(tbl) do
    if v == elem then total = total + 1 end
  end
  return total
end

utils.split = function (inputstr, sep) -- https://stackoverflow.com/a/7615129
  if sep == nil then sep = "%s" end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

utils.copyTbl = function (tbl)
  local t = {}
  for i,v in ipairs(tbl) do table.insert(t, v) end
  return t
end

utils.extractMatches = function (str, pattern)
  local output = {}
  for m in string.gmatch(str, pattern) do table.insert(output, m) end
  return output
end

utils.tblEqual = function (tbl1, tbl2)
  if #tbl1 ~= #tbl2 then return false end
  for i = 1, #tbl1 do
    if tbl1[i] ~= tbl2[i] then return false end
  end
  return true
end

utils.tblInTbl = function (tbl1, tbl2)
  for _, t in ipairs(tbl1) do
    if utils.tblEqual(t, tbl2) then return true end
  end
  return false
end

return utils
