local utils = {}

function readFile(file)
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

return utils
