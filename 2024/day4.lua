package.path = package.path .. ";../?.lua"
local utils = require "utils"

local total = 0

for row = 1, #utils.lines do
  for col = 1, #utils.lines[1] do
    local substr = utils.lines[row]:sub(col, col + 3)
    if substr == "XMAS" or substr == "SAMX" then total = total + 1 end
  end
end

for col = 1, #utils.lines[1] do
  for row = 1, #utils.lines do
    local substr = utils.lines[row]:sub(col, col)

    for i = 1, 3 do
      if row + i <= #utils.lines then substr = substr..utils.lines[row + i]:sub(col, col) end
    end
    
    if substr == "XMAS" or substr == "SAMX" then total = total + 1 end
  end
end

print(total)
