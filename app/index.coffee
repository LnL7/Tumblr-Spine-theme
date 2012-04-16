require 'lib/setup'

CK = require 'lib/coffeekup'
Spine = require 'spine'

class App extends Spine.Controller
	constructor: ->
		super

	render: ->
		@html CK.render @view, @
		@

	view: ->
		h1 'Loaded'

module.exports = App
