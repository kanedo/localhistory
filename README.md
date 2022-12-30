# localhistory

Record every command in a `.history` file.

To show the command history, use either `h` or `gh <search term>` (ie `grep h`).
You can also just look at the file itself as it is plain text.

It is recommended to ignore `.history` files in git via a global gitignore file:

```
echo ".history" >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore
```
