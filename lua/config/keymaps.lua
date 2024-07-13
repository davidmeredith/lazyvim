-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Dave's rempas
--
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Have j and k navigate visual lines rather than logical ones
-- I think the v:cound is to deal with word wrap
-- (v:count is the count given for the last Normal mode command)
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap Esc. You need to map these to some infrequent key pair,
-- but if you need to type jj in sentences, then you can but just do it slowly.
-- Old vimrc version:
--vim.inoremap = 'jj' '<Esc>'
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = false })

vim.wo.signcolumn = "yes"

-- FZF (not via telescope )
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })

-- Enable folding with Treesitter, open all folds by default
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

-- Shortcut to my preferred file explorer
--  (note that <localleader>t is often set to  open the terminal)
--
--   Nvim.tree
--     disable netrw at the very start of your init.lua (strongly advised if using nvim.tree)
--     vim.g.loaded_netrw = 1
--     vim.g.loaded_netrwPlugin = 1
--     vim.keymap.set('n', '<leader>x', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
--
--  Neotree
--  ==========
vim.keymap.set("n", "<leader>t", ":Neotree toggle position=left<CR>", { noremap = true, silent = true })
-- reveal current file in file exporer window
vim.keymap.set({ "n" }, "<leader>rt", ":Neotree filesystem reveal left<CR>", { noremap = true, silent = true })

-- Clean Delete
-- =============
-- Best shortcut ever, delete visual selection into blackhole register without
-- overwriting default register
-- vnoremap <leader>d "_d
vim.keymap.set("v", "<leader>d", [["_d]], { noremap = true })

-- Clean Delete & Paste
-- =====================
-- Delete visual selection into blackhole register and paste
-- default register before cursor without overwriting the default reg - great !
-- vnoremap <leader>p "_dP
vim.keymap.set("v", "<leader>p", [["_dP]], { noremap = true })

-- Move visual selection up & down
-- =================================
-- so, for J, move (:m) end of visual selection ('>) one line down then enter
-- (<CR> / carridage return) and select previous vis selection
-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Yank into clipboard
-- ====================
-- nnoremap <leader>y "*y
-- vnoremap <leader>y "*y
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]], { noremap = true })

-- Copy whole file into clipboard
-- nnoremap <leader>Y gg"+yG
vim.keymap.set("n", "<leader>Y", 'gg"*yG', { noremap = true })

-- Disable quote conceal in JSON files
vim.api.nvim_set_var("vim_json_conceal", 0)

-- If using, set its size
vim.api.nvim_set_var("netrw_winsize", 25)

-- Split navigagtion (use christoomey plugin instead, which is 'Ctrl hjkl')
-- ==================
-- Jump between splits, old vimrc version:
-- nnoremap <leader>h :wincmd h<CR>
-- nnoremap <leader>j :wincmd j<CR>
-- nnoremap <leader>k :wincmd k<CR>
-- nnoremap <leader>l :wincmd l<CR>
--vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', {noremap=true, silent=true})
--vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', {noremap=true, silent=true})
--vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', {noremap=true, silent=true})
--vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', {noremap=true, silent=true})

-- Resize splits, old vimrc version:
-- nnoremap <leader>[ :vertical resize +5<CR>
-- nnoremap <leader>] :vertical resize -5<CR>
-- nnoremap <leader>+ :resize +5<CR>
-- nnoremap <leader>- :resize -5<CR>
-- vim.keymap.set('n', '<leader>]', ':vertical resize +5<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>[', ':vertical resize -5<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>=', ':resize +5<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>-', ':resize -5<CR>', {noremap=true, silent=true})
--
-- Remember, these are not TMUX panes, i use "<Ctrl b> hjkl" where 'b' is leader (space)
vim.keymap.set("n", "<leader>l", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", ":resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", ":resize -5<CR>", { noremap = true, silent = true })

-- Tab navigation
-- ===============
-- Note, this is different to my shell & browser tab navigation remaps (<S-Cmd-]> and <S-Cmd-[>)
-- nnoremap <S-left>  :tabprevious<CR>
-- nnoremap <S-right> :tabnext<CR>
-- nnoremap <C-t>     :tabnew .<CR>
-- vim.keymap.set("n", "<S-Left>", ":tabprevious<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<S-Right>", ":tabnext<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

-- Tab between Buffers
-- ===================
-- nnoremap <TAB>  :bnext<CR>
-- nnoremap <S-TAB>  :bprev<CR>
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

-- Because Lazyvim ovrewrites these (move cursor: high, medium, low)
vim.keymap.set("n", "H", "H")
vim.keymap.set("n", "M", "M")
vim.keymap.set("n", "L", "L")

-- vim-visual-multi
-- ==================
--let g:VM_maps["Add Cursor Down"]    = '<M-j>'   " new cursor down
--let g:VM_maps["Add Cursor Up"]      = '<M-k>'   " new cursor up
--vim.g.VM_maps["Add Cursor Down"] = "<C-j>"
--vim.g.VM_maps["Add Cursor Up"] = "<C-k>"
