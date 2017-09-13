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

subject_1 = Subject.find_or_create_by(name: 'Module 1')
subject_2 = Subject.find_or_create_by(name: 'Module 2')
subject_3 = Subject.find_or_create_by(name: 'Module 3')
subject_4 = Subject.find_or_create_by(name: 'Module 4')

version_1 = Version.find_or_create_by(subject: subject_1, module_code: '1', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_2 = Version.find_or_create_by(subject: subject_2, module_code: '2', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_3 = Version.find_or_create_by(subject: subject_3, module_code: '3', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')
version_4 = Version.find_or_create_by(subject: subject_4, module_code: '4', effective_date: Date.strptime('01/01/2010', '%m/%d/%Y'), version_number: '1')

version_1.json = '[
{"question_code":"1-1","response_1":"Yes","target_1":"1-2","response_2":"No","target_2":"1-12","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-2","response_1":"Yes","target_1":"1-3","response_2":"No","target_2":"1-12","response_3":"Analyze","target_3":"2-1","return_node":"1-2","decision_node":"","fail_response":"","boolean":"","target_module":"2","return":""},
{"question_code":"1-3","response_1":"Yes","target_1":"1-4","response_2":"No","target_2":"1-12","response_3":"Analyze","target_3":"3-1","return_node":"1-3","decision_node":"","fail_response":"","boolean":"","target_module":"3","return":""},
{"question_code":"1-4","response_1":"Yes","target_1":"1-5","response_2":"No","target_2":"1-12","response_3":"Analyze","target_3":"4-1","return_node":"1-4","decision_node":"","fail_response":"","boolean":"","target_module":"4","return":""},
{"question_code":"1-5","response_1":"Yes","target_1":"1-6","response_2":"No","target_2":"1-6","response_3":"","target_3":"","return_node":"","decision_node":"1-7","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-6","response_1":"Yes","target_1":"1-7","response_2":"No","target_2":"1-7","response_3":"","target_3":"","return_node":"","decision_node":"1-7","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-7","response_1":"Pass","target_1":"1-8","response_2":"Fail","target_2":"1-8","response_3":"","target_3":"","return_node":"","decision_node":"1-11","fail_response":"or","boolean":"","target_module":"","return":""},
{"question_code":"1-8","response_1":"Yes","target_1":"1-9","response_2":"No","target_2":"1-9","response_3":"","target_3":"","return_node":"","decision_node":"1-10","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-9","response_1":"Yes","target_1":"1-10","response_2":"No","target_2":"1-10","response_3":"","target_3":"","return_node":"","decision_node":"1-10","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-10","response_1":"Pass","target_1":"1-11","response_2":"Fail","target_2":"1-11","response_3":"","target_3":"","return_node":"","decision_node":"1-11","fail_response":"and","boolean":"","target_module":"","return":""},
{"question_code":"1-11","response_1":"Pass","target_1":"1-13","response_2":"Fail","target_2":"1-14","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"and","boolean":"","target_module":"","return":""},
{"question_code":"1-12","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-13","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"1-14","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_1.save

version_2.json = '[
{"question_code":"2-1","response_1":"Yes","target_1":"2-2","response_2":"No","target_2":"2-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"2-2","response_1":"Yes","target_1":"2-3","response_2":"No","target_2":"2-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""},
{"question_code":"2-3","response_1":"Yes","target_1":"2-4","response_2":"No","target_2":"2-4","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":"true"},
{"question_code":"2-4","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":"","return":""}
]'
version_2.save

version_3.json = '[
{"question_code":"3-1","response_1":"Yes","target_1":"3-2","response_2":"No","target_2":"3-2","response_3":"","target_3":"","return_node":"","decision_node":"3-4","fail_response":"No","boolean":"","target_module":""},
{"question_code":"3-2","response_1":"Yes","target_1":"3-3","response_2":"No","target_2":"3-3","response_3":"","target_3":"","return_node":"","decision_node":"3-4","fail_response":"No","boolean":"","target_module":""},
{"question_code":"3-3","response_1":"Yes","target_1":"3-4","response_2":"No","target_2":"3-4","response_3":"","target_3":"","return_node":"","decision_node":"3-4","fail_response":"Yes","boolean":"","target_module":""},
{"question_code":"3-4","response_1":"Pass","target_1":"3-5","response_2":"Fail","target_2":"3-6","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"or","target_module":"","return":"true"},
{"question_code":"3-5","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":""},
{"question_code":"3-6","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":""}
]'
version_3.save

version_4.json = '[
{"question_code":"4-1","response_1":"Yes","target_1":"4-2","response_2":"No","target_2":"4-2","response_3":"","target_3":"","return_node":"","decision_node":"3-4","fail_response":"No","boolean":"","target_module":""},
{"question_code":"4-2","response_1":"Yes","target_1":"4-3","response_2":"No","target_2":"4-3","response_3":"","target_3":"","return_node":"","decision_node":"3-4","fail_response":"No","boolean":"","target_module":""},
{"question_code":"4-3","response_1":"Yes","target_1":"4-4","response_2":"No","target_2":"4-4","response_3":"","target_3":"","return_node":"","decision_node":"3-4","fail_response":"Yes","boolean":"","target_module":""},
{"question_code":"4-4","response_1":"Pass","target_1":"4-5","response_2":"Fail","target_2":"4-6","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"and","target_module":"","return":"true"},
{"question_code":"4-5","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":""},
{"question_code":"4-6","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","return_node":"","decision_node":"","fail_response":"","boolean":"","target_module":""}
]'
version_4.save

questions_array = 
  [
    {question_code:"1-1", sort:"1", subject_id:"1", kind:"q", content:"Simple question node. Yes will go to next node. No will go to conclusion.", module_code:"1"},
    {question_code:"1-2", sort:"2", subject_id:"1", kind:"q", content:"This question has an analyze button to a no decision target module. Yes will go to next node. No will go to conclusion.", module_code:"1"},
    {question_code:"1-3", sort:"3", subject_id:"1", kind:"q", content:"This question has an analyze button to an 'or' decision target module. Yes will go to next node. No will go to conclusion.", module_code:"1"},
    {question_code:"1-4", sort:"4", subject_id:"1", kind:"q", content:"This question has an analyze button to an 'or' decision target module. Yes will go to next node. No will go to conclusion.", module_code:"1"},
    {question_code:"1-5", sort:"5", subject_id:"1", kind:"q", content:"This is a 1st tier 1 or decision question", module_code:"1"},
    {question_code:"1-6", sort:"6", subject_id:"1", kind:"q", content:"This is a 1st tier 1 or decision question", module_code:"1"},
    {question_code:"1-7", sort:"7", subject_id:"1", kind:"d", content:"This is the 1st tier 1 'or' decision", module_code:"1"},
    {question_code:"1-8", sort:"8", subject_id:"1", kind:"q", content:"This is a 1st tier 2 and decision question", module_code:"1"},
    {question_code:"1-9", sort:"9", subject_id:"1", kind:"q", content:"This is a 1st tier 2 and decision question", module_code:"1"},
    {question_code:"1-10", sort:"10", subject_id:"1", kind:"d", content:"This is the 1st tier 2 'and' decision", module_code:"1"},
    {question_code:"1-11", sort:"11", subject_id:"1", kind:"d", content:"This is the 2nd tier and decision", module_code:"1"},
    {question_code:"1-12", sort:"12", subject_id:"1", kind:"r", content:"This is the No recommendation", module_code:"1"},
    {question_code:"1-13", sort:"13", subject_id:"1", kind:"r", content:"This is the two tier pass recommendation", module_code:"1"},
    {question_code:"1-14", sort:"14", subject_id:"1", kind:"r", content:"This is the two tier fail recommendation", module_code:"1"},

    {question_code:"2-1", sort:"1", subject_id:"2", kind:"q", content:"This is a target node with no decision node", module_code:"2"},
    {question_code:"2-2", sort:"2", subject_id:"2", kind:"q", content:"This is the second question", module_code:"2"},
    {question_code:"2-3", sort:"3", subject_id:"2", kind:"q", content:"This is the third question", module_code:"2"},
    {question_code:"2-4", sort:"4", subject_id:"2", kind:"r", content:"This is the recommendation node", module_code:"2"},

    {question_code:"3-1", sort:"1", subject_id:"3", kind:"q", content:"This is a target node with an 'or' decision node. Yes is node pass. No is node fail.", module_code:"3"},
    {question_code:"3-2", sort:"2", subject_id:"3", kind:"q", content:"This is a target node with an 'or' decision node. Yes is node pass. No is node fail.", module_code:"3"},
    {question_code:"3-3", sort:"3", subject_id:"3", kind:"q", content:"This is a target node with an 'or' decision node. Yes is node fail. No is node pass.", module_code:"3"},
    {question_code:"3-4", sort:"4", subject_id:"3", kind:"d", content:"This is the 'or' decision node", module_code:"3"},
    {question_code:"3-5", sort:"5", subject_id:"3", kind:"r", content:"This is the module pass conclusion node", module_code:"3"},
    {question_code:"3-6", sort:"6", subject_id:"3", kind:"r", content:"This is the module fail conclusion node", module_code:"3"},

    {question_code:"4-1", sort:"1", subject_id:"4", kind:"q", content:"This is a target node with an 'and' decision node. Yes is node pass. No is node fail.", module_code:"4"},
    {question_code:"4-2", sort:"2", subject_id:"4", kind:"q", content:"This is a target node with an 'and' decision node. Yes is node pass. No is node fail.", module_code:"4"},
    {question_code:"4-3", sort:"3", subject_id:"4", kind:"q", content:"This is a target node with an 'and' decision node. Yes is node fail. No is node pass.", module_code:"4"},
    {question_code:"4-4", sort:"4", subject_id:"4", kind:"d", content:"This is the 'and' decision node", module_code:"4"},
    {question_code:"4-5", sort:"5", subject_id:"4", kind:"r", content:"This is the module pass conclusion node", module_code:"4"},
    {question_code:"4-6", sort:"6", subject_id:"4", kind:"r", content:"This is the module fail conclusion node", module_code:"4"},
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
