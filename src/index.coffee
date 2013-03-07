fs = require 'fs'
{markdown} = require 'markdown'

module.exports = class MarkdownCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'md'
  pattern: /(\.(markdown|mdown|mkdn|md|mkd|mdwn|mdtxt|mdtext|text))$/

  constructor: (@config) ->

  compile: (data, path, callback) ->
    try
      result = "module.exports = function() { return \"#{markdown.toHTML data}\"; };";
    catch err
      error = err
    finally
      callback error, result