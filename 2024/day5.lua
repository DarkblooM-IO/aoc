package.path = package.path .. ";../?.lua"
local utils = require "utils"

local total = 0
local page_orders = {}
local page_updates = {}

for _, line in ipairs(utils.lines) do
  if line ~= "" then
    if string.match(line, "%d+|%d+") then
      local nums = utils.split(line, "|")
      for i, n in ipairs(nums) do nums[i] = tonumber(n) end
      table.insert(page_orders, nums)
    else
      local nums = utils.split(line, ",")
      for i, n in ipairs(nums) do nums[i] = tonumber(n) end
      table.insert(page_updates, nums)
    end
  end
end

print(total)
