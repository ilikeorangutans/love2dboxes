package = "love2dboxes"
version = "0.0.1-1"
source = {
  url = "https://github.com/ilikeorangutans/love2dboxes",
}
description = {
  license = ""
}
dependencies = {
  "lua >= 5.1",
  "luaunit >= 3.2"
}
build = {
  type = "builtin",
  modules = {
    love2dboxes = 'src/love2dboxes.lua',
    ["love2dboxes.util"] = 'src/utils.lua',
    ["love2dboxes.margin"] = 'src/margin.lua',
    ["love2dboxes.alignment"] = 'src/alignment.lua',
    ["love2dboxes.boxmodel"] = 'src/boxmodel.lua',
    ["love2dboxes.widget"] = 'src/widget.lua',
    ["love2dboxes.container"] = 'src/container.lua',
    ["love2dboxes.horizontal_container"] = 'src/horizontal_container.lua',
    ["love2dboxes.vertical_container"] = 'src/vertical_container.lua',
    ["love2dboxes.label"] = 'src/label.lua',
    ["love2dboxes.viewstack"] = 'src/viewstack.lua',
    ["love2dboxes.button"] = 'src/button.lua',
    ["love2dboxes.label"] = 'src/label.lua'
  }
}
