# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

{extname} = require 'path'

fileTypes =
  '.thtm': 'text.html.basic'
  '.tf': 'source.toml'

atom.workspace.observeTextEditors (editor) ->
  scopeName = fileTypes[extname editor.getPath()]
  g = atom.grammars.grammarForScopeName scopeName if scopeName?
  editor.setGrammar g if g?
