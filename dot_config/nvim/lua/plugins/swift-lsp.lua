return {
    {
        "neovim/nvim-lspconfig",
        config = function()
	    local capabilities = vim.lsp.protocol.make_client_capabilities()

	    capabilities.workspace = capabilities.workspace or {}
	    capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }

	    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	    if ok then
		    capabilities = cmp_lsp.default_capabilities(capabilities)
	    end

	    vim.api.nvim_create_autocmd('LspAttach', {
        	desc = 'LSP Actions',
		callback = function(args)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
		end,
		})

		vim.lsp.config("sourcekit", {
      cmd = { "xcrun", "sourcekit-lsp" },
      capabilities = capabilities,
    })
    vim.lsp.enable("sourcekit")
        end,
    }
}
