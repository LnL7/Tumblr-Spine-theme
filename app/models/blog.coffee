Spine = require 'spine'

class Blog extends Spine.Model
	@configure 'Blog', 'header_img', 'title_img', 'title', 'description', 'portrait', 'years', 'rss'
	
module.exports = Blog
