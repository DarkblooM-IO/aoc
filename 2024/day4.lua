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


print(total)
