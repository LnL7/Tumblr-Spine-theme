CK = require 'lib/coffeekup'
Spine = require 'spine'
Post = require 'models/post'

class List extends Spine.Controller
	constructor: ->
		super
		@posts = Post.all()

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', ->
			for post in @posts
				a href:'#/show/' + post.id, id:'post', ->
					div class:'line', ->
						if date = post.date
							span "#{date.month} #{date.year}"

					if text = post.text
						b text.title
						p text.body

					if photo = post.photo
						img src: photo.url, style:'width:100%;'
						div style:'text-align:center;', -> i photo.caption

					if tags = post.tags
						div style:'margin-top:16px; text-align:right;', ->
							for tag in tags
								a class:'link', href: tag.url, ->
									span {style:'margin-left:8px;'}, tag.id

class Show extends Spine.Controller
	constructor: ->
		super
		@post = ->
			Post.find @params.id if @params?

	render: ->
		@html CK.render @view, @
		@

	view: ->
		div class:'page', ->
			if post = @post()
				a href:'#/', id:'post', ->
					div class:'line', ->
						if date = post.date
							span "#{date.month} #{date.year}"

					if text = post.text
						b text.title
						p text.body

					if photo = post.photo
						img src: photo.url, style:'width:100%;'
						div style:'text-align:center;', -> i photo.caption

					if tags = post.tags
						div style:'margin-top:16px; text-align:right;', ->
							for tag in tags
								a href: tag.url, ->
									span {style:'margin-left:8px;'}, tag.id

class Posts extends Spine.Stack
	constructor: ->
		super
		Spine.Route.setup()
		@navigate '/'

	controllers:
		list: List
		show: Show

	routes:
		'/': ->
			@list.active().render()

		'/show/:id': (params) ->
			@show.params = params
			@show.active().render()

	render: ->
		@html CK.render @view, @
		@append @list.render().el
		@append @show.render().el
		@

	view: ->
		div class:'page'

module.exports = Posts
