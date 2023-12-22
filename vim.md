### stock

- `C-t`: new tab
- `<leader><tab>`: switch tab
- `<leader><s-tab>`: switch tab
- `<leader>p/d`: paste/delete without polutting clipboard
- `<leader>x`: add execute permission to current file
- `<leader>s`: replace the word where cursor is on
- `<leader>W`: toggle wrap
- `<leader>L`: toggle list spaces and line delimiters
- `<leader>D`: toggle diagnostics
- `<leader>t`: toggle alternate
- `<C-j><C-j>`: exit terminal buffer insert mode
- `<C-j><C-j>`: exit insert mode
- `<C-j><C-j>`: quicker exit and save
- `<C-k><C-k>`: quicker exit without saving

### conform.nvim

- `<leader>F`: ConformFormat
- `<leader>S`: ConformSpell

### vim-fugitive + gitsigns.nvim

- `<leader>G`: Fugitive
- `<leader>hs`: stage_hunk
- `<leader>hu`: undo_stage_hunk
- `<leader>hr`: reset_hunk
- `<leader>hp`: preview_hunk
- `<leader>hS`: stage_buffer
- `<leader>hR`: reset_buffer
- `<leader>hb`: toggle_current_line_blame
- `<leader>hd`: diffthis

### fzf-lua

- `<leader>ff`: fzflua.files
- `<leader>fg`: fzflua.live_grep
- `<leader>fG`: fzflua.grep
- `<leader>fh`: fzflua.command_history
- `<leader>H`: fzflua.command_history
- `<leader>:`: fzflua.commands

### harpoon

- `<leader>M`: mark.add_file
- `<leader>m`: ui.toggle_quick_menu
- `<C-k>`: ui.nav_prev
- `<C-j>`: ui.nav_next

### Packer

- `<leader><leader><leader>`: PackerSync

### hop.nvim

- `<leader>l`: HopLineStart
- `<leader>w`: HopWord
- `<leader>/`: HopPattern

### nvim-terminal

- `<C-z>`: toggle terminal
- `<leader>1-5`: toggle terminal
- `<leader><leader>+`: increase terminal width
- `<leader><leader>-`: decrease terminal width
- `<leader>+`: increase terminal height
- `<leader>-`: decrease terminal height

### nvim-tree.lua

- `<C-n>`: NvimTreeToggle
- `<C-N>`: NvimTreeFindFileToggle

### undotree

- `<leader>u`: UndotreeToggle

### nerdcommenter

- `<leader>c<space>`: NERDCommenterToggle
- `<leader>cc`: NERDCommenterComment
- `<leader>cu`: NERDCommenterUncomment
- `<leader>ci`: NERDCommenterInvert
- `<leader>cs`: NERDCommenterSexy
- `<leader>cm`: NERDCommenterMinimal
- `<leader>cy`: NERDCommenterYank
- `<leader>cn`: NERDCommenterNested
- `<leader>ca`: NERDCommenterAltDelims
- `<leader>c$`: NERDCommenterToEOL
- `<leader>cA`: NERDCommenterAppend

### vim-folding

- `za` toggle current fold
- `zA` recursively toggle current fold
- `zo` open current fold
- `zO` recursively open current fold
- `zc` close current fold
- `zC` recursively close current fold
- `zR` open all folds
- `zM` close all folds
- `zr` decreases the foldlevel by one
- `zm` increases the foldlevel by one
- `[z` move to start of open fold
- `]z` move to end of open fold
- `zf#j` creates a fold from the cursor down # lines
- `zf/string` creates a fold from the cursor to string
- `zE` delete all folds
- `zd` delete the fold at the cursor
- `zi` switch folding on or off
- `zj` move down to top of next fold
- `zk` move up to bottom of previous fold
- `zv` expand folds to reveal cursor

### comment-box.nvim

| Command        | Description                                                 | function                              |
| -------------- | ----------------------------------------------------------- | ------------------------------------- |
| `CBllbox[num]` | _Left aligned box of fixed size_ with _Left aligned text_   | `require("comment-box").llbox([num])` |
| `CBlcbox[num]` | _Left aligned box of fixed size_ with _Centered text_       | `require("comment-box").lcbox([num])` |
| `CBlrbox[num]` | _Left aligned box of fixed size_ with _Right aligned text_  | `require("comment-box").lrbox([num])` |
| `CBclbox[num]` | _Centered box of fixed size_ with _Left aligned text_       | `require("comment-box").lcbox([num])` |
| `CBccbox[num]` | _Centered box of fixed size_ with _Centered text_           | `require("comment-box").ccbox([num])` |
| `CBcrbox[num]` | _Centered box of fixed size_ with _Right aligned text_      | `require("comment-box").crbox([num])` |
| `CBrlbox[num]` | _Right aligned box of fixed size_ with _Left aligned text_  | `require("comment-box").rlbox([num])` |
| `CBrcbox[num]` | _Right aligned box of fixed size_ with _Centered text_      | `require("comment-box").rcbox([num])` |
| `CBrrbox[num]` | _Right aligned box of fixed size_ with _Right aligned text_ | `require("comment-box").rrbox([num])` |
| `CBalbox[num]` | _Left aligned adapted box_                                  | `require("comment-box").albox([num])` |
| `CBacbox[num]` | _Centered adapted box_                                      | `require("comment-box").acbox([num])` |
| `CBarbox[num]` | _Right aligned adapted box_                                 | `require("comment-box").arbox([num])` |

### vim-peekaboo

`"` or `@` in normal mode, `<CTRL-R>` in insert mode, toggle fullscreen by pressing `<space>`

### IndentWise

- `[-` : Move to _previous_ line of _lesser_ indent than the current line.
- `[+` : Move to _previous_ line of _greater_ indent than the current line.
- `[=` : Move to _previous_ line of _same_ indent as the current line that is separated from the current line by lines of different indents.
- `]-` : Move to _next_ line of _lesser_ indent than the current line.
- `]+` : Move to _next_ line of _greater_ indent than the current line.
- `]=` : Move to _next_ line of _same_ indent as the current line that is separated from the current line by lines of different indents.
- `{count}[_` : Move to _previous_ line with indent-level of `{count}`.
- `{count}]_` : Move to _next_ line with indent-level of `{count}`.

### vim-easy-align

single character, such as `<Space>`, `=`, `:`, `.`, `|`, `&`, `#`, and `,`.

#### =

- `=` Around the 1st occurrences
- `2=` Around the 2nd occurrences
- `*=` Around all occurrences
- `**=` Left/Right alternating alignment around all occurrences
- `<Enter>` Switching between left/right/center alignment modes

#### \<space\>

- `<Space>` Around the 1st occurrences of whitespaces
- `2<Space>` Around the 2nd occurrences
- `-<Space>` Around the last occurrences
- `<Enter><Enter>2<Space>` Center-alignment around the 2nd occurrences

#### , \<comma\>

- The predefined comma-rule places a comma right next to the preceding token without margin (`{'stick_to_left': 1, 'left_margin': 0}`)
- You can change it with `<Right>` arrow

### vim-sandwitch

- Add:
  Press `sa{motion/textobject}{addition}`.
  For example, a key sequence `saiw(` makes **foo** to **(foo)**.

- Delete:
  Press `sdb` or `sd{deletion}`.
  For example, key sequences `sdb` or `sd(` makes **(foo)** to **foo**.
  `sdb` searches a set of surrounding automatically.

- Replace:
  Press `srb{addition}` or `sr{deletion}{addition}`.
  For example, key sequences `srb"` or `sr("` makes **(foo)** to **"foo"**.
