local M = {}

function M.entry(_, args)
	local selected = cx.active.current.hovered
	if not selected then
		ya.notify({ title = "Open With", content = "No file selected!", timeout = 2 })
		return
	end

	-- Detect full path
	local path = tostring(selected.url)

	-- Use xdg-open for Linux
	local cmd = string.format("xdg-open '%s' >/dev/null 2>&1 &", path)
	os.execute(cmd)

	ya.notify({ title = "Open With", content = "Opened in default app", timeout = 2 })
end

return M
