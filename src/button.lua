local Widget = require('love2dboxes.widget')
local Button = Widget:new()

function Button:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  box.Model.init(o)

  if not o.label then o.label = "Button" end
  if not o.onclick then o.onclick = function() print("clicked") end end

  o.dimensions = o.dimensions or { x=0, y=0, w=100, h=23 }
  o.state = 'out'
  o.mouseover = function() o.state = 'over'end
  o.mouseout = function() o.state = 'out' end

  return o
end

function Button:draw()
  Widget.draw(self)

  local r, g, b = self:color()
  local x = self.widgetArea.x
  local y = self.widgetArea.y
  local w = self.widgetArea.w
  local h = self.widgetArea.h

  love.graphics.setColor(r, g, b)
  love.graphics.rectangle('fill', x, y, w, h, 5, 5)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(self.label, x + 5, y + 5)
end

function Button:color()
  if self.state == 'over' then
    return 255, 255, 255
  else
    return 210, 210, 210
  end
end

function Button:mousereleased(x, y, button, istouch)
  if button == 1 and util.overBox(x, y, self.widgetArea) then
    self:onclick()
    return true
  end
end


return Button
