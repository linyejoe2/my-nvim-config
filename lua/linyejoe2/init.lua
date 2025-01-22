require("linyejoe2.remap")
require("linyejoe2.set")
require("linyejoe2.lazy")

require("Comment").setup()

require("linyejoe2.lsp")
require("linyejoe2.cmp")
require 'linyejoe2.reFileType'

require('lualine').setup {
	sections = {
		lualine_c = { {
			"filename",
			file_status = true,
			path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
		} }
	}
}
-- require("linyejoe2.toggleterm")

print("hello from linyejoe2")
