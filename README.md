## markdown-brunch 1.7.1

[<img src="https://david-dm.org/jupl/markdown-brunch.png"/>](https://david-dm.org/jupl/markdown-brunch)
[<img src="https://david-dm.org/jupl/markdown-brunch/dev-status.png"/>](https://david-dm.org/jupl/markdown-brunch#info=devDependencies)

Compiles Markdown files to HTML in [brunch](http://brunch.io) using [Marked](https://github.com/chjj/marked). [Highlight.js](http://softwaremaniacs.org/soft/highlight/en/) support is included for syntax highlighting. Plugin checks for files that have one of the following extensions:

- .markdown
- .mdown
- .mkdn
- .md
- .mkd
- .mdwn
- .mdtxt
- .mdtext
- .text

It is important to note that this will only generate the necessary HTML. It is up to you to apply any additional CSS themes to make it more presentable. Visit the [highlight.js test site](http://highlightjs.org/static/test.html) for a list of default themes by Highlight.js.

### Config
Marked's default configuration options can be overridden using config. For example:

```coffeescript
marked:
  gfm: false
  smartypants: true
```

### Syntax Highlighting
Code blocks by default do not get syntax highlighted.

    ```
    No syntax highlighting here.
    ```

If a Highlight-supported language is identified in a fenced code block, it will get syntax highlighted.

    ```javascript
    function add(x, y) {
      return x + y;
    }
    ```

You can also use the `auto` identifier to use Highlight's language auto-detect feature.

    ```auto
    * {
      box-sizing: border-box;
    }
    ```

For a list of supported languages, visit the [highlight.js test site](http://highlightjs.org/static/test.html).

## Usage
Add `"markdown-brunch": "x.y.z"` to `package.json` of your brunch app.

Pick a plugin version that corresponds to your minor (y) brunch version.

If you want to use git version of plugin, add
`"markdown-brunch": "git+ssh://git@github.com:jupl/markdown-brunch.git"`.
