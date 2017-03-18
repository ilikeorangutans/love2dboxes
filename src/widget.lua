local util = require('love2dboxes.util')
local Box = require('love2dboxes.boxmodel')

local Widget = Box:new()

function Widget:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  o:setAlignment('left', 'top')

  return o
end

function Widget:layout()
  self:recalculate()
end

function Widget:draw()
  if false then
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle('line', self.bounds.x, self.bounds.y, self.bounds.w, self.bounds.h)
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle('line', self.marginArea.x, self.marginArea.y, self.marginArea.w, self.marginArea.h)
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle('line', self.widgetArea.x, self.widgetArea.y, self.widgetArea.w, self.widgetArea.h)
  end
end

function Widget:update(dt)
end

function Widget:mousemoved(x, y)
  local orig = self.mouse_is_over
  if util.overBox(x, y, self.widgetArea) then
    self.mouse_is_over = true
  else
    self.mouse_is_over = false
  end

  if orig ~= self.mouse_is_over then
    if self.mouse_is_over and self.mouseover then
      self:mouseover()
    elseif not self.mouse_is_over and self.mouseout then
      self:mouseout()
    end
  end
end

function Widget:mousepressed(x, y, button, istouch)
end

function Widget:mousereleased(x, y, button, istouch)
end

function Widget:resize(w, h)
  self:setBounds(self.bounds.x, self.bounds.y, w, h)
end

return Widget
