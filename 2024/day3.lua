package.path = package.path .. ";../?.lua"
local utils = require "utils"

local total1 = 0

for _, line in ipairs(utils.lines) do
  local mtch = utils.extractMatches(line, "mul%((%d+,%d+)%)")
  local nums = {}

  for i = 1, #mtch do
    table.insert(nums, utils.split(mtch[i], ","))
    nums[i][1] = tonumber(nums[i][1])
    nums[i][2] = tonumber(nums[i][2])
  end

  for i, _ in ipairs(nums) do
    total1 = total1 + (nums[i][1] * nums[i][2])
  end
end

print("Part 1: "..total1)

local total2 = 0
local mul = true

for _, line in ipairs(utils.lines) do
  local statement = ""
  local nums = {}
  local mul_pattern = "mul%((%d+,%d+)%)$"

  for chr in string.gmatch(line, ".") do
    statement = statement..chr

    if string.match(statement, "do%(%)$") then
      mul = true
    elseif string.match(statement, "don't%(%)$") then
      mul = false
    elseif mul and string.match(statement, mul_pattern) then
      local mtch = utils.extractMatches(statement, mul_pattern)
      table.insert(nums, utils.split(mtch[#mtch], ","))
    end

    for i = 1, #nums do
      nums[i][1] = tonumber(nums[i][1])
      nums[i][2] = tonumber(nums[i][2])
    end

  end

  for i, _ in ipairs(nums) do
    total2 = total2 + (nums[i][1] * nums[i][2])
  end
end

print("Part 2: "..total2)
