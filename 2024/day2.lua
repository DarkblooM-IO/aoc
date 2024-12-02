package.path = package.path .. ";../?.lua"
local utils = require "utils"

function isIncr(tbl)
  for i = 1, #tbl -1 do
    if tbl[i] > tbl[i + 1] then return false end
  end
  return true
end

function isDecr(tbl)
  for i = 1, #tbl -1 do
    if tbl[i] < tbl[i + 1] then return false end
  end
  return true
end

local result = 0

for i,v in ipairs(utils.lines) do
  local report = utils.split(v)
  local safe = true

  for x,y in ipairs(report) do report[x] = tonumber(y) end

  for n = 1, #report - 1 do
    local diff = math.abs(report[n] - report[n + 1])
    if diff < 1 or diff > 3 then
      safe = false
    end
  end

  print(v.." -> "..tostring(safe))
end
