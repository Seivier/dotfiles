local hls_status = vim.v.hlsearch
for name, _ in pairs(package.loaded) do
  if name:match("^vgonzalez") then
    package.loaded[name] = nil
  end
end

if hls_status == 0 then
  vim.opt.hlsearch = false
end

require("vgonzalez")
