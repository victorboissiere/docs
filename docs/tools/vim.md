# Vim


Very good documentation → [vim tips and tricks: registers](https://www.cs.oberlin.edu/\~kuperman/help/vim/registers.html)


```
noremap ; l
noremap l k
noremap k j
noremap j h
```

## Clipboard

- `"*y` copy current line/selection to clipboard register

Use `:set paste` to avoid autoindent when pasting snippets.
Then revert back using `:set nopaste`.

## Registers

Very handy when you want to get back what you've --deleted--

- `:reg` to see all of them
- `"3p` to paste content to 3rd register

## Buffers

- `:ls` will show your open buffers
- `:b` <number> will open the specified buffer in the current pane.

## Search and replace

- `%s`: all lines
- `s`: current line onlye
- `a,bs`: line a to b (inclusive)
- `.,$s`: current line (.) to end
- `.,+ns`: current line (.) to n line below

[Check out more examples](http://vim.wikia.com/wiki/Search_and_replace)

## Autocompletion

- `C-n`: Display autocomplete

## Editing a stream

`:! find . | vim -`  in a shell get content and send it to vim then `:w filename` to save the file

## Git (Vim Fugitive)

- `Gdiff` view diff
- `Gstatus` view status:
    - `-` add/reset file
    - `Enter` view the file current window
    - `C` invoke `:Gcommit`
    - `C-p` and `C-n` to move between file
- `Gwrite` to stage current file
- `GBrowser` to view on Github
- `Glog` display all commit for current file
    - `\[q` previous
    - `\]q` next
    - Do not forget `:cw` for quick view
- `Glog --` display all commits
- `Ggrep finds`

[See complete list](https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt)

## Regex

[Regex cheatsheet](https://remram44.github.io/regex-cheatsheet/regex.html)
