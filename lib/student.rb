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

  	def define_method_for_has something
  		name = "has_#{something}?".to_sym
  		create_method called: name, which_should_return: true
  	end

  	def create_method(called: name, which_should_return: true, and_call: "nothing")
  		self.class.send(:define_method, called) {which_should_return}
  		self.send(called) unless and_call == "nothing"
  	end

  	def method_missing(name)
	 	create_method called: name, which_should_return: false, and_call: "itself" if name.match(/^has_.+?\?$/)
      	super unless name.match(/^has_.+?\?$/)
  	end
end