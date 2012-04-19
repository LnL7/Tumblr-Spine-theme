require 'lib/setup'

CK = require 'lib/coffeekup'
Spine = require 'spine'
Header = require 'controllers/header'
Posts = require 'controllers/posts'

class App extends Spine.Controller
	constructor: ->
		super
		@header = Header.init()
		@posts = Posts.init()

	render: ->
		@html CK.render @view, @
		@append @header.render().el
		@append @posts.render().el
		@

	view: ->
		div class:'page'

module.exports = App
