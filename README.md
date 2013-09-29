## markdown-brunch 1.7.0
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

Code blocks by default do not get syntax highlighted.

    ```
    No syntax highlighting here.
    ```

If a Hightlight-supported language is identified in the code block, it will get syntax highlighted.

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

It is important to note that this will only generate the necessary HTML. It is up to you to apply any additional CSS themes to make it more presentable.

## Usage
Add `"markdown-brunch": "x.y.z"` to `package.json` of your brunch app.

Pick a plugin version that corresponds to your minor (y) brunch version.

If you want to use git version of plugin, add
`"markdown-brunch": "git+ssh://git@github.com:jupl/markdown-brunch.git"`.