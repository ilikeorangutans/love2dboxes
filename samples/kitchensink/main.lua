local ui = require('love2dboxes')
local util = require('love2dboxes.util')
local Label = require('love2dboxes.label')
local Container = require('love2dboxes.container')
local HorizontalContainer = require('love2dboxes.horizontal_container')
local VerticalContainer = require('love2dboxes.vertical_container')
local Button = require('love2dboxes.button')
local EventBinder = require('love2dboxes.eventbinder')

function love.load()
  love.window.setMode(800, 600, {resizable=true, minwidth=400, minheight=200})

  viewstack = ui.Viewstack:new()
  viewstack:resize(800, 600)

  c = HorizontalContainer:new()
  EventBinder:bind(c)
  c:setAlignment('fill', 'fill')
  v = VerticalContainer:new({w=200,h=0})
  v:setMargin(11, 11, 11, 11)
  b = v:add(Button:new({label="horray", w=100, h=50}):setAlignment('fill', 'top'))
  marginButton = v:add(Button:new({label="Increase Margin", w=100, h=61}):setAlignment('fill', 'top'):setMargin(11, 0, 0, 0))
  c:add(v)

  viewstack:push(c)

  l = Label:new({text="TEXT", w=100, h=100})
  l:setAlignment('fill', 'fill')
  c:add(l)

  c:add(Label:new({text="Text2", w=0, h=0}):setAlignment('fill', 'fill'))
  c:add(Label:new({text="Text3", w=100, h=0}):setAlignment('center', 'fill'))


  local counter = 0
  b.onclick = function()
    counter = counter + 1
    l:setText(("Clicked %d times!"):format(counter))
  end

  marginButton.onclick = function()
    local top = l.margin.top
    top = top + 3
    l:setMargin(top, 0, 0, 0)
  end

end

function love.draw()
  viewstack:layout()
  viewstack:draw()
end
