## markdown-brunch
Compiles Markdown files to HTML in [brunch](http://brunch.io) using [Marked](https://github.com/chjj/marked). Plugin checks for files that have one of the following extensions:

- .markdown
- .mdown
- .mkdn
- .md
- .mkd
- .mdwn
- .mdtxt
- .mdtext
- .text

It is important to note that this will only generate the necessary HTML. It is up to you to apply any additional CSS themes to make it more presentable.

## Usage
Add `"markdown-brunch": "x.y.z"` to `package.json` of your brunch app.

Pick a plugin version that corresponds to your minor (y) brunch version.

If you want to use git version of plugin, add
`"markdown-brunch": "git+ssh://git@github.com:jupl/markdown-brunch.git"`.