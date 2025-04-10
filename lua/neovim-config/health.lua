local check_version = function()
	local verstr = string.format("%s.%s.%s", vim.version().major, vim.version().minor, vim.version().patch)
	if not vim.version.cmp then
		vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
		return
	end

	if vim.version.cmp(vim.version(), { 0, 10, 1 }) >= 0 then
		vim.health.ok(string.format("Neovim version is: '%s'", verstr))
	else
		vim.health.error(string.format("Neovim out of date: '%s'. Upgrade to latest stable or nightly", verstr))
	end
end

local check_external_reqs = function()
	for _, exe in ipairs({ "git", "make", "unzip", "rg", "fd", "zoxide", "fzf" }) do
		local is_executable = vim.fn.executable(exe) == 1
		if is_executable then
			vim.health.ok(string.format("Found executable: '%s'", exe))
		else
			vim.health.warn(string.format("Could not find executable: '%s'", exe))
		end
	end

	return true
end

return {
	check = function()
		vim.health.start("neovim-config")

		check_version()
		check_external_reqs()
	end,
}
