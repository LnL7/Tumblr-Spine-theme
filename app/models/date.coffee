Spine = require 'spine'

class Date extends Spine.Model
	@configure 'Date', 'timestamp', 'year', 'month', 'day'

module.exports = Date
