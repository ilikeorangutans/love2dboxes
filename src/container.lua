local Widget = require('love2dboxes.widget')

local Container = Widget:new()

function Container:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  return o
end

function Container:init()
  self.widgets = {}
end

function Container:mousemoved(x, y)
  Widget.mousemoved(self, x, y)

  for _, widget in pairs(self.widgets) do
    widget:mousemoved(x, y)
  end
end

function Container:add(widget)
  table.insert(self.widgets, widget)
  self.layoutChanged = true
  return widget
end

function Container:resize(w, h)
  self:setBounds(self.bounds.x, self.bounds.y, w, h)
  for _, widget in pairs(self.widgets) do
    widget:resize(w, h)
  end
end

function Container:layout()
  Widget.layout(self)
  for _, widget in pairs(self.widgets) do
    widget:layout()
  end
end

function Container:draw()
  Widget.draw(self)
  for _, widget in pairs(self.widgets) do
    widget:draw()
  end
end

function Container:mousereleased(x, y, button, istouch)
  for i, widget in pairs(self.widgets) do
    if util.overBox(x, y, widget.bounds) then
      if widget:mousereleased(x, y, button, istouch) then
        return true
      end
    end
  end
end

function Container:update(dt)
  for _, widget in pairs(self.widgets) do
    widget:update(dt)
  end
end

return Container
