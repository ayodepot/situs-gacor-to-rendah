SitusGacorToRendahView = require './situs-gacor-to-rendah-view'
{CompositeDisposable} = require 'atom'

module.exports = SitusGacorToRendah =
  situsGacorToRendahView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @situsGacorToRendahView = new SitusGacorToRendahView(state.situsGacorToRendahViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @situsGacorToRendahView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'situs-gacor-to-rendah:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @situsGacorToRendahView.destroy()

  serialize: ->
    situsGacorToRendahViewState: @situsGacorToRendahView.serialize()

  toggle: ->
    console.log 'SitusGacorToRendah was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
