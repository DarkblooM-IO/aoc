package.path = package.path .. ";../?.lua"
local utils = require "utils"

local l = {}
local r = {}

for i,v in ipairs(utils.lines) do
  local x, y = string.find(v, "^%d+")
  table.insert(l, tonumber(string.sub(v, x, y)))
  x, y = string.find(v, "%d+$")
  table.insert(r, tonumber(string.sub(v, x, y)))
end

table.sort(l)
table.sort(r)

-- part 1
local result1 = 0

for i = 1, #l do
  local diff = math.abs(l[i] - r[i])
  result1 = result1 + diff
end

print("Part 1: "..result1)

-- part 2
local result2 = 0

for i,v in ipairs(l) do result2 = result2 + (v * utils.duplicates(r, v)) end

print("Part 2: "..result2)
