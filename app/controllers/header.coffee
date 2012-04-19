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
					img src: @blog.title_img, style:'width:100%;'
				else
					h1 @blog.title

				i @blog.description
				div class:'line', style:'margin-top:0'

module.exports = Header
