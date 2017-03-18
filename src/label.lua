local Widget = require('love2dboxes.widget')
local Box = require('love2dboxes.boxmodel')

local Label = Widget:new()

function Label:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  Box.init(o)

  o.text = o.text or ""
  o.color = o.color or {r=255,g=255,b=255}
  o.changedText = true

  return o
end

function Label:setText(text)
  if self.text == text then return end

  self.text = text
  self.changedText = true
end

function Label:layout()
  if self.changedText then
    self:calculateTextSize()
  end
  Widget.layout(self)
end

function Label:calculateTextSize()
  if self.dimensions.w == 0 and self.dimensions.h == 0 and self.alignment.horizontal ~= 'fill' then
    print(("Label:calculateTextSize() Label %q won't display anything; dimensions are 0x0 and alignment is not set to \"fill\". This is not implemented yet."):format(self.text))
  end

  self.changedText = false

  if self.widgetArea.w == 0 then return end

  local font = love.graphics.getFont()
  local lineHeight = font:getHeight()
  local width, wrappedText = font:getWrap(self.text, self.widgetArea.w)

  local height = lineHeight * #(wrappedText)

  height = height + self.margin.top + self.margin.bottom
  width = width + self.margin.left + self.margin.right
end

function Label:draw()
  local x = self.widgetArea.x
  local y = self.widgetArea.y
  local w = self.widgetArea.w
  love.graphics.setColor(self.color.r, self.color.g, self.color.b, 255)
  love.graphics.printf(self.text, x, y, w, 'left')
end

return Label
