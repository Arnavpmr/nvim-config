local _wk, wk = pcall(require, "which-key")

if not _wk then
    return
end

local opts = {
    mode = "n",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}

wk.register({
    ["<leader>b"] = {
        name = "[BUFFER]",

        ["]"] = { "<cmd>bn<cr>", "[BUFFER] Go previous buffer" },
        ["["] = { "<cmd>bp<cr>", "[BUFFER] Go next buffer" },
        q = { "<cmd>bd<cr>", "[BUFFER] Close current buffer" },
        Q = { "<cmd>%bd|e#|bd#<cr>", "[BUFFER] Close other buffers" },
    },

    ["<leader>c"] = {
        name = "[COC]",

        -- Show all diagnostics.
        a = { ":<C-u>CocList diagnostics<cr>", "[COC] Diagnostics"},

        -- Show commands.
        c = { ":<C-u>CocList commands<cr>", "[COC] Commands" },

        d = { "<Plug>(coc-definition)", "[COC] Goto Definition" },

        -- Manage extensions.
        e = { ":<C-u>CocList extensions<cr>", "[COC] Extensions" },

        -- Formatting selected code.
        f = { "<Plug>(coc-format-selected)", "[COC] Format" },

        i = { "<Plug>(coc-implementation)", "[COC] Implementation" },

        -- Do default action for next item.
        j = { ":<C-u>CocNext<cr>", "[COC] Next" },

        -- Do default action for previous item.
        k = { ":<C-u>CocPrev<cr>", "[Coc] Prev" },

        -- Run the Code Lens action on the current line.
        l = { "<Plug>(coc-codelens-action)", "[COC] Codelens Actions" },

        -- Rename symbol
        n = { "<Plug>(coc-rename)", "[COC] Rename Symbol" },

        -- Find symbol of current document.
        o = { ":<C-u>CocList outline<cr>", "[COC] Outline" },

        -- Resume latest coc list.
        p = { ":<C-u>CocListResume<cr>", "[COC] List Resume" },

        -- Apply autofix to fix problem on current line
        q = { "<Plug>(coc-fix-current)", "[COC] Apply Autofix on Current Line" },

        r = { "<Plug>(coc-references)", "[COC] References" },

        -- Search workspace symbols.
        s = { ":<C-u>CocList -I symbols<cr>", "[COC] Search Workplace Symbols" },

        y = { "<Plug>(coc-type-definition)", "[COC] Type Definition" },
    },

    ["<leader>d"] = {
        name = "[VIMTEX]",
        d = { "<cmd>VimtexCompile<cr>", "[VIMTEX] Compile" },
    },

    ["<leader>f"] = {
        name = "[TELESCOPE]",
        f = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[TELESCOPE] Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by grep" },
        b = { "<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers" },
        n = { "<cmd>Telescope node_modules list<cr>", "[TELESCOPE] node_modules" },
        d = { "<cmd>Telescope diagnostics<cr>", "[TELESCOPE] Diagnostics" },
    },

    ["<leader>n"] = {
        name = "[NVIMTREE]",
        n = { "<cmd>NvimTreeToggle<cr>", "[NVIMTREE] Toggle" },
        r = { "<cmd>NvimTreeRefresh<cr>", "[NVIMTREE] Refresh" },
        c = { "<cmd>NvimTreeCollapse<cr>", "[NVIMTREE] Collapse" },
    },

}, opts)

wk.setup {}
