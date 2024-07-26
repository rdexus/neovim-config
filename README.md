# Neovim config

This is my custom neovim config. The keymap below is outdated maybe I will update it sometime.

## Keymap

### General
| **Mode** | **Keymap**  | **Description**         |
|----------|-------------|-------------------------|
| v        | J           | Move selected line down |
| v        | K           | Move selected line up   |
| n        | leader+e    | Open explore            |
| n        | leader+zz   | Toggle ZenMode          |
| n        | leader+u    | Undotree                |
| n        | leader+bc   | Close buffer            |


### Lsp
| **Mode** | **Keymap**  | **Description**      |
|----------|-------------|----------------------|
| n        | gd          | Go to definition     |
| n        | gi          | Go to implementation |
| n        | K           | Hover documentation  |
| n        | leader+vws  | Workspace_symbol     |
| n        | leader+vd   | Open float           |
| n        | leader+vca  | Code action          |
| n        | leader+vrr  | References           |
| n        | leader+vrn  | Rename               |
| n        | leader+vf   | Format               |
| n        | leader+vds  | Document symbols     |
| i        | CTRL+h      | Signature help       |


### Telescope
| **Mode** | **Keymap**  | **Description**      |
|----------|-------------|----------------------|
| n        | leader+ff   | Find files           |
| n        | leader+fo   | Old files            |
| n        | leader+fg   | Live grep search     |
| n        | leader+fb   | Find in open buffers |
| n        | leader+fh   | Help tags            |
| n        | leader+ps   | Find word            |
| n        | leader+pws  | Find cword           |
| n        | leader+pWs  | Find cWORD           |


### Snippets
| **Mode** | **Keymap**  | **Description**                 |
|----------|-------------|---------------------------------|
| n        | leader+af   | Generate function documentation |
| n        | leader+at   | Generate type documentation     |
| i,s      | leader+;    | Jump to next snippet part       |
| i,s      | leader+,    | Jump to previous snippet part   |
| i,s      | CTRL+e      | Change choice                   |
