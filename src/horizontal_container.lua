local util = require('love2dboxes.util')
local Box = require('love2dboxes.boxmodel')
local Widget = require('love2dboxes.widget')
local Container = require('love2dboxes.container')

local HorizontalContainer = Container:new()

function HorizontalContainer:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  Box.init(o)
  Container.init(o)

  return o
end

function HorizontalContainer:layout()
  Widget.layout(self)

  if #(self.widgets) == 0 then return end

  local sizes = {}
  for _, widget in pairs(self.widgets) do
    local w = widget.dimensions.w
    table.insert(sizes, w)
  end

  local widths = util.distributeSizes(self.widgetArea.w, sizes)
  local x = self.widgetArea.x
  local y = self.widgetArea.y
  local h = self.widgetArea.h

  for i, widget in pairs(self.widgets) do
    local w = widths[i]


    widget:setBounds(x, y, w, h)
    widget:layout()

    x = x + w
  end
end

return HorizontalContainer
