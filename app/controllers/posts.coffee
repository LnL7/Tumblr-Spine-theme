CK = require 'lib/coffeekup'
Spine = require 'spine'

class List extends Spine.Controller
	constructor: ->
		super

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', ->
			h1 'List...'

class Posts extends Spine.Stack
	constructor: ->
		super
		Spine.Route.setup()
		@navigate '/list'

	controllers:
		list: List

	routes:
		'/list': 'list'

	render: ->
		@html CK.render @view, @
		@append @list.render().el
		@

	view: ->
		div class:'page'

module.exports = Posts
