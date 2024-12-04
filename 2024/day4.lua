package.path = package.path .. ";../?.lua"
local utils = require "utils"

local function xmas(str) return #utils.extractMatches(str, "XMAS") + #utils.extractMatches(str, "SAMX") end

local total = 0

for _, line in ipairs(utils.lines) do
  total = total + xmas(line)
end

for i = 1, #utils.lines[1] do
  local vline = ""
  for k = 1, #utils.lines do vline = vline..string.sub(utils.lines[k], i, i) end
  total = total + xmas(vline)
end

print(total)
