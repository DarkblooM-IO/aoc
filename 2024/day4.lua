package.path = package.path .. ";../?.lua"
local utils = require "utils"

local total = 0

for _, line in ipairs(utils.lines) do
  total = total + #utils.extractMatches(line, "XMAS") + #utils.extractMatches(line, "SAMX")
end

print(total)
