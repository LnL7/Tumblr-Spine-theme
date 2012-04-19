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
			a href:'/#/', ->
				if @blog.header_img
					img src: @blog.header_img, style:'width:100%;'

				if @blog.title_img
					img src: @blog.title_img, style:'width:75%;'
				else
					h1 @blog.title

				div -> i @blog.description
				div class:'line'

module.exports = Header
