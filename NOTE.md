- COMMAND MODE:
    - -%!xxd -b : convert to hex
    - -%!xxd -r : change the hex part and call this to revert to text with the change.

    - -set ft=cpp : change file type for hightlighting
    - -windo diffthis : diff the 2 currently slit window

- INSERT MODE:
    - <C-u> - delete all the text has insert
    - <C-w> - delete the last insert word
    - <C-x><C-f> - auto complete file name (also <C-n> <C-p>)
    - <C-a> - insert the text last time inserted
    - <C-o> - execute normal mode command

- NORMAL MODE:
    - gf on a link will download that text and open it (need winget)
    - g<C-g> see which byte in the file
    - gq to format line break

    - zc - close fold 1 scope at the cursor
    - zo - open fold 1 scope at the cursor
    - zC - open fold to the base scope at the cursor
    - zr - open fold 1 scope of every function and class
    - zm - close fold 1 scope of every function and class 
    - zR - open fold to the base scope of every function and class 
    - zM - close fold to the base scope of every function and class 
    - zi - toggle fold
    > Note- fold can be copied as if a trunk of code

- NETRW:
    - use o, v, p, P, t in netrw to open file in difference mode. (no need the keymapping <leader>1)
    - vip select a paragraph text object

- PLUG-IN:
    - :Git blame - blame the people and show on the left



    - :map - see all map to command
        - nmap, imap, vmap - map in normal, insert, visual mode
    - :reg - see all content of register
    - :marks - see position of all marks
    - :history
