local utils = {}

function readFile(file) -- https://stackoverflow.com/a/11204889
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

return utils
