Spine = require 'spine'

class Nav extends Spine.Model
	@configure 'Nav', 'previous', 'next', 'current', 'count'
	
module.exports = Nav
