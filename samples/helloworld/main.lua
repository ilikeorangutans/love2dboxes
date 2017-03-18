local ui = require('love2dboxes')
local util = require('love2dboxes.util')
local Label = require('love2dboxes.label')

function love.load()
  love.window.setMode(800, 600, {resizable=true, minwidth=400, minheight=200})

  l = Label:new({text="Hello, World!", w=100, h=20})
  l:setAlignment('center', 'middle')
  l:setBounds(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

function love.draw()
  l:layout()
  l:draw()
end

function love.resize(w, h)
  l:setBounds(0, 0, w, h)
end

