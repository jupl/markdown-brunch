fs = require 'fs'
{markdown} = require 'markdown'

module.exports = class MarkdownCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'md'
  pattern: /(\.(markdown|mdown|mkdn|md|mkd|mdwn|mdtxt|mdtext|text))$/

  compile: (data, path, callback) ->
    try
      html = markdown.toHTML data
      result = "module.exports = function() { return #{JSON.stringify html}; };";
    catch err
      error = err
    finally
      callback error, result