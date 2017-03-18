local Viewstack = {}

function Viewstack:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  o.w = o.w or 0
  o.h = o.h or 0

  return o
end

function Viewstack:current()
  return self[#(self)]
end

function Viewstack:push(view)
  self:checkView(view)
  view.viewstack = self
  view:resize(self.w, self.h)

  table.insert(self, view)
end

function Viewstack:checkView(view)
  assert(view.resize, "view does not implement resize")
  assert(view.update, "view does not implement update")
  assert(view.draw, "view does not implement draw")
end

function Viewstack:pop()
  if #(self) <= 1 then
    print("CANNOT POP VIEW STATE, NOT ENOUGH LEFT!")
    return
  end
  table.remove(self)
end

function Viewstack:resize(w, h)
  self.w = w
  self.h = h
  if #(self) > 0 then
    self:current():resize(w, h)
  end
end

function Viewstack:keypressed(key, scancode, isrepeat)
  local current = self:current()
  if current.keypressed then
    current:keypressed(key, scancode, isrepeat)
  end
end

function Viewstack:mousepressed(x, y, button, istouch)
  local current = self:current()
  if current.mousepressed then
    current:mousepressed(x, y, button, istouch)
  end
end

function Viewstack:mousemoved(x, y)
  local current = self:current()
  if current.mousemoved then
    current:mousemoved(x, y)
  end
end

function Viewstack:layout()
  local current = self:current()
  if not current then return end
  current:layout()
end

function Viewstack:draw()
  local current = self:current()
  if not current then return end
  current:draw()
end

return Viewstack
