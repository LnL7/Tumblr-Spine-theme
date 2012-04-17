CK = require 'lib/coffeekup'
Spine = require 'spine'

class List extends Spine.Controller
	constructor: ->
		super

	render: ->
		@html CK.render @view, @
		@

	view: ->
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
		@html ''
		@append @list.render().el
		@

module.exports = Posts
