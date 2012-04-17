require 'lib/setup'

CK = require 'lib/coffeekup'
Spine = require 'spine'
Posts = require 'controllers/posts'

class App extends Spine.Controller
	constructor: ->
		super
		@posts = Posts.init()

	render: ->
		@html @posts.render().el
		@

module.exports = App
