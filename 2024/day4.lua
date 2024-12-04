package.path = package.path .. ";../?.lua"
local utils = require "utils"

local function xmas(str) return str == "XMAS" or str == "SAMX" end

local total = 0

-- horizontal
for row = 1, #utils.lines do
  for col = 1, #utils.lines[1] do
    local substr = utils.lines[row]:sub(col, col + 3)
    if xmas(substr) then total = total + 1 end
  end
end

-- vertical
for col = 1, #utils.lines[1] do
  for row = 1, #utils.lines do
    local substr = utils.lines[row]:sub(col, col)

    for i = 1, 3 do
      if row + i <= #utils.lines then substr = substr..utils.lines[row + i]:sub(col, col) end
    end
    
    if xmas(substr) then total = total + 1 end
  end
end

-- diagonal


print(total)
