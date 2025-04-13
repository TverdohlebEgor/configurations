return {
	{
	"neovim/nvim-lspconfig",

	config = function()

		require'lspconfig'.pylsp.setup{
		  settings = {
		    pylsp = {
		      plugins = {
		        pycodestyle = {
		          ignore = {'W391'},
		          maxLineLength = 100
		        }
		      }
		    }
		  }
		}

		-- TO DECIDE IF I WANT THIS OR NOT
		--require'lspconfig'.jdtls.setup{}
		

	end,

	}

}
