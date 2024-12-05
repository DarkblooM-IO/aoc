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

for _, pages in ipairs(page_updates) do
  local valid = true
  print(pages[#pages - ((#pages - 1) / 2)])
  for i = 1, #pages - 1 do
    for j = 1, #pages do
      local test = {pages[i], pages[j]}
      if utils.tblInTbl(page_orders, test) then
        valid = true
        -- print(table.concat(test, ";"))
        break
      else valid = false end
    end
  end
  if valid then total = total + 1 end
end

print(total)
