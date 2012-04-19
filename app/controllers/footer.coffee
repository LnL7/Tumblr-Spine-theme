CK = require 'lib/coffeekup'
Spine = require 'spine'
Blog = require 'models/blog'
Nav = require 'models/nav'

class Footer extends Spine.Controller
	constructor: ->
		super
		@blog = Blog.first()
		@nav = Nav.first()

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', style:'text-align:center;', ->
			div class:'line'
			if previous = @nav.previous
				a class:'link', href: previous, ->
					span class:'larr', '&larr;'

			img src: @blog.portrait, style:'max-width:16%;'
			if next = @nav.next
				a class:'link', href: next, ->
					span class:'rarr', '&rarr;'

module.exports = Footer
