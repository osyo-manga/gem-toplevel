require "toplevel/version"

module Toplevel
	module_function
	def local &block
		Module.new {
			refine Object, &block
		}
	end
end
