class Student
	attr_accessor :awards

	def initialize 
		@awards = []
	end

	def award badge
		define_method_for_has badge unless awards.include?(badge)
		awards << badge
	end	


	private

	def method_missing(method_sym)
		if method_sym.to_s.match(/^has_.+?\?$/)
			create_method method_sym, false
			self.send(method_sym)
		else
      		super
      	end
  	end

  	def define_method_for_has method_name
  		name = "has_#{method_name}?".to_sym
  		create_method name, true
  	end

  	def create_method(name, value)
  		self.class.send(:define_method, name) {value}
  	end
end