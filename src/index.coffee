marked = require('marked')
hljs = require('highlight.js')
umd = require('umd-wrapper')

module.exports = class MarkdownCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'md'
  pattern: /(\.(markdown|mdown|mkdn|md|mkd|mdwn|mdtxt|mdtext|text))$/

  constructor: ->
    languages = Object.keys(hljs.LANGUAGES)
    marked.setOptions
      highlight: (code, lang) ->
        if lang is 'auto'
          hljs.highlightAuto(code).value
        else if languages.indexOf(lang) isnt -1
          hljs.highlight(lang, code).value

  compile: (data, path, callback) ->
    try
      result = umd(JSON.stringify(marked(data)))
    catch err
      error = err
    finally
      callback(error, result)