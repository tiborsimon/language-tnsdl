describe "TNSDL grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-tnsdl")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.tnsdl")

  it "parses the grammar", ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.tnsdl"

  it "parses block comments", ->
    tokens = grammar.tokenizeLines('/* hello */')

    expect(tokens[0][0].value).toBe '/* hello */'
    expect(tokens[0][0].scopes).toEqual ['source.tnsdl', 'comment.block.tnsdl']
