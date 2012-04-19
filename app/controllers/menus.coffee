CK = require 'lib/coffeekup'
Spine = require 'spine'
Menu = require 'models/menu'

class Menus extends Spine.Controller
	constructor: ->
		super
		@menus = Menu.all()

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', ->
			div class:'line'
			div style:'text-align:center;', ->
				for menu in @menus
					a class:'link', href: menu.url, ->
						span {style:'margin-left:16px; margin-right:16px;'}, menu.name

module.exports = Menus
