package.path = package.path .. ";../?.lua"
local utils = require "utils"

local total1 = 0
local total2 = 0

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
