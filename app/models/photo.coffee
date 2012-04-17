Spine = require 'spine'

class Photo extends Spine.Model
	@configure 'Photo', 'url', 'link', 'caption'

module.exports = Photo
