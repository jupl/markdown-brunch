Plugin = require('../src')
{document} = require('jsdom').jsdom().parentWindow

describe 'Plugin', ->

  beforeEach ->
    @plugin = new Plugin(paths: root: '.');

  it 'should be an object', ->
    expect(@plugin).to.be.ok

  it 'should have a #compile method', ->
    expect(@plugin.compile).to.be.an.instanceof(Function)

  it 'should compile and produce valid result', (done) ->
    content = """
      # Header 1
      ## Header 2
    """
    @plugin.compile content, 'template.md', (error, data) ->
      expect(error).not.to.be.ok
      container = document.createElement('div')
      container.innerHTML = eval(data)
      expect(container.querySelector('h1').textContent).to.equal('Header 1')
      expect(container.querySelector('h2').textContent).to.equal('Header 2')
      done()

  it 'should not by default syntax highlight code blocks', (done) ->
    content = """
      ```
      No syntax highlighting here.
      ```
    """
    @plugin.compile content, 'template.md', (error, data) ->
      expect(error).not.to.be.ok
      container = document.createElement('div')
      container.innerHTML = eval(data)
      expect(container.querySelector('code').innerHTML).to.equal('No syntax highlighting here.')
      done()

  it 'should not highlight unsupported code blocks', (done) ->
    content = """
      ```something
      something
      ```
    """
    @plugin.compile content, 'template.md', (error, data) ->
      expect(error).not.to.be.ok
      container = document.createElement('div')
      container.innerHTML = eval(data)
      expect(container.querySelector('code.lang-something').innerHTML).to.equal('something')
      done()

  it 'should highlight supported code blocks', (done) ->
    content = """
      ```javascript
      function add(x, y) {
        return x + y;
      }
      ```
    """
    @plugin.compile content, 'template.md', (error, data) ->
      expect(error).not.to.be.ok
      container = document.createElement('div')
      container.innerHTML = eval(data)
      expect(container.querySelector('code.lang-javascript .function .keyword').textContent).to.contain('function')
      expect(container.querySelector('code.lang-javascript .function .title').textContent).to.contain('add')
      expect(container.querySelector('code.lang-javascript .function .params').textContent).to.contain('(x, y)')
      expect(container.querySelector('code.lang-javascript > .keyword').textContent).to.contain('return')
      done()

  it 'should auto-highlight code blocks where mentioned', (done) ->
    content = """
      ```auto
      * {
        box-sizing: border-box;
      }
      ```
    """
    @plugin.compile content, 'template.md', (error, data) ->
      expect(error).not.to.be.ok
      container = document.createElement('div')
      container.innerHTML = eval(data)
      expect(container.querySelector('code.lang-auto .rules .rule .attribute').textContent).to.contain('box-sizing')
      expect(container.querySelector('code.lang-auto .rules .rule .value').textContent).to.contain('border-box')
      done()
