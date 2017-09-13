# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

User.find_or_create_by(name: 'flysnob', email: 'flysnob@gmail.com')
User.find_or_create_by(name: 'mark', email: 'mlefferscpa@yahoo.com')

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

version_1.json = '[
{"question_code":"10-1","response_1":"Continue","target_1":"10-2","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-2","response_1":"Entire Agreement","target_1":"10-3","response_2":"Feature","target_2":"11-1","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-3","response_1":"Yes","target_1":"10-7","response_2":"No","target_2":"10-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-4","response_1":"Yes","target_1":"24-1","response_2":"No","target_2":"10-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-5","response_1":"Yes","target_1":"21-1","response_2":"No","target_2":"10-6","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"21","return":""},
{"question_code":"10-6","response_1":"Yes","target_1":"22-6","response_2":"No","target_2":"10-7","response_3":"Analyze","target_3":"22-1","return_node":"10-6","decision_node":"","fail_response":"","boolean":"","target_module":"22","return":""},
{"question_code":"10-7","response_1":"Yes","target_1":"10-8","response_2":"No","target_2":"10-9","response_3":"Analyze","target_3":"13-1","return_node":"10-7","decision_node":"","fail_response":"","boolean":"","target_module":"13","return":""},
{"question_code":"10-8","response_1":"Yes","target_1":"10-9","response_2":"No","target_2":"10-10","response_3":"Analyze","target_3":"12-1","return_node":"10-8","decision_node":"","fail_response":"","boolean":"","target_module":"12","return":""},
{"question_code":"10-9","response_1":"Yes","target_1":"10-18","response_2":"No","target_2":"10-19","response_3":"Analyze","target_3":"25-1","return_node":"10-9","decision_node":"","fail_response":"","boolean":"","target_module":"25","return":""},
{"question_code":"10-10","response_1":"Yes","target_1":"10-20","response_2":"No","target_2":"10-11","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-11","response_1":"Yes","target_1":"10-21","response_2":"No","target_2":"10-12","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-12","response_1":"Yes","target_1":"10-22","response_2":"No","target_2":"10-13","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-13","response_1":"Yes","target_1":"10-14","response_2":"No","target_2":"10-17","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-14","response_1":"Fixed","target_1":"10-23","response_2":"Amount and/or settlement date varies","target_2":"10-24","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-15","response_1":"Yes","target_1":"10-16","response_2":"No","target_2":"10-25","response_3":"Analyze","target_3":"26-1","return_node":"10-15","decision_node":"","fail_response":"","boolean":"","target_module":"26","return":""},
{"question_code":"10-16","response_1":"Yes","target_1":"10-26","response_2":"No","target_2":"10-27","response_3":"Analyze","target_3":"25-1","return_node":"10-16","decision_node":"","fail_response":"","boolean":"","target_module":"25","return":""},
{"question_code":"10-17","response_1":"Yes","target_1":"10-28","response_2":"No","target_2":"10-29","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-18","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-19","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-20","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-21","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-22","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-23","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-24","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-25","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-26","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-27","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-28","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"10-29","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_1.save

version_2.json = '[
{"question_code":"12-1","response_1":"Yes","target_1":"15-8","response_2":"No","target_2":"12-2","response_3":"Analyze","target_3":"15-1","return_node":"12-2","decision_node":"","fail_response":"","boolean":"","target_module":"15","return":""},
{"question_code":"12-2","response_1":"Yes","target_1":"","response_2":"No","target_2":"12-3","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-3","response_1":"Yes","target_1":"","response_2":"No","target_2":"12-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-4","response_1":"Yes","target_1":"","response_2":"No","target_2":"12-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-5","response_1":"Yes","target_1":"12-6","response_2":"No","target_2":"12-7","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-6","response_1":"Fixed","target_1":"","response_2":"Amount and/or settlement date varies","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-7","response_1":"Yes","target_1":"12-8","response_2":"No","target_2":"","response_3":"Analyze","target_3":"13-1","return_node":"12-8","decision_node":"","fail_response":"","boolean":"","target_module":"13","return":""},
{"question_code":"12-8","response_1":"Yes","target_1":"","response_2":"No","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-9","response_1":"Yes","target_1":"","response_2":"No","target_2":"","response_3":"Analyze","target_3":"17-1","return_node":"12-10","decision_node":"","fail_response":"","boolean":"","target_module":"17","return":""},
{"question_code":"12-10","response_1":"Yes","target_1":"","response_2":"No","target_2":"","response_3":"Analyze","target_3":"19-1","return_node":"12-11","decision_node":"","fail_response":"","boolean":"","target_module":"19","return":""},
{"question_code":"12-11","response_1":"Yes","target_1":"12-12","response_2":"No","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-12","response_1":"Yes","target_1":"12-13","response_2":"No","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-13","response_1":"Yes","target_1":"","response_2":"No","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-14","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-15","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-16","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-17","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"12-18","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_2.save

version_3.json = '[
{"question_code":"21-1","response_1":"Yes","target_1":"21-8","response_2":"No","target_2":"21-2","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-2","response_1":"Yes","target_1":"15-10","response_2":"No","target_2":"21-3","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-3","response_1":"Issuer","target_1":"21-4","response_2":"Provider of goods and/or services","target_2":"21-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-4","response_1":"Yes","target_1":"21-6","response_2":"No","target_2":"21-7","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-5","response_1":"Yes","target_1":"21-9","response_2":"No","target_2":"21-10","response_3":"Analyze","target_3":"13-1","return_node":"21-5","decision_node":"","fail_response":"","boolean":"","target_module":"13","return":""},
{"question_code":"21-6","response_1":"Yes","target_1":"21-11","response_2":"No","target_2":"21-12","response_3":"Analyze","target_3":"13-1","return_node":"21-6","decision_node":"","fail_response":"","boolean":"","target_module":"13","return":""},
{"question_code":"21-7","response_1":"Yes","target_1":"21-13","response_2":"No","target_2":"21-14","response_3":"Analyze","target_3":"13-1","return_node":"21-7","decision_node":"","fail_response":"","boolean":"","target_module":"13","return":""},
{"question_code":"21-8","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-9","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-10","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-11","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-12","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-13","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-14","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"21-15","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_3.save

version_4.json = '[
{"question_code":"24-1","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_4.save

version_5.json = '[
{"question_code":"22-1","response_1":"Yes","target_1":"22-6","response_2":"No","target_2":"22-2","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"22-2","response_1":"Yes","target_1":"22-6","response_2":"No","target_2":"22-3","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"22-3","response_1":"Yes","target_1":"22-6","response_2":"No","target_2":"22-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"22-4","response_1":"Yes","target_1":"22-6","response_2":"No","target_2":"22-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"22-5","response_1":"Yes","target_1":"22-6","response_2":"No","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":"true"},
{"question_code":"22-6","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_5.save

version_6.json = '[
{"question_code":"15-1","response_1":"Yes","target_1":"15-2","response_2":"No","target_2":"15-2","response_3":"","target_3":"","return_node":"","decision_node":"15-4","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"15-2","response_1":"Yes","target_1":"15-3","response_2":"No","target_2":"15-3","response_3":"","target_3":"","return_node":"","decision_node":"15-4","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"15-3","response_1":"Yes","target_1":"15-4","response_2":"No","target_2":"15-4","response_3":"","target_3":"","return_node":"","decision_node":"15-4","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"15-4","response_1":"Pass","target_1":"15-5","response_2":"Fail","target_2":"15-5","response_3":"","target_3":"","return_node":"","decision_node":"15-7","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"15-5","response_1":"Yes","target_1":"15-6","response_2":"No","target_2":"15-6","response_3":"","target_3":"","return_node":"","decision_node":"15-6","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"15-6","response_1":"Pass","target_1":"15-7","response_2":"Fail","target_2":"15-7","response_3":"","target_3":"","return_node":"","decision_node":"15-7","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"15-7","response_1":"Pass","target_1":"15-8","response_2":"Fail","target_2":"15-12","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"15-8","response_1":"Yes","target_1":"15-9","response_2":"No","target_2":"15-10","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"15-9","response_1":"Yes","target_1":"15-14","response_2":"No","target_2":"15-10","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"15-10","response_1":"Yes","target_1":"15-11","response_2":"No","target_2":"15-11","response_3":"","target_3":"","return_node":"","decision_node":"15-12","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"15-11","response_1":"Yes","target_1":"15-12","response_2":"No","target_2":"15-12","response_3":"","target_3":"","return_node":"","decision_node":"15-12","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"15-12","response_1":"Pass","target_1":"15-13","response_2":"Fail","target_2":"15-15","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"Fail","boolean":"or","target_module":"","return":"true"},
{"question_code":"15-13","response_1":"Yes","target_1":"15-16","response_2":"No","target_2":"15-17","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"15-14","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"15-15","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"15-16","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"15-17","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_6.save

version_7.json = '[
{"question_code":"13-1","response_1":"Yes","target_1":"13-8","response_2":"No","target_2":"13-8","response_3":"Analyze","target_3":"13-2","return_node":"","decision_node":"13-48","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-2","response_1":"Yes","target_1":"13-3","response_2":"No","target_2":"13-7","response_3":"","target_3":"","return_node":"","decision_node":"13-7","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-3","response_1":"Yes","target_1":"13-4","response_2":"No","target_2":"13-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-4","response_1":"Yes","target_1":"13-5","response_2":"No","target_2":"13-5","response_3":"","target_3":"","return_node":"","decision_node":"13-7","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-5","response_1":"Yes","target_1":"13-6","response_2":"No","target_2":"13-7","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-6","response_1":"Yes","target_1":"13-7","response_2":"No","target_2":"13-7","response_3":"","target_3":"","return_node":"","decision_node":"13-7","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-7","response_1":"Pass","target_1":"13-8","response_2":"Fail","target_2":"13-8","response_3":"","target_3":"","return_node":"","decision_node":"13-48","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"13-8","response_1":"Yes","target_1":"13-12","response_2":"No","target_2":"13-12","response_3":"Analyze","target_3":"13-9","return_node":"","decision_node":"13-48","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-9","response_1":"Yes","target_1":"13-10","response_2":"No","target_2":"13-10","response_3":"","target_3":"","return_node":"","decision_node":"13-11","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"13-10","response_1":"Yes","target_1":"13-11","response_2":"No","target_2":"13-11","response_3":"","target_3":"","return_node":"","decision_node":"13-11","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-11","response_1":"Pass","target_1":"13-12","response_2":"Fail","target_2":"13-12","response_3":"","target_3":"","return_node":"","decision_node":"13-48","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"13-12","response_1":"Yes","target_1":"13-48","response_2":"No","target_2":"13-48","response_3":"Analyze","target_3":"13-13","return_node":"","decision_node":"13-47","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-13","response_1":"Yes","target_1":"13-47","response_2":"No","target_2":"13-28","response_3":"Analyze","target_3":"13-14","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-14","response_1":"Yes","target_1":"13-15","response_2":"No","target_2":"13-15","response_3":"","target_3":"","return_node":"","decision_node":"13-27","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"13-15","response_1":"Yes","target_1":"13-27","response_2":"No","target_2":"13-16","response_3":"","target_3":"","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-16","response_1":"Yes","target_1":"13-17","response_2":"No","target_2":"13-17","response_3":"","target_3":"","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-17","response_1":"Yes","target_1":"13-18","response_2":"No","target_2":"13-19","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-18","response_1":"Yes","target_1":"13-19","response_2":"No","target_2":"13-19","response_3":"","target_3":"","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-19","response_1":"Yes","target_1":"13-20","response_2":"No","target_2":"13-21","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-20","response_1":"Yes","target_1":"13-21","response_2":"No","target_2":"13-21","response_3":"","target_3":"","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-21","response_1":"Yes","target_1":"13-22","response_2":"No","target_2":"13-23","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-22","response_1":"Yes","target_1":"13-23","response_2":"No","target_2":"13-23","response_3":"","target_3":"","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-23","response_1":"Yes","target_1":"13-24","response_2":"No","target_2":"13-27","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-24","response_1":"Yes","target_1":"13-25","response_2":"No","target_2":"13-27","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-25","response_1":"Yes","target_1":"13-26","response_2":"No","target_2":"13-26","response_3":"Not applicable","target_3":"13-26","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-26","response_1":"Yes","target_1":"13-27","response_2":"No","target_2":"13-27","response_3":"Not applicable","target_3":"13-27","return_node":"","decision_node":"13-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-27","response_1":"Pass","target_1":"13-47","response_2":"Fail","target_2":"13-28","response_3":"","target_3":"","return_node":"","decision_node":"13-47","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"13-28","response_1":"Yes","target_1":"13-47","response_2":"No","target_2":"13-35","response_3":"Analyze","target_3":"13-29","return_node":"","decision_node":"13-47","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-29","response_1":"Yes","target_1":"13-30","response_2":"No","target_2":"13-34","response_3":"","target_3":"","return_node":"","decision_node":"13-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-30","response_1":"Yes","target_1":"13-31","response_2":"No","target_2":"13-34","response_3":"","target_3":"","return_node":"","decision_node":"13-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-31","response_1":"Yes","target_1":"13-34","response_2":"No","target_2":"13-32","response_3":"","target_3":"","return_node":"","decision_node":"13-34","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"13-32","response_1":"Yes","target_1":"13-33","response_2":"No","target_2":"13-34","response_3":"","target_3":"","return_node":"","decision_node":"13-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-33","response_1":"Yes","target_1":"13-34","response_2":"No","target_2":"13-34","response_3":"","target_3":"","return_node":"","decision_node":"13-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-34","response_1":"Pass","target_1":"13-47","response_2":"Fail","target_2":"13-35","response_3":"","target_3":"","return_node":"","decision_node":"13-47","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"13-35","response_1":"Yes","target_1":"13-47","response_2":"No","target_2":"13-47","response_3":"Analyze","target_3":"13-36","return_node":"","decision_node":"13-47","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-36","response_1":"Yes","target_1":"13-37","response_2":"No","target_2":"13-41","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-37","response_1":"Yes","target_1":"13-38","response_2":"No","target_2":"13-46","response_3":"","target_3":"","return_node":"","decision_node":"13-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-38","response_1":"Yes","target_1":"13-39","response_2":"No","target_2":"13-42","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-39","response_1":"Yes","target_1":"13-40","response_2":"No","target_2":"13-42","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-40","response_1":"Yes","target_1":"13-42","response_2":"No","target_2":"13-46","response_3":"","target_3":"","return_node":"","decision_node":"13-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-41","response_1":"Yes","target_1":"13-42","response_2":"No","target_2":"13-44","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"13-42","response_1":"Yes","target_1":"13-43","response_2":"No","target_2":"13-46","response_3":"","target_3":"","return_node":"","decision_node":"13-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-43","response_1":"Yes","target_1":"13-46","response_2":"No","target_2":"13-46","response_3":"","target_3":"","return_node":"","decision_node":"13-46","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"13-44","response_1":"Yes","target_1":"13-45","response_2":"No","target_2":"13-46","response_3":"","target_3":"","return_node":"","decision_node":"13-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-45","response_1":"Yes","target_1":"13-46","response_2":"No","target_2":"13-46","response_3":"","target_3":"","return_node":"","decision_node":"13-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"13-46","response_1":"Pass","target_1":"13-47","response_2":"Fail","target_2":"13-47","response_3":"","target_3":"","return_node":"","decision_node":"13-47","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"13-47","response_1":"Pass","target_1":"13-48","response_2":"Fail","target_2":"13-48","response_3":"","target_3":"","return_node":"","decision_node":"13-48","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"13-48","response_1":"Pass","target_1":"","response_2":"Fail","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"Fail","boolean":"and","target_module":"","return":"true"}
]'
version_7.save

version_8.json = '[
{"question_code":"25-1","response_1":"Yes","target_1":"25-2","response_2":"No","target_2":"25-3","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"25-2","response_1":"Yes","target_1":"25-3","response_2":"No","target_2":"25-3","response_3":"","target_3":"","return_node":"","decision_node":"25-4","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"25-3","response_1":"Yes","target_1":"25-4","response_2":"No","target_2":"25-4","response_3":"","target_3":"","return_node":"","decision_node":"25-4","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"25-4","response_1":"Pass","target_1":"","response_2":"Fail","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"Fail","boolean":"and","target_module":"","return":"true"}
]'
version_8.save

version_9.json = '[
{"question_code":"26-1","response_1":"Yes","target_1":"26-18","response_2":"No","target_2":"26-2","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"26-2","response_1":"Yes","target_1":"26-9","response_2":"No","target_2":"26-3","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"26-3","response_1":"Yes","target_1":"26-4","response_2":"No","target_2":"26-6","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"26-4","response_1":"Yes","target_1":"26-17","response_2":"No","target_2":"26-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"26-5","response_1":"Yes","target_1":"26-6","response_2":"No","target_2":"26-17","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-6","response_1":"Yes","target_1":"26-7","response_2":"No","target_2":"26-9","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"26-7","response_1":"Yes","target_1":"26-8","response_2":"No","target_2":"26-17","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-8","response_1":"Yes","target_1":"26-9","response_2":"No","target_2":"26-9","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-9","response_1":"Yes","target_1":"26-10","response_2":"No","target_2":"26-10","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-10","response_1":"Yes","target_1":"26-11","response_2":"No","target_2":"26-11","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-11","response_1":"Yes","target_1":"26-12","response_2":"No","target_2":"26-12","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-12","response_1":"Yes","target_1":"26-13","response_2":"No","target_2":"26-13","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"26-13","response_1":"Yes","target_1":"26-14","response_2":"No","target_2":"26-14","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"26-14","response_1":"Yes","target_1":"26-15","response_2":"No","target_2":"26-15","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"26-15","response_1":"Yes","target_1":"26-16","response_2":"No","target_2":"26-16","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"26-16","response_1":"Yes","target_1":"26-17","response_2":"No","target_2":"26-17","response_3":"","target_3":"","return_node":"","decision_node":"26-17","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"26-17","response_1":"Pass","target_1":"","response_2":"Fail","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"26-18","fail_response":"Fail","boolean":"and","target_module":"","return":"true"},
{"question_code":"26-18","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_9.save

version_10.json = '[
{"question_code":"11-1","response_1":"Yes","target_1":"11-2","response_2":"No","target_2":"11-4","response_3":"Analyze","target_3":"17-1","return_node":"11-1","decision_node":"","fail_response":"","boolean":"","target_module":"17","return":""},
{"question_code":"11-2","response_1":"Yes","target_1":"11-3","response_2":"No","target_2":"11-13","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-3","response_1":"Yes","target_1":"11-14","response_2":"No","target_2":"11-15","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-4","response_1":"Yes","target_1":"11-6","response_2":"No","target_2":"11-16","response_3":"Analyze","target_3":"19-1","return_node":"11-4","decision_node":"","fail_response":"","boolean":"","target_module":"19","return":""},
{"question_code":"11-5","response_1":"Yes","target_1":"11-17","response_2":"No","target_2":"11-6","response_3":"Analyze","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-6","response_1":"Yes","target_1":"11-7","response_2":"No","target_2":"11-10","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-7","response_1":"Yes","target_1":"11-8","response_2":"No","target_2":"19-15","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-8","response_1":"Yes","target_1":"11-9","response_2":"No","target_2":"19-16","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-9","response_1":"Yes","target_1":"19-17","response_2":"No","target_2":"19-18","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-10","response_1":"Yes","target_1":"11-11","response_2":"No","target_2":"11-19","response_3":"Analyze","target_3":"26-1","return_node":"11-10","decision_node":"","fail_response":"","boolean":"","target_module":"26","return":""},
{"question_code":"11-11","response_1":"Yes","target_1":"11-20","response_2":"No","target_2":"11-19","response_3":"Analyze","target_3":"25-1","return_node":"11-11","decision_node":"","fail_response":"","boolean":"","target_module":"25","return":""},
{"question_code":"11-12","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-13","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-14","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-15","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-16","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-17","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-18","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-19","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"11-20","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_10.save

version_11.json = '[
{"question_code":"17-1","response_1":"Yes","target_1":"17-2","response_2":"No","target_2":"17-2","response_3":"","target_3":"","return_node":"","decision_node":"17-5","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"17-2","response_1":"Yes","target_1":"17-3","response_2":"No","target_2":"17-3","response_3":"","target_3":"","return_node":"","decision_node":"17-5","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"17-3","response_1":"Yes","target_1":"17-4","response_2":"No","target_2":"17-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"17-4","response_1":"Yes","target_1":"17-5","response_2":"No","target_2":"17-5","response_3":"","target_3":"","return_node":"","decision_node":"17-5","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"17-5","response_1":"Pass","target_1":"18-1","response_2":"Fail","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"Fail","boolean":"or","target_module":"","return":"true"}
]'
version_11.save

version_12.json = '[
{"question_code":"18-1","response_1":"Yes","target_1":"18-2","response_2":"No","target_2":"18-3","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"18-2","response_1":"Yes","target_1":"18-4","response_2":"No","target_2":"18-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":"true"},
{"question_code":"18-3","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"18-4","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"18-5","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_12.save

version_13.json = '[
{"question_code":"19-1","response_1":"Yes","target_1":"19-8","response_2":"No","target_2":"19-8","response_3":"Analyze","target_3":"19-2","return_node":"","decision_node":"19-48","fail_response":"No","boolean":"","target_module":"19","return":""},
{"question_code":"19-2","response_1":"Yes","target_1":"19-3","response_2":"No","target_2":"19-7","response_3":"","target_3":"","return_node":"","decision_node":"19-7","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-3","response_1":"Yes","target_1":"19-4","response_2":"No","target_2":"19-5","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-4","response_1":"Yes","target_1":"19-5","response_2":"No","target_2":"19-5","response_3":"","target_3":"","return_node":"","decision_node":"19-7","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-5","response_1":"Yes","target_1":"19-6","response_2":"No","target_2":"19-7","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-6","response_1":"Yes","target_1":"19-7","response_2":"No","target_2":"19-7","response_3":"","target_3":"","return_node":"","decision_node":"19-7","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-7","response_1":"Pass","target_1":"19-8","response_2":"Fail","target_2":"19-8","response_3":"","target_3":"","return_node":"","decision_node":"19-48","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"19-8","response_1":"Yes","target_1":"19-12","response_2":"No","target_2":"19-12","response_3":"Analyze","target_3":"19-9","return_node":"","decision_node":"19-48","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-9","response_1":"Yes","target_1":"19-10","response_2":"No","target_2":"19-10","response_3":"","target_3":"","return_node":"","decision_node":"19-11","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"19-10","response_1":"Yes","target_1":"19-11","response_2":"No","target_2":"19-11","response_3":"","target_3":"","return_node":"","decision_node":"19-11","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-11","response_1":"Pass","target_1":"19-12","response_2":"Fail","target_2":"19-12","response_3":"","target_3":"","return_node":"","decision_node":"19-48","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"19-12","response_1":"Yes","target_1":"19-48","response_2":"No","target_2":"19-48","response_3":"Analyze","target_3":"19-13","return_node":"","decision_node":"19-47","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-13","response_1":"Yes","target_1":"19-47","response_2":"No","target_2":"19-28","response_3":"Analyze","target_3":"19-14","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-14","response_1":"Yes","target_1":"19-15","response_2":"No","target_2":"19-15","response_3":"","target_3":"","return_node":"","decision_node":"19-27","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"19-15","response_1":"Yes","target_1":"19-27","response_2":"No","target_2":"19-16","response_3":"","target_3":"","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-16","response_1":"Yes","target_1":"19-17","response_2":"No","target_2":"19-17","response_3":"","target_3":"","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-17","response_1":"Yes","target_1":"19-18","response_2":"No","target_2":"19-19","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-18","response_1":"Yes","target_1":"19-19","response_2":"No","target_2":"19-19","response_3":"","target_3":"","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-19","response_1":"Yes","target_1":"19-20","response_2":"No","target_2":"19-21","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-20","response_1":"Yes","target_1":"19-21","response_2":"No","target_2":"19-21","response_3":"","target_3":"","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-21","response_1":"Yes","target_1":"19-22","response_2":"No","target_2":"19-23","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-22","response_1":"Yes","target_1":"19-23","response_2":"No","target_2":"19-23","response_3":"","target_3":"","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-23","response_1":"Yes","target_1":"19-24","response_2":"No","target_2":"19-27","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-24","response_1":"Yes","target_1":"19-25","response_2":"No","target_2":"19-27","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-25","response_1":"Yes","target_1":"19-26","response_2":"No","target_2":"19-26","response_3":"Not applicable","target_3":"19-26","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-26","response_1":"Yes","target_1":"19-27","response_2":"No","target_2":"19-27","response_3":"Not applicable","target_3":"19-27","return_node":"","decision_node":"19-27","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-27","response_1":"Pass","target_1":"19-47","response_2":"Fail","target_2":"19-28","response_3":"","target_3":"","return_node":"","decision_node":"19-47","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"19-28","response_1":"Yes","target_1":"19-47","response_2":"No","target_2":"19-35","response_3":"Analyze","target_3":"19-29","return_node":"","decision_node":"19-47","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-29","response_1":"Yes","target_1":"19-30","response_2":"No","target_2":"19-34","response_3":"","target_3":"","return_node":"","decision_node":"19-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-30","response_1":"Yes","target_1":"19-31","response_2":"No","target_2":"19-34","response_3":"","target_3":"","return_node":"","decision_node":"19-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-31","response_1":"Yes","target_1":"19-34","response_2":"No","target_2":"19-32","response_3":"","target_3":"","return_node":"","decision_node":"19-34","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"19-32","response_1":"Yes","target_1":"19-33","response_2":"No","target_2":"19-34","response_3":"","target_3":"","return_node":"","decision_node":"19-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-33","response_1":"Yes","target_1":"19-34","response_2":"No","target_2":"19-34","response_3":"","target_3":"","return_node":"","decision_node":"19-34","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-34","response_1":"Pass","target_1":"19-47","response_2":"Fail","target_2":"19-35","response_3":"","target_3":"","return_node":"","decision_node":"19-47","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"19-35","response_1":"Yes","target_1":"19-47","response_2":"No","target_2":"19-47","response_3":"Analyze","target_3":"19-36","return_node":"","decision_node":"19-47","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-36","response_1":"Yes","target_1":"19-37","response_2":"No","target_2":"19-41","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-37","response_1":"Yes","target_1":"19-38","response_2":"No","target_2":"19-46","response_3":"","target_3":"","return_node":"","decision_node":"19-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-38","response_1":"Yes","target_1":"19-39","response_2":"No","target_2":"19-42","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-39","response_1":"Yes","target_1":"19-40","response_2":"No","target_2":"19-42","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-40","response_1":"Yes","target_1":"19-42","response_2":"No","target_2":"19-46","response_3":"","target_3":"","return_node":"","decision_node":"19-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-41","response_1":"Yes","target_1":"19-42","response_2":"No","target_2":"19-44","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"19-42","response_1":"Yes","target_1":"19-43","response_2":"No","target_2":"19-46","response_3":"","target_3":"","return_node":"","decision_node":"19-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-43","response_1":"Yes","target_1":"19-46","response_2":"No","target_2":"19-46","response_3":"","target_3":"","return_node":"","decision_node":"19-46","fail_response":"Yes","boolean":"","target_module":"","return":""},
{"question_code":"19-44","response_1":"Yes","target_1":"19-45","response_2":"No","target_2":"19-46","response_3":"","target_3":"","return_node":"","decision_node":"19-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-45","response_1":"Yes","target_1":"19-46","response_2":"No","target_2":"19-46","response_3":"","target_3":"","return_node":"","decision_node":"19-46","fail_response":"No","boolean":"","target_module":"","return":""},
{"question_code":"19-46","response_1":"Pass","target_1":"19-47","response_2":"Fail","target_2":"19-47","response_3":"","target_3":"","return_node":"","decision_node":"19-47","fail_response":"Fail","boolean":"or","target_module":"","return":""},
{"question_code":"19-47","response_1":"Pass","target_1":"19-48","response_2":"Fail","target_2":"19-48","response_3":"","target_3":"","return_node":"","decision_node":"19-48","fail_response":"Fail","boolean":"and","target_module":"","return":""},
{"question_code":"10-1","response_1":"Continue","target_1":"10-2","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_13.save

questions_array = 
  [
    {question_code:"10-1", sort:"1", subject_id:"1", kind:"i", content:"Equity-linked transactions info node", module_code:"10"},
    {question_code:"10-2", sort:"2", subject_id:"1", kind:"q", content:"Are you analyzing the entire instrument (or two or more agreements as though they are a single instrument), or are you analyzing a feature or provision embedded within an agreement?", module_code:"10"},
    {question_code:"10-3", sort:"3", subject_id:"1", kind:"q", content:"Do you want to analyze the contract only with respect to derivative accounting guidance under ASC 815?", module_code:"10"},
    {question_code:"10-4", sort:"4", subject_id:"1", kind:"q", content:"Is this a lease agreement?", module_code:"10"},
    {question_code:"10-5", sort:"5", subject_id:"1", kind:"q", content:"Was this instrument issued as stock-based compensation?", module_code:"10"},
    {question_code:"10-6", sort:"6", subject_id:"1", kind:"q", content:"Does the instrument fall within the scope of ASC 480, Liabilities - Distinguishing Liabilities from Equity?", module_code:"10"},
    {question_code:"10-7", sort:"7", subject_id:"1", kind:"q", content:"Does the contract meet the accounting definition of a derivative?", module_code:"10"},
    {question_code:"10-8", sort:"8", subject_id:"1", kind:"q", content:"Are there any available exceptions that would preclude derivative accounting?", module_code:"10"},
    {question_code:"10-9", sort:"9", subject_id:"1", kind:"q", content:"Is the instrument indexed to the company's own stock?", module_code:"10"},
    {question_code:"10-10", sort:"10", subject_id:"1", kind:"q", content:"Is the contract for a business combination at a future date?", module_code:"10"},
    {question_code:"10-11", sort:"11", subject_id:"1", kind:"q", content:"Is the contract for an acquisition entered into by a not-for-profit organization?", module_code:"10"},
    {question_code:"10-12", sort:"12", subject_id:"1", kind:"q", content:"Is the contract for the merger of two or more not-for-profit organizations?", module_code:"10"},
    {question_code:"10-13", sort:"13", subject_id:"1", kind:"q", content:"Is the contract a forward contract that requires settlement by the company's delivery of cash in exchange for the purchase of a fixed number of its equity shares?", module_code:"10"},
    {question_code:"10-14", sort:"14", subject_id:"1", kind:"q", content:"Is the amount to be paid fixed or can the amount and/or settlement date vary?", module_code:"10"},
    {question_code:"10-15", sort:"15", subject_id:"1", kind:"q", content:"Classified in equity?", module_code:"10"},
    {question_code:"10-16", sort:"16", subject_id:"1", kind:"q", content:"Is the instrument indexed to the company's own stock?", module_code:"10"},
    {question_code:"10-17", sort:"17", subject_id:"1", kind:"q", content:"Does hedge accounting apply?", module_code:"10"},
    {question_code:"10-18", sort:"18", subject_id:"1", kind:"r", content:"Not a derivative and indexed to own stock", module_code:"10"},
    {question_code:"10-19", sort:"19", subject_id:"1", kind:"r", content:"Not a derivative and not indexed to own stock", module_code:"10"},
    {question_code:"10-20", sort:"20", subject_id:"1", kind:"r", content:"The contract to enter into a business combination at a future date is not subject to accounting as a derivative under ASC 815-20.  A more through treatment of business combinations will be undertaken by GAAP Logic in a future project.", module_code:"10"},
    {question_code:"10-21", sort:"21", subject_id:"1", kind:"r", content:"The contract to enter into an acquisition by a nonprofit organization at a future date is not subject to accounting as a derivative under ASC 815-20.  A more through treatment of business combinations will be undertaken by GAAP Logic in a future project.", module_code:"10"},
    {question_code:"10-22", sort:"22", subject_id:"1", kind:"r", content:"The contract to enter into a merger by a nonprofit organizations at a future date is not subject to accounting as a derivative under ASC 815-20.  A more through treatment of business combinations will be undertaken by GAAP Logic in a future project.", module_code:"10"},
    {question_code:"10-23", sort:"23", subject_id:"1", kind:"r", content:"Account for the contract in accordance with ASC 480­10­30­3 through 30­5, 480­10­35­3, and 480­10­45­3. A more through treatment of ASC 480 will be undertaken by GAAP Logic in a future project.", module_code:"10"},
    {question_code:"10-24", sort:"24", subject_id:"1", kind:"r", content:"Account for the contract in accordance with ASC 480­10­30­3 through 30­5, 480­10­35­3, and 480­10­45­3. A more through treatment of ASC 480 will be undertaken by GAAP Logic in a future project.", module_code:"10"},
    {question_code:"10-25", sort:"25", subject_id:"1", kind:"r", content:"Derivative, not classified in equity", module_code:"10"},
    {question_code:"10-26", sort:"26", subject_id:"1", kind:"r", content:"Derivative, classified in equity, indexed to own stock", module_code:"10"},
    {question_code:"10-27", sort:"27", subject_id:"1", kind:"r", content:"Derivative, classified in equity, not indexed to own stock", module_code:"10"},
    {question_code:"10-28", sort:"28", subject_id:"1", kind:"r", content:"Apply hedge accounting in accordance with ASC 815. A more through treatment of hedge accounting will be undertaken by GAAP Logic in a future project.", module_code:"10"},
    {question_code:"10-29", sort:"29", subject_id:"1", kind:"r", content:"Account for the contract as a freestanding derivative in accordance with ASC 815-20 recorded intially at fair value and subsequently remeasured at fair value. Any changes in fair value should be recoognized as gain or loss in income.", module_code:"10"},

    {question_code:"12-1", sort:"1", subject_id:"2", kind:"q", content:"Is the contract a registration payments arrangement?", module_code:"12"},
    {question_code:"12-2", sort:"2", subject_id:"2", kind:"q", content:"Is the contract for a business combination at a future date?", module_code:"12"},
    {question_code:"12-3", sort:"3", subject_id:"2", kind:"q", content:"Is the contract for an acquisition entered into by a non-for-profit organization?", module_code:"12"},
    {question_code:"12-4", sort:"4", subject_id:"2", kind:"q", content:"Is the contract for the merger of two or more not-for-profit organizations?", module_code:"12"},
    {question_code:"12-5", sort:"5", subject_id:"2", kind:"q", content:"Is the contract a forward contract that requires settlement by the company's delivery of cash in exchange for the purchase of a fixed number of its equity shares?", module_code:"12"},
    {question_code:"12-6", sort:"6", subject_id:"2", kind:"q", content:"Is the amount to be paid fixed or can the amount and/or settlement date vary?", module_code:"12"},
    {question_code:"12-7", sort:"7", subject_id:"2", kind:"q", content:"Does the contract meet the accounting definition of a derivative?", module_code:"12"},
    {question_code:"12-8", sort:"8", subject_id:"2", kind:"q", content:"Does hedge accounting apply?", module_code:"12"},
    {question_code:"12-9", sort:"9", subject_id:"2", kind:"q", content:"Is the host contract of the embedded feature being evaluated considered conventional convertible debt?", module_code:"12"},
    {question_code:"12-10", sort:"10", subject_id:"2", kind:"q", content:"Does the conversion feature meet the accounting definition of a derivative?", module_code:"12"},
    {question_code:"12-11", sort:"11", subject_id:"2", kind:"q", content:"Is the embedded feature a conversion option in a debt-host contract?", module_code:"12"},
    {question_code:"12-12", sort:"12", subject_id:"2", kind:"q", content:"Is there a beneficial conversion feature as of the date of issuance?", module_code:"12"},
    {question_code:"12-13", sort:"13", subject_id:"2", kind:"q", content:"Upon conversion may the entire convertible debt instrument be entirely or partially settled in cash or by transfer of some other asset?", module_code:"12"},
    {question_code:"12-14", sort:"14", subject_id:"2", kind:"r", content:"The lease contract should be accounted for under ASC 840, Leases. A more thorough treatment of ASC 840 will be undertaken by GAAP Logic in a future project. It is not uncommon, however, for a lease to contain one or more provisions that meet the accounting definition of a derivitive and require separate accounting as an embedded derivative. Since the lease is linked to the company's equity, those provisions should be specifically evaluated as an embedded derivative feature.", module_code:"12"},
    {question_code:"12-15", sort:"15", subject_id:"2", kind:"r", content:"Stock compensation paid to an employee should be accounted for in accordance eith ASC 718, Compensation--Stock Compensation", module_code:"12"},
    {question_code:"12-16", sort:"16", subject_id:"2", kind:"r", content:"Stock compensation paid to a nonemployee for goods and/or services becomes subject to evauluation under ASC 815-10 once performance has occurred. Since the equity-linked contract meets the accounting definition of a derivative, the contract should be accounted for as a freestanding derivative initially recorded at fair value and subsequently remeasured at fair value. Any changes in fair value should be recoognized as gain or loss in income.", module_code:"12"},
    {question_code:"12-17", sort:"17", subject_id:"2", kind:"r", content:"Stock compensation paid to a nonemployee for goods and/or services becomes subject to evauluation under ASC 815-10 once performance has occurred. However, since the equity-linked contract does not meet the accounting definition of a derivative, the contract should be recorded at fair value in accordance with ASC 505-50 and should not be subsequently remeasured.", module_code:"12"},
    {question_code:"12-18", sort:"18", subject_id:"2", kind:"r", content:"Stock compensation paid to a nonemployee for which the products and/or services have not been provided should be accounted for in accordance with ASC 505-50, Equity-Based Payments to Nonemployees.", module_code:"12"},

    {question_code:"21-1", sort:"1", subject_id:"3", kind:"q", content:"Was this instrument issued as stock-based compensation to, and for goods and/or services provided by, an employee?", module_code:"21"},
    {question_code:"21-2", sort:"2", subject_id:"3", kind:"q", content:"Was this instrument issued as stock-based compensation to, and for goods and/or services provided by, a nonemployee?", module_code:"21"},
    {question_code:"21-3", sort:"3", subject_id:"3", kind:"q", content:"Is the company the issuer or the provider of the goods and/or services?", module_code:"21"},
    {question_code:"21-4", sort:"4", subject_id:"3", kind:"q", content:"Have the goods and/or services of the non-employee already been provided?", module_code:"21"},
    {question_code:"21-5", sort:"5", subject_id:"3", kind:"q", content:"Does the equity-linked contract meet the accounting definition of a derivative?", module_code:"21"},
    {question_code:"21-6", sort:"6", subject_id:"3", kind:"q", content:"Does the equity-linked contract meet the accounting definition of a derivative?", module_code:"21"},
    {question_code:"21-7", sort:"7", subject_id:"3", kind:"q", content:"Does the equity-linked contract meet the accounting definition of a derivative?", module_code:"21"},
    {question_code:"21-8", sort:"8", subject_id:"3", kind:"r", content:"Stock compensation paid to an employee should be accounted for in accordance eith ASC 718, Compensation--Stock Compensation", module_code:"21"},
    {question_code:"21-9", sort:"9", subject_id:"3", kind:"r", content:"Since the equity-linked contract meets the accounting definition of a derivative, the contract should be accounted for as a freestanding derivative initially recorded at fair value and subsequently remeasured at fair value. Any changes in fair value should be recoognized as gain or loss in income.", module_code:"21"},
    {question_code:"21-10", sort:"10", subject_id:"3", kind:"r", content:"Since the equity-linked contract does not meet the accounting definition of a derivative, the contract should be recorded at fair value in accordance with ASC 505-50 and should not be subsequently remeasured.", module_code:"21"},
    {question_code:"21-11", sort:"11", subject_id:"3", kind:"r", content:"Since the equity-linked contract meets the accounting definition of a derivative, the contract should be accounted for as a freestanding derivative initially recorded at fair value and subsequently remeasured at fair value. Any changes in fair value should be recoognized as gain or loss in income.", module_code:"21"},
    {question_code:"21-12", sort:"12", subject_id:"3", kind:"r", content:"Since the equity-linked contract does not meet the accounting definition of a derivative, the contract should be recorded at fair value in accordance with ASC 505-50 and should not be subsequently remeasured.", module_code:"21"},
    {question_code:"21-13", sort:"13", subject_id:"3", kind:"r", content:"Stock compensation paid to a nonemployee for goods and/or services becomes subject to evauluation under ASC 815-10 once performance has occurred. Since the equity-linked contract meets the accounting definition of a derivative, the contract should be accounted for as a freestanding derivative initially recorded at fair value and subsequently remeasured at fair value. Any changes in fair value should be recoognized as gain or loss in income.", module_code:"21"},
    {question_code:"21-14", sort:"14", subject_id:"3", kind:"r", content:"Stock compensation paid to a nonemployee for goods and/or services becomes subject to evauluation under ASC 815-10 once performance has occurred. However, since the equity-linked contract does not meet the accounting definition of a derivative, the contract should be recorded at fair value in accordance with ASC 505-50 and should not be subsequently remeasured.", module_code:"21"},
    {question_code:"21-15", sort:"15", subject_id:"3", kind:"r", content:"Stock compensation paid to a nonemployee for which the products and/or services have not been provided should be accounted for in accordance with ASC 505-50, Equity-Based Payments to Nonemployees.", module_code:"21"},

    {question_code:"24-1", sort:"1", subject_id:"4", kind:"r", content:"The lease contract should be accounted for under ASC 840, Leases. A more thorough treatment of ASC 840 will be undertaken by GAAP Logic in a future project. It is not uncommon, however, for a lease to contain one or more provisions that meet the accounting definition of a derivitive and require separate accounting as an embedded derivative. Since the lease is linked to the company's equity, those provisions should be specifically evaluated as an embedded derivative feature.", module_code:"24"},















    {question_code:"22-1", sort:"1", subject_id:"5", kind:"q", content:"Is this a mandatorily redeemable financial instrument (e.g., mandatorily redeemable preferred stock)?", module_code:"22"},
    {question_code:"22-2", sort:"2", subject_id:"5", kind:"q", content:"Is this instrument an obligation to repurchase the companys shares for cash or by transferring some other asset to the counterparty?", module_code:"22"},
    {question_code:"22-3", sort:"3", subject_id:"5", kind:"q", content:"Is this an obligation to issue to the holder a variable number of shares based on a fixed monetary amount known at inception of the instrument?", module_code:"22"},
    {question_code:"22-4", sort:"4", subject_id:"5", kind:"q", content:"Is this an obligation to issue to the holder a variable number of shares based on variations on something other than the fair value of the entity's own stock?", module_code:"22"},
    {question_code:"22-5", sort:"5", subject_id:"5", kind:"q", content:"Is this an obligation to issue to the holder a variable number of shares based on variations inversely related to changes in the fair value of the entitys own stock?", module_code:"22"},
    {question_code:"22-6", sort:"6", subject_id:"5", kind:"r", content:"Account for the contract in accordance with ASC 480, Distingushing Liabilities from Equity. A more through treatment of ASC 480 will be undertaken by GAAP Logic in a future project.", module_code:"22"},

    {question_code:"15-1", sort:"1", subject_id:"6", kind:"q", content:"Does the contract require that the issuer file a registration statement for the resale of specified financial instruments and/or for the resale of equity shares of the financial instrument that are issuable upon exercise or conversion of specified financial instruments?", module_code:"15"},
    {question_code:"15-2", sort:"2", subject_id:"6", kind:"q", content:"Does the contract require that the registration statement be declared effective by the SEC within a specified time period?", module_code:"15"},
    {question_code:"15-3", sort:"3", subject_id:"6", kind:"q", content:"Does the contract require that the effectiveness of the registration statement be maintained a specified time period?", module_code:"15"},
    {question_code:"15-4", sort:"4", subject_id:"6", kind:"d", content:"Pass - Has at least one of the conditions", module_code:"15"},
    {question_code:"15-5", sort:"5", subject_id:"6", kind:"q", content:"Does the contract require the issuer to transfer consideration if the effectiveness of the registration statement is not declared or if the effectiveness of the registration statement is not maintained?", module_code:"15"},
    {question_code:"15-6", sort:"6", subject_id:"6", kind:"d", content:"Pass - Meets the condition", module_code:"15"},
    {question_code:"15-7", sort:"7", subject_id:"6", kind:"d", content:"Pass - Meets both conditions", module_code:"15"},
    {question_code:"15-8", sort:"8", subject_id:"6", kind:"q", content:"Is the insrument that is the subject of the registration payments arrangement convertible debt or convertible preferred stock?", module_code:"15"},
    {question_code:"15-9", sort:"9", subject_id:"6", kind:"q", content:"Is the form of consideration payable to the counterparty an adjustment to the conversion ratio?", module_code:"15"},
    {question_code:"15-10", sort:"10", subject_id:"6", kind:"q", content:"Is the consideration payable to the counterparty determined by reference to an observable market other than the market for the company's stock?", module_code:"15"},
    {question_code:"15-11", sort:"11", subject_id:"6", kind:"q", content:"Is the consideration payable to the counterparty determined by reference to an observable index?", module_code:"15"},
    {question_code:"15-12", sort:"12", subject_id:"6", kind:"d", content:"Pass - neither condition is present", module_code:"15"},
    {question_code:"15-13", sort:"13", subject_id:"6", kind:"q", content:"Does payment of consideration under the registration payments arrangement settle the instrument(s) subject to the arrangement?", module_code:"15"},
    {question_code:"15-14", sort:"14", subject_id:"6", kind:"r", content:"A convertible instrument with a contingently adjustable conversion ratio should be accounted for in accordance with ASC 470-20, Debt with Conversion and Other Options. A more through treatment of debt in general under ASC 470 will be undertaken by GAAP Logic in a future project.", module_code:"15"},
    {question_code:"15-15", sort:"15", subject_id:"6", kind:"r", content:"A registration payament arrangement whose payment is determined by reference to 1) am observable market other than the market for the company's stock and/or 2) an observable index should accounted for as a derivative in accordance with ASC 815-10. Record the contract initially at fair value and remeasure subsequently at fair value at each reporting date.  Any changes in fair value should be recoognized as gain or loss in income.", module_code:"15"},
    {question_code:"15-16", sort:"16", subject_id:"6", kind:"r", content:"A registration payment arrangement whose consideration payment settles the instrument(s) subject to the arrangement should be accounted for as a contingent liability.", module_code:"15"},
    {question_code:"15-17", sort:"17", subject_id:"6", kind:"r", content:"A registration payment arrangement should be accounted for in accordance with ASC 825-20--Registration Payment Arrangements.", module_code:"15"},

    {question_code:"13-1", sort:"1", subject_id:"7", kind:"q", content:"Is there 1) one or more underlyings, and 2) a notional amount, a payment provision, or both?", module_code:"13"},
    {question_code:"13-2", sort:"2", subject_id:"1", kind:"q", content:"Is there one or more underlyings?", module_code:"13"},
    {question_code:"13-3", sort:"3", subject_id:"1", kind:"q", content:"Is there a notional amount?", module_code:"13"},
    {question_code:"13-4", sort:"4", subject_id:"1", kind:"q", content:"Do the underlying (or one of the underlyings) and the notional amount interact to determine the amount of the settlement of the contract? ", module_code:"13"},
    {question_code:"13-5", sort:"5", subject_id:"1", kind:"q", content:"Is there a payment provision?", module_code:"13"},
    {question_code:"13-6", sort:"6", subject_id:"1", kind:"q", content:"Is the payment provision triggered by the underlying (or one or more of the underlyings)?", module_code:"13"},
    {question_code:"13-7", sort:"7", subject_id:"1", kind:"d", content:"Pass - Meets first condition", module_code:"13"},
    {question_code:"13-8", sort:"8", subject_id:"1", kind:"q", content:"Is there a low or no initial investment?", module_code:"13"},
    {question_code:"13-9", sort:"9", subject_id:"1", kind:"q", content:"Does the contract require a payment that is equal to the notional amount (plus a premium or minus a discount)?", module_code:"13"},
    {question_code:"13-10", sort:"10", subject_id:"1", kind:"q", content:"Is the contract's initial net investment less, by more than a nominal amount, than the initial investment that would be required to either buy the asset related to the underlying or incur the obligation related to the underlying?", module_code:"13"},
    {question_code:"13-11", sort:"11", subject_id:"1", kind:"d", content:"Pass - Meets second condition condition", module_code:"13"},
    {question_code:"13-12", sort:"12", subject_id:"1", kind:"q", content:"Is there net settlement either by the terms of the contract, through a market mechanism or by delivery of a derivative instrument or asset that is readily convertible to cash?", module_code:"13"},
    {question_code:"13-13", sort:"13", subject_id:"1", kind:"q", content:"Is there net settlement of the contract under its terms?", module_code:"13"},
    {question_code:"13-14", sort:"14", subject_id:"1", kind:"q", content:"Is either party to the contract required to deliver an asset that is associated with the underlying and that has a principal amount, stated amount, face value, number of shares, or other denomination that is equal to the notional amount (or the notional plus a premium or minus a discount)?", module_code:"13"},
    {question_code:"13-15", sort:"15", subject_id:"1", kind:"q", content:"Does the contract require or permit either or both parties to net share settle the contract?", module_code:"13"},
    {question_code:"13-16", sort:"16", subject_id:"1", kind:"q", content:"Does the contract contain a penalty for nonperformance based on changes in the price of the items that are the subject of the contract?", module_code:"13"},
    {question_code:"13-17", sort:"17", subject_id:"1", kind:"q", content:"Does the contract contain an incremental fixed penalty or fixed amount per unit?", module_code:"13"},
    {question_code:"13-18", sort:"18", subject_id:"1", kind:"q", content:"Is the amount of the fixed penalty considered significant enough at all times during the term of the contract to make the possibility of nonperformance remote?", module_code:"13"},
    {question_code:"13-19", sort:"19", subject_id:"1", kind:"q", content:"Does the contract provide for a structured payout over time of gain or loss resulting from the contract?", module_code:"13"},
    {question_code:"13-20", sort:"20", subject_id:"1", kind:"q", content:"Is the fair value of the cash flows to received (or paid) by the holder under the structured payout approximately equal to the amount that would have been received (or paid) under immediate payout?", module_code:"13"},
    {question_code:"13-21", sort:"21", subject_id:"1", kind:"q", content:"Does the contract require additional investing or borrowing to obtain the benefits pf the contract's gain?", module_code:"13"},
    {question_code:"13-22", sort:"22", subject_id:"1", kind:"q", content:"Is the additional investing or borrowing a nontraditional adjustment of the yield on the amount invested or the interest element on the amount borrowed?", module_code:"13"},
    {question_code:"13-23", sort:"23", subject_id:"1", kind:"q", content:"Is the contract a debt instrument?", module_code:"13"},
    {question_code:"13-24", sort:"24", subject_id:"1", kind:"q", content:"Does the contract contain an embedded put or call option?", module_code:"13"},
    {question_code:"13-25", sort:"25", subject_id:"1", kind:"q", content:"If a call option, is the holder the debtor?", module_code:"13"},
    {question_code:"13-26", sort:"26", subject_id:"1", kind:"q", content:"If a put option, is the issuer the debtor?", module_code:"13"},
    {question_code:"13-27", sort:"27", subject_id:"1", kind:"d", content:"Pass - meets conditions for net settlement by terms of the contract", module_code:"13"},
    {question_code:"13-28", sort:"28", subject_id:"1", kind:"q", content:"Is there net settlement available by means of a market mechanism?", module_code:"13"},
    {question_code:"13-29", sort:"29", subject_id:"1", kind:"q", content:"Is there a means for one or both parties to liquidate its net position through a net payment?", module_code:"13"},
    {question_code:"13-30", sort:"30", subject_id:"1", kind:"q", content:"Does liquidating the net position result in that party being fully relieved of it rights and obligations under the contract?", module_code:"13"},
    {question_code:"13-31", sort:"31", subject_id:"1", kind:"q", content:"Does liquidation of the net position require significant transaction costs?", module_code:"13"},
    {question_code:"13-32", sort:"32", subject_id:"1", kind:"q", content:"Does liquidation of the net position occur without significant negotiation and due diligence?", module_code:"13"},
    {question_code:"13-33", sort:"33", subject_id:"1", kind:"q", content:"Does liquidation of the net position occur within a time frame that is considered customary for this type of contract?", module_code:"13"},
    {question_code:"13-34", sort:"34", subject_id:"1", kind:"d", content:"Pass - meets conditions for net settlement through market mechanism", module_code:"13"},
    {question_code:"13-35", sort:"35", subject_id:"1", kind:"q", content:"Is there net settlement by delivery of a derivative instrument or by delivery of an asset that is readily convertible to cash?", module_code:"13"},
    {question_code:"13-36", sort:"36", subject_id:"1", kind:"q", content:"Is the contract a stock purchase warrants or stock purchase option?", module_code:"13"},
    {question_code:"13-37", sort:"37", subject_id:"1", kind:"q", content:"Is the stock underlying the warrant (or option) publicly traded?", module_code:"13"},
    {question_code:"13-38", sort:"38", subject_id:"1", kind:"q", content:"Is the  warrant (or option) only for shares of the issuer (or that of its consolidated subsidieries?", module_code:"13"},
    {question_code:"13-39", sort:"39", subject_id:"1", kind:"q", content:"Is sale or transfer of the shares issuable upon exercise restricted for a period of 32 days or more from the date of exercise?", module_code:"13"},
    {question_code:"13-40", sort:"40", subject_id:"1", kind:"q", content:"Does the holder have the power, contractually or by other means, to cause the restriction to be met within 31 days of the date of exercise?", module_code:"13"},
    {question_code:"13-41", sort:"41", subject_id:"1", kind:"q", content:"Is the asset underlying the contract publicly traded stock?", module_code:"13"},
    {question_code:"13-42", sort:"42", subject_id:"1", kind:"q", content:"Can the active market rapidaly absorb the quantity of stock to be received upon exercise without significantly affecting the price?", module_code:"13"},
    {question_code:"13-43", sort:"43", subject_id:"1", kind:"q", content:"Are the estimated costs to convert the stock to cash considered to be significant?", module_code:"13"},
    {question_code:"13-44", sort:"44", subject_id:"1", kind:"q", content:"Is the asset deliverable upon settlement of the contract readily convertible to cash?", module_code:"13"},
    {question_code:"13-45", sort:"45", subject_id:"1", kind:"q", content:"Is the amount of cash that would be received from sale of the asset on an active market, net of transaction costs, approximately equal to what the entity would have received under a net settlement provision?", module_code:"13"},
    {question_code:"13-46", sort:"46", subject_id:"1", kind:"d", content:"Pass - meets conditions for net settlement by readily convertible to cash", module_code:"13"},
    {question_code:"13-47", sort:"47", subject_id:"1", kind:"d", content:"Pass - meets third condition", module_code:"13"},
    {question_code:"13-48", sort:"48", subject_id:"1", kind:"d", content:"Pass - Meets definition of a derivative", module_code:"13"},

    {question_code:"25-1", sort:"1", subject_id:"8", kind:"q", content:"Is the instrument's exercise contingent?", module_code:"25"},
    {question_code:"25-2", sort:"2", subject_id:"8", kind:"q", content:"Is the contingency based on a) an observable market, other than the market for the issuer's stock, or b) an observable index, other than one measured solely by reference to the issuer''s own operations?", module_code:"25"},
    {question_code:"25-3", sort:"3", subject_id:"8", kind:"q", content:"Is the settlement amount equal to the difference between the fair value of a fixed number of the entity's shares and a) a fixed monetary amount or b) a fixed amount of debt issued by the entity?", module_code:"25"},
    {question_code:"25-4", sort:"4", subject_id:"8", kind:"d", content:"Pass - indexed to own stock", module_code:"25"},

    {question_code:"26-1", sort:"1", subject_id:"9", kind:"q", content:"Does the contract require net cash settlement?", module_code:"26"},
    {question_code:"26-2", sort:"2", subject_id:"9", kind:"q", content:"Does the contract require physical settlement or net share settlement?", module_code:"26"},
    {question_code:"26-3", sort:"3", subject_id:"9", kind:"q", content:"Does the contract provide the counterparty with the choice of net cash settlement or settlement in shares?", module_code:"26"},
    {question_code:"26-4", sort:"4", subject_id:"9", kind:"q", content:"Is the economic value of the share settlement alternative greater than that of the net cash settlement alternative, or is the cash settlement alternative fixed or does it contain a cap or floor?", module_code:"26"},
    {question_code:"26-5", sort:"5", subject_id:"9", kind:"q", content:"Does the substance of the transaction in any way overcome the assumption of net cash settlement when the counterparty has the choice of net cash settlement or share settlement?", module_code:"26"},
    {question_code:"26-6", sort:"6", subject_id:"9", kind:"q", content:"Does the contract provide the company with the choice of net cash settlement or settlement in shares?", module_code:"26"},
    {question_code:"26-7", sort:"7", subject_id:"9", kind:"q", content:"Is the economic value of the share settlement alternative greater than that of the cash settlement alternative, or is the cash settlement alternative fixed or does it contain a cap or floor?", module_code:"26"},
    {question_code:"26-8", sort:"8", subject_id:"9", kind:"q", content:"Does the substance of the transaction in any way overcome the assumption of share settlement when the entity has the choice of net cash settlement or share settlement?", module_code:"26"},
    {question_code:"26-9", sort:"9", subject_id:"9", kind:"q", content:"Does the contract permit the entity to settle in unregistered shares?", module_code:"26"},
    {question_code:"26-10", sort:"10", subject_id:"9", kind:"q", content:"Does the entity have sufficient authorized and unissued shares available to settle the contract after considering all other commitments that may require the issuance of stock during the maximum period the derivative contract could remain outstanding?", module_code:"26"},
    {question_code:"26-11", sort:"11", subject_id:"9", kind:"q", content:"Does the contract contain an explicit limit on the number of shares to be delivered in a share settlement?", module_code:"26"},
    {question_code:"26-12", sort:"12", subject_id:"9", kind:"q", content:"Are there any required cash payments to the counterparty in the event the company fails to make timely filings with the SEC?", module_code:"26"},
    {question_code:"26-13", sort:"13", subject_id:"9", kind:"q", content:"Are there any required cash payments to the counterparty if the shares initially delivered upon settlement are subsequently sold by the counterparty and the sales proceeds are insufficient to provide the counterparty with full return of the amount due?", module_code:"26"},
    {question_code:"26-14", sort:"14", subject_id:"9", kind:"q", content:"If the contract provides for net-cash settlement, is net-cash settlement required only in specific circumstances in which holders of shares underlying the contract also would receive cash in exchange for their shares?", module_code:"26"},
    {question_code:"26-15", sort:"15", subject_id:"9", kind:"q", content:"Are there any provisions in the contract that indicate that the counterparty has rights that rank higher than those of a shareholder of the stock underlying the contract?", module_code:"26"},
    {question_code:"26-16", sort:"16", subject_id:"9", kind:"q", content:"Is there a requirement in the contract to post collateral at any point or for any reason?", module_code:"26"},
    {question_code:"26-17", sort:"17", subject_id:"9", kind:"d", content:"Pass - meets criteria for classified in equity", module_code:"26"},
    {question_code:"26-18", sort:"18", subject_id:"9", kind:"r", content:"A derivative contract linked to the company's own stock that requires net cash settlement should not be classified in equity. Recognize the contract as a freestanding derivative recorded intially at fair value and subsequently remeasured at fair value. Any changes in fair value should be recoognized as gain or loss in income.", module_code:"26"},

    {question_code:"11-1", sort:"1", subject_id:"10", kind:"q", content:"Is the host contract of the embedded feature being evaluated considered conventional convertible debt?", module_code:"11"},
    {question_code:"11-2", sort:"2", subject_id:"10", kind:"q", content:"Is there a beneficial conversion feature as of the date of issuance?", module_code:"11"},
    {question_code:"11-3", sort:"3", subject_id:"10", kind:"q", content:"Upon conversion may the entire convertible debt instrument be entirely or partially settled in cash or by transfer of some other asset?", module_code:"11"},
    {question_code:"11-4", sort:"4", subject_id:"10", kind:"q", content:"Does the contract meet the accounting definition of a derivative?", module_code:"11"},
    {question_code:"11-5", sort:"5", subject_id:"10", kind:"q", content:"Are there exceptions?", module_code:"11"},
    {question_code:"11-6", sort:"6", subject_id:"10", kind:"q", content:"Are the economic risks and characteristics of the embedded feature clearly and closely related to the economic risks and characteristics of the host contract?", module_code:"11"},
    {question_code:"11-7", sort:"7", subject_id:"10", kind:"q", content:"Is the embedded feature a conversion option in a debt-host contract?", module_code:"11"},
    {question_code:"11-8", sort:"8", subject_id:"10", kind:"q", content:"Is there a beneficial conversion feature as of the date of issuance?", module_code:"11"},
    {question_code:"11-9", sort:"9", subject_id:"10", kind:"q", content:"Upon conversion may the entire convertible debt instrument be entirely or partially settled in cash or by transfer of some other asset?", module_code:"11"},
    {question_code:"11-10", sort:"10", subject_id:"10", kind:"q", content:"Classified in equity?", module_code:"11"},
    {question_code:"11-11", sort:"11", subject_id:"10", kind:"q", content:"Is the instrument indexed to the company's own stock?", module_code:"11"},
    {question_code:"11-12", sort:"12", subject_id:"10", kind:"r", content:"The embedded feature does not meet the accounting definition of a derivative. Do no bifurcate the embedded feature for accounting purposes.", module_code:"11"},
    {question_code:"11-13", sort:"13", subject_id:"10", kind:"r", content:"Account for the instrument as conventional debt. A more through treatment of debt will be undertaken by GAAP Logic in a future project.", module_code:"11"},
    {question_code:"11-14", sort:"14", subject_id:"10", kind:"r", content:"Account for the liability and equity components separately in accordance with the Cash Conversion subsections ASC 470-20. A more through treatment of debt will be undertaken by GAAP Logic in a future project.", module_code:"11"},
    {question_code:"11-15", sort:"15", subject_id:"10", kind:"r", content:"Account for the debt and the beneficial conversion feature separately in accordance with ASC 470-20. A more through treatment of debt will be undertaken by GAAP Logic in a future project.", module_code:"11"},
    {question_code:"11-16", sort:"16", subject_id:"10", kind:"r", content:"The embedded feature does not meet the accounting definition of a derivative. Do no bifurcate the embedded feature for accounting purposes.", module_code:"11"},
    {question_code:"11-17", sort:"17", subject_id:"10", kind:"r", content:"Meets definition of a derivative but there are available exceptions", module_code:"11"},
    {question_code:"11-18", sort:"18", subject_id:"10", kind:"r", content:"Meets definition of a derivative, not indexed to own stock", module_code:"11"},
    {question_code:"11-19", sort:"19", subject_id:"10", kind:"r", content:"Meets definition of a derivative, indexed to own stock, not classified in equity", module_code:"11"},
    {question_code:"11-20", sort:"20", subject_id:"10", kind:"r", content:"Meets definition of a derivative, indexed to own stock, classified in equity", module_code:"11"},

    {question_code:"17-1", sort:"1", subject_id:"12", kind:"q", content:"Does the conversion provision provide the holder the option to convert into only a fixed number of shares or the equivalent amount of cash (at the discretion of the issuer)?", module_code:"17"},
    {question_code:"17-2", sort:"2", subject_id:"12", kind:"q", content:"Is the ability to exercise the option based solely on the passage of time or a contingent event?", module_code:"17"},
    {question_code:"17-3", sort:"3", subject_id:"12", kind:"q", content:"Does the conversion provision include adjustments to the number of shares issuable upon conversion?", module_code:"17"},
    {question_code:"17-4", sort:"4", subject_id:"12", kind:"q", content:"Are the adjustments solely standard antidilution provisions?", module_code:"17"},
    {question_code:"17-5", sort:"5", subject_id:"12", kind:"d", content:"Pass - meets definition of conventional convertible debt", module_code:"17"},

    {question_code:"18-1", sort:"1", subject_id:"13", kind:"q", content:"Is there a beneficial conversion feature as of the date of issuance?", module_code:"18"},
    {question_code:"18-2", sort:"2", subject_id:"13", kind:"q", content:"Upon conversion may the entire convertible debt instrument be entirely or partially settled in cash or by transfer of some other asset?", module_code:"18"},
    {question_code:"18-3", sort:"3", subject_id:"13", kind:"r", content:"Account for the instrument as conventional debt. A more through treatment of debt will be undertaken by GAAP Logic in a future project.", module_code:"18"},
    {question_code:"18-4", sort:"4", subject_id:"13", kind:"r", content:"Account for the liability and equity components separately in accordance with the Cash Conversion subsections ASC 470-20. A more through treatment of debt will be undertaken by GAAP Logic in a future project.", module_code:"18"},
    {question_code:"18-5", sort:"5", subject_id:"13", kind:"r", content:"Account for the debt and the beneficial conversion feature separately in accordance with ASC 470-20. A more through treatment of debt will be undertaken by GAAP Logic in a future project.", module_code:"18"},

    {question_code:"19-1", sort:"1", subject_id:"11", kind:"q", content:"Is there 1) one or more underlyings, and 2) a notional amount, a payment provision, or both?", module_code:"19"},
    {question_code:"19-2", sort:"2", subject_id:"11", kind:"q", content:"Is there one or more underlyings?", module_code:"19"},
    {question_code:"19-3", sort:"3", subject_id:"11", kind:"q", content:"Is there a notional amount?", module_code:"19"},
    {question_code:"19-4", sort:"4", subject_id:"11", kind:"q", content:"Do the underlying (or one of the underlyings) and the notional amount interact to determine the amount of the settlement of the contract? ", module_code:"19"},
    {question_code:"19-5", sort:"5", subject_id:"11", kind:"q", content:"Is there a payment provision?", module_code:"19"},
    {question_code:"19-6", sort:"6", subject_id:"11", kind:"q", content:"Is the payment provision triggered by the underlying (or one or more of the underlyings)?", module_code:"19"},
    {question_code:"19-7", sort:"7", subject_id:"11", kind:"d", content:"Pass - Meets first condition", module_code:"19"},
    {question_code:"19-8", sort:"8", subject_id:"11", kind:"q", content:"Is there a low or no initial investment?", module_code:"19"},
    {question_code:"19-9", sort:"9", subject_id:"11", kind:"q", content:"Does the contract require a payment that is equal to the notional amount (plus a premium or minus a discount)?", module_code:"19"},
    {question_code:"19-10", sort:"10", subject_id:"11", kind:"q", content:"Is the contract's initial net investment less, by more than a nominal amount, than the initial investment that would be required to either buy the asset related to the underlying or incur the obligation related to the underlying?", module_code:"19"},
    {question_code:"19-11", sort:"11", subject_id:"11", kind:"d", content:"Pass - Meets second condition condition", module_code:"19"},
    {question_code:"19-12", sort:"12", subject_id:"11", kind:"q", content:"Is there net settlement either by the terms of the contract, through a market mechanism or by delivery of a derivative instrument or asset that is readily convertible to cash?", module_code:"19"},
    {question_code:"19-13", sort:"13", subject_id:"11", kind:"q", content:"Is there net settlement of the contract under its terms?", module_code:"19"},
    {question_code:"19-14", sort:"14", subject_id:"11", kind:"q", content:"Is either party to the contract required to deliver an asset that is associated with the underlying and that has a principal amount, stated amount, face value, number of shares, or other denomination that is equal to the notional amount (or the notional plus a premium or minus a discount)?", module_code:"19"},
    {question_code:"19-15", sort:"15", subject_id:"11", kind:"q", content:"Does the contract require or permit either or both parties to net share settle the contract?", module_code:"19"},
    {question_code:"19-16", sort:"16", subject_id:"11", kind:"q", content:"Does the contract contain a penalty for nonperformance based on changes in the price of the items that are the subject of the contract?", module_code:"19"},
    {question_code:"19-17", sort:"17", subject_id:"11", kind:"q", content:"Does the contract contain an incremental fixed penalty or fixed amount per unit?", module_code:"19"},
    {question_code:"19-18", sort:"18", subject_id:"11", kind:"q", content:"Is the amount of the fixed penalty considered significant enough at all times during the term of the contract to make the possibility of nonperformance remote?", module_code:"19"},
    {question_code:"19-19", sort:"19", subject_id:"11", kind:"q", content:"Does the contract provide for a structured payout over time of gain or loss resulting from the contract?", module_code:"19"},
    {question_code:"19-20", sort:"20", subject_id:"11", kind:"q", content:"Is the fair value of the cash flows to received (or paid) by the holder under the structured payout approximately equal to the amount that would have been received (or paid) under immediate payout?", module_code:"19"},
    {question_code:"19-21", sort:"21", subject_id:"11", kind:"q", content:"Does the contract require additional investing or borrowing to obtain the benefits pf the contract's gain?", module_code:"19"},
    {question_code:"19-22", sort:"22", subject_id:"11", kind:"q", content:"Is the additional investing or borrowing a nontraditional adjustment of the yield on the amount invested or the interest element on the amount borrowed?", module_code:"19"},
    {question_code:"19-23", sort:"23", subject_id:"11", kind:"q", content:"Is the contract a debt instrument?", module_code:"19"},
    {question_code:"19-24", sort:"24", subject_id:"11", kind:"q", content:"Does the contract contain an embedded put or call option?", module_code:"19"},
    {question_code:"19-25", sort:"25", subject_id:"11", kind:"q", content:"If a call option, is the holder the debtor?", module_code:"19"},
    {question_code:"19-26", sort:"26", subject_id:"11", kind:"q", content:"If a put option, is the issuer the debtor?", module_code:"19"},
    {question_code:"19-27", sort:"27", subject_id:"11", kind:"d", content:"Pass - meets conditions for net settlement by terms of the contract", module_code:"19"},
    {question_code:"19-28", sort:"28", subject_id:"11", kind:"q", content:"Is there net settlement available by means of a market mechanism?", module_code:"19"},
    {question_code:"19-29", sort:"29", subject_id:"11", kind:"q", content:"Is there a means for one or both parties to liquidate its net position through a net payment?", module_code:"19"},
    {question_code:"19-30", sort:"30", subject_id:"11", kind:"q", content:"Does liquidating the net position result in that party being fully relieved of it rights and obligations under the contract?", module_code:"19"},
    {question_code:"19-31", sort:"31", subject_id:"11", kind:"q", content:"Does liquidation of the net position require significant transaction costs?", module_code:"19"},
    {question_code:"19-32", sort:"32", subject_id:"11", kind:"q", content:"Does liquidation of the net position occur without significant negotiation and due diligence?", module_code:"19"},
    {question_code:"19-33", sort:"33", subject_id:"11", kind:"q", content:"Does liquidation of the net position occur within a time frame that is considered customary for this type of contract?", module_code:"19"},
    {question_code:"19-34", sort:"34", subject_id:"11", kind:"d", content:"Pass - meets conditions for net settlement through market mechanism", module_code:"19"},
    {question_code:"19-35", sort:"35", subject_id:"11", kind:"q", content:"Is there net settlement by delivery of a derivative instrument or by delivery of an asset that is readily convertible to cash?", module_code:"19"},
    {question_code:"19-36", sort:"36", subject_id:"11", kind:"q", content:"Is the contract a stock purchase warrants or stock purchase option?", module_code:"19"},
    {question_code:"19-37", sort:"37", subject_id:"11", kind:"q", content:"Is the stock underlying the warrant (or option) publicly traded?", module_code:"19"},
    {question_code:"19-38", sort:"38", subject_id:"11", kind:"q", content:"Is the  warrant (or option) only for shares of the issuer (or that of its consolidated subsidieries?", module_code:"19"},
    {question_code:"19-39", sort:"39", subject_id:"11", kind:"q", content:"Is sale or transfer of the shares issuable upon exercise restricted for a period of 32 days or more from the date of exercise?", module_code:"19"},
    {question_code:"19-40", sort:"40", subject_id:"11", kind:"q", content:"Does the holder have the power, contractually or by other means, to cause the restriction to be met within 31 days of the date of exercise?", module_code:"19"},
    {question_code:"19-41", sort:"41", subject_id:"11", kind:"q", content:"Is the asset underlying the contract publicly traded stock?", module_code:"19"},
    {question_code:"19-42", sort:"42", subject_id:"11", kind:"q", content:"Can the active market rapidaly absorb the quantity of stock to be received upon exercise without significantly affecting the price?", module_code:"19"},
    {question_code:"19-43", sort:"43", subject_id:"11", kind:"q", content:"Are the estimated costs to convert the stock to cash considered to be significant?", module_code:"19"},
    {question_code:"19-44", sort:"44", subject_id:"11", kind:"q", content:"Is the asset deliverable upon settlement of the contract readily convertible to cash?", module_code:"19"},
    {question_code:"19-45", sort:"45", subject_id:"11", kind:"q", content:"Is the amount of cash that would be received from sale of the asset on an active market, net of transaction costs, approximately equal to what the entity would have received under a net settlement provision?", module_code:"19"},
    {question_code:"19-46", sort:"46", subject_id:"11", kind:"d", content:"Pass - meets conditions for net settlement by readily convertible to cash", module_code:"19"},
    {question_code:"19-47", sort:"47", subject_id:"11", kind:"d", content:"Pass - meets third condition", module_code:"19"},
    {question_code:"19-48", sort:"48", subject_id:"11", kind:"d", content:"Pass - Meets definition of a derivative", module_code:"19"}
  ]

questions_array.each do |q|
  puts q
  Question.find_or_create_by(
    content: q[:content],
    sort: q[:sort],
    module_code: q[:module_code],
    subject_id: q[:subject].to_f.round(0),
    kind: q[:kind],
    question_code: q[:question_code]
  )
  puts Question.last
end
