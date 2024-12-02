package.path = package.path .. ";../?.lua"
local utils = require "utils"

function isIncr(tbl)
  for i = 1, #tbl - 1 do
    if tbl[i] > tbl[i + 1] then return false end
  end
  return true
end

function isDecr(tbl)
  for i = 1, #tbl - 1 do
    if tbl[i] < tbl[i + 1] then return false end
  end
  return true
end

function isReportSafe(report)
  local safe = true
  for n = 1, #report - 1 do
    local diff = math.abs(report[n] - report[n + 1])
    if diff < 1 or diff > 3 then
      safe = false
      break
    end
  end
  return safe
end

local safe_reports = {}
local unsafe_reports = {}

for i,v in ipairs(utils.lines) do
  local report = utils.split(v)
  for x,y in ipairs(report) do report[x] = tonumber(y) end

  if isReportSafe(report) and (isIncr(report) or isDecr(report)) then
    table.insert(safe_reports, report)
  else
    table.insert(unsafe_reports, report)
  end
end

print("Part 1: "..#safe_reports)

for _, report in ipairs(unsafe_reports) do
  for i = 1, #report do
    local copy = utils.copyTbl(report)

    table.remove(copy, i)

    if isReportSafe(copy) and (isIncr(copy) or isDecr(copy)) then
      table.insert(safe_reports, report)
      break
    end
  end
end

print("Part 2: "..#safe_reports)
