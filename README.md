# my-omz-custom-dir

## Setup Steps

* Install brew
* Install omz
* clone this
* install brew bundle
* execute custom sys-init
* Update .zshrc (select no theme, load omz)

## External Plugins

Install in OMZ/custom/plugins directory

* autoupdate
* clipboard
* fzf-tab
* zsh-completions
* fast-syntax-highlighting

## P10K prompt

Instant prompt is enabled via omz-load.zsh

### Fonts

Install Meslo Nerd Font. See powerlevel10k readme for details.

From: https://github.com/VSCodium/vscodium/blob/master/DOCS.md#extensions-marketplace

To enable Meslo font in terminal in VS code add to settings something like:
```
 "terminal.integrated.fontFamily": "MesloLGS NF"
```
### GPG and Keychain

Update ~/.gnupg/gpgagent.conf:

```
pinentry-program /opt/homebrew/bin/pinentry-mac
```


### <a id="howto-vscode-marketplace"></a>How to use the VS Code Marketplace

You can switch and use the VS Code marketplace by using the following solutions. However, note that [it is not clear whether this is legal](https://github.com/microsoft/vscode/issues/31168).

With the following environment variables:
- `VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'`
- `VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'`
- `VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'`
- `VSCODE_GALLERY_CONTROL_URL=''`
- `VSCODE_GALLERY_RECOMMENDATIONS_URL=''`

Or by creating a custom `product.json` at the following location:
- Windows: `%USER%\AppData\Roaming\VSCodium`
- macOS: `~/Library/Application Support/VSCodium`
- Linux: `~/.config/VSCodium`

with the content:

```json
{
  "extensionsGallery": {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items",
    "controlUrl": "",
    "recommendationsUrl": ""
  }
}
```

## .zprofile

Consider disable direnv logging. P10K's instant prompt will appreciate that

```
export DIRENV_LOG_FORMAT=""
```
Note that direnv logging can be enabled on a per directory basis
