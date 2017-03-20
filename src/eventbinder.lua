local EventBinder = {}

local callbacks = { 'keypressed', 'keyreleased', 'mousemoved', 'mousepressed', 'mousereleased', 'resize' }

function EventBinder:bind(ui)
  for _, callback in pairs(callbacks) do
    if ui[callback] and type(ui[callback]) == 'function' then
      love[callback] = function(...)
        ui[callback](ui, unpack({...}))
      end
    end
  end
end

return EventBinder

