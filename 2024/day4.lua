-- Couldn't quite figure this one out

package.path = package.path .. ";../?.lua"
local utils = require "utils"

local function xmas(str) return str == "XMAS" or str == "SAMX" end

local total = 0

--== horizontal ==--

for i, row in ipairs(utils.lines) do
  for j = 1, #row - 3 do
    local substr = row:sub(j, j + 3)
    if xmas(substr) then total = total + 1 end
  end
end

--== vertical ==--

for col = 1, #utils.lines[1] do
  for row = 1, #utils.lines - 3 do
    local substr = ""
    for k = 0, 3 do substr = substr..utils.lines[row + k]:sub(col, col) end
    if xmas(substr) then total = total + 1 end
  end
end

--== diagonal ==--

-- tl to br
for row = 1, #utils.lines - 5 do
  for col = 1, #utils.lines[1] - 5 do
    local substr = ""
    for k = 0, 3 do substr = substr..utils.lines[row + k]:sub(col + k, col + k) end
    if xmas(substr) then total = total + 1 end
  end
end

-- bl to tr
for row = 4, #utils.lines do
  for col = 1, #utils.lines[1] - 5 do
    local substr = ""
    for k = 0, 3 do substr = substr..utils.lines[row - k]:sub(col + k, col + k) end
    if xmas(substr) then total = total + 1 end
  end
end

print(total)
