require 'student'

describe Student do
	let(:student){Student.new}
	it "does not have an award" do 
		expect(student).not_to have_unixoid
	end
	
	it "can have badges awarded" do 
		student.award "unixoid"
		expect(student).to have_unixoid
	end
end