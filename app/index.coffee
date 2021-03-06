require 'lib/setup'

CK = require 'lib/coffeekup'
Spine = require 'spine'
Header = require 'controllers/header'
Footer = require 'controllers/footer'
Menus = require 'controllers/menus'
Posts = require 'controllers/posts'

class App extends Spine.Controller
	constructor: ->
		super
		@header = Header.init()
		@footer = Footer.init()
		@menus = Menus.init()
		@posts = Posts.init()

	render: ->
		@html CK.render @view, @
		@append @header.render().el
		@append @menus.render().el
		@append @posts.render().el
		@append @footer.render().el
		@

	view: ->
		div class:'page'

module.exports = App
