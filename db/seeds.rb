# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

def create_user(username, email, password, role, name)
	u = User.create_with(username: username, email: email, password: password, role: role).find_or_create_by(name: name)
end

puts 'Creating users'

create_user('flysnob', 'flysnob@gmail.com', 'bgt6yhbg', :user, 'flysnob')
create_user('mark', 'mlefferscpa@yahoo.com', 'bgt6yhbg', :user, 'mark')

puts 'Creating subjects'

subject_1 = Subject.find_or_create_by(name: 'Equity-Linked Contracts')
subject_2 = Subject.find_or_create_by(name: 'Freestanding Derivative Exceptions - Equity-Linked Contracts')
subject_3 = Subject.find_or_create_by(name: 'Stock Compensation')
subject_4 = Subject.find_or_create_by(name: 'Leases')
subject_5 = Subject.find_or_create_by(name: 'Distiguishing Liabilities and Equity')
subject_6 = Subject.find_or_create_by(name: 'Registration Payments Arrangement')
subject_7 = Subject.find_or_create_by(name: 'Definition of a Freestanding Derivative')
subject_8 = Subject.find_or_create_by(name: "Indexed to the Entity's Own Stock")
subject_9 = Subject.find_or_create_by(name: "Classified in Equity")
subject_10 = Subject.find_or_create_by(name: "Equity-Linked Contracts - Embedded Features")
subject_11 = Subject.find_or_create_by(name: "Definition of a Derivative - Embedded Feature")
subject_12 = Subject.find_or_create_by(name: "Conventional Convertible Debt")
subject_13 = Subject.find_or_create_by(name: "Beneficial Conversion Feature")

puts 'Creating versions'

version_1 = Version.find_or_create_by(subject: subject_1, module_code: '10', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_2 = Version.find_or_create_by(subject: subject_2, module_code: '12', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_3 = Version.find_or_create_by(subject: subject_3, module_code: '21', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_4 = Version.find_or_create_by(subject: subject_4, module_code: '24', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_5 = Version.find_or_create_by(subject: subject_5, module_code: '22', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_6 = Version.find_or_create_by(subject: subject_6, module_code: '15', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_7 = Version.find_or_create_by(subject: subject_7, module_code: '13', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_8 = Version.find_or_create_by(subject: subject_8, module_code: '25', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_9 = Version.find_or_create_by(subject: subject_9, module_code: '26', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_10 = Version.find_or_create_by(subject: subject_10, module_code: '11', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_11 = Version.find_or_create_by(subject: subject_11, module_code: '19', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_12 = Version.find_or_create_by(subject: subject_12, module_code: '17', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_13 = Version.find_or_create_by(subject: subject_13, module_code: '18', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')

puts 'Creating questions'

LoadQuestions.perform

puts 'Creating version nodes'

LoadVersionNodes.perform
