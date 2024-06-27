return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			hide_cursor = false,
			stop_eof = false,
			easing = "quadratic",
		})
	end,
}
