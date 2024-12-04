package.path = package.path .. ";../?.lua"
local utils = require "utils"

local function xmas(str) return #utils.extractMatches(str, "XMAS") + #utils.extractMatches(str, "SAMX") end

local total = 0

-- horizontal
for i,v in ipairs(utils.lines) do
  total = total + xmas(v)
end

-- vertical
for i = 1, #utils.lines[1] do
  local line = ""
  for k = 1, #utils.lines do line = line..utils.lines[k]:sub(i, i) end
  total = total + xmas(line)
end

-- diagonal
local diag = ""
local anti_diag = ""
local row = #utils.lines
local col = #utils.lines[1]

for i = 1, math.min(row, col) do diag = diag..utils.lines[i]:sub(i, i) end
for i = 1, math.min(row, col) do anti_diag = anti_diag..utils.lines[i]:sub(m - i + 1, m - i + 1) end

-- TODO

print(total)
