Spine = require 'spine'

class Text extends Spine.Model
	@configure 'Text', 'title', 'body'

module.exports = Text
