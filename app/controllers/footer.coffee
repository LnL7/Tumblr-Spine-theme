CK = require 'lib/coffeekup'
Spine = require 'spine'
Blog = require 'models/blog'

class Footer extends Spine.Controller
	constructor: ->
		super
		@blog = Blog.first()

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', style:'text-align:center;', ->
			div class:'line'
			img src: @blog.portrait, style:'max-width:16%;'

module.exports = Footer
