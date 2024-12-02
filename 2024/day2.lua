package.path = package.path .. ";../?.lua"
local utils = require "utils"

local result = 0

for i,v in ipairs(utils.lines) do
  local report = utils.split(v)
  local safe = false

  for x,y in ipairs(report) do report[x] = tonumber(y) end

  for n = 1, #report - 1 do
    local diff = math.abs(report[n] - report[n + 1])
    -- FIXME
    safe = (safe == false) and (diff >= 1 and diff <= 3)
  end

  print(v.." -> "..tostring(safe))
end
