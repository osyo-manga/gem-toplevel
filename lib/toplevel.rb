require "toplevel/version"


module Toplevel
	module_function
	def local &block
		Module.new {
			refine Object do
				old_methods = instance_methods false
				class_eval &block
				new_methods = instance_methods false
				(new_methods - old_methods).each &method(:private)
			end
		}
	end
end
