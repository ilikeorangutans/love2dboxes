local util = require('love2dboxes.util')
local Box = require('love2dboxes.boxmodel')
local Widget = require('love2dboxes.widget')
local Container = require('love2dboxes.container')

local VerticalContainer = Container:new()

function VerticalContainer:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  Box.init(o)
  Container.init(o)

  o:setAlignment('fill', 'fill')

  return o
end

function VerticalContainer:layout()
  Widget.layout(self)

  if #(self.widgets) == 0 then return end

  local sizes = {}
  for _, widget in pairs(self.widgets) do
    local h = widget.dimensions.h
    table.insert(sizes, h)
  end

  local heights = util.distributeSizes(self.widgetArea.h, sizes)
  local x = self.widgetArea.x
  local y = self.widgetArea.y
  local w = self.widgetArea.w

  for i, widget in pairs(self.widgets) do
    local h = heights[i]

    widget:setBounds(x, y, w, h)
    widget:layout()

    y = y + h
  end
end

return VerticalContainer
