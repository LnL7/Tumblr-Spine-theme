Spine = require 'spine'

class Post extends Spine.Model
	@configure 'Post', 'tags', 'date', 'text', 'photo', 'type', 'url'

module.exports = Post
