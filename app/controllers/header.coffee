CK = require 'lib/coffeekup'
Spine = require 'spine'
Blog = require 'models/blog'

class Header extends Spine.Controller
	constructor: ->
		super
		@blog = Blog.first()

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', style:'text-align:center;', ->
			h1 @blog.title
			i @blog.description
			div class:'line', style:'margin-top:0'

module.exports = Header
