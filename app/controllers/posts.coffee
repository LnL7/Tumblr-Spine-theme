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
				div class:'line', ->
					if date = post.date
						span "#{date.month} #{date.year}"

				if text = post.text
					b text.title
					p text.body

				if photo = post.photo
					img src: photo.url, style:'max-width:100%;'
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
		@navigate '/list'

	controllers:
		list: List

	routes:
		'/list': 'list'

	render: ->
		@html CK.render @view, @
		@append @list.render().el
		@

	view: ->
		div class:'page'

module.exports = Posts
