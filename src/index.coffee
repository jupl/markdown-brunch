fs = require 'fs'
marked = require 'marked'

module.exports = class MarkdownCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'md'
  pattern: /(\.(markdown|mdown|mkdn|md|mkd|mdwn|mdtxt|mdtext|text))$/

  compile: (data, path, callback) ->
    try
      result = "module.exports = function() { return #{JSON.stringify marked(data)}; }";
    catch err
      error = err
    finally
      callback error, result