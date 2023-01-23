return {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function(_, opts)
        require("mini.move").setup(opts)
    end,
}
