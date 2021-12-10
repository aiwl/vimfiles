My vim configuration for use on Windows *and* macOS (and hopefully other \*nix operating systems)

# Setup
1. Create a symbolic link to this folder.
- Windows
```
mklink /D %HOMEPATH%\vimfiles<path_to_repo/vimfiles>
```
- macOS
```
ln -s <path_to_repo/vimfiles> ~/.vim
```
2. Install plugins
* Open vim (ignore the initial errors) and type `:PlugInstall`

## Notes
-  Requires vim 7.4 or greater because we store the vim configuration file as `vimrc` (without the `.`) within the vim folder.
