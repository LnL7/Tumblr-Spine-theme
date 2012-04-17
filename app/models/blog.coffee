Spine = require 'spine'

class Blog extends Spine.Model
	@configure 'Blog', 'title', 'description', 'portrait', 'years', 'rss'
	
module.exports = Blog
