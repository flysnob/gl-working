FactoryGirl.define do
  factory :question do
    module_code 'X'
    question_code 'X-1'
    question 'Question X-1 content - info node'
    sort '1'
    kind 'i'
    conclusion_1 'Continue'
    conclusion_2 ''
    conclusion_3 ''
    subject_id 1

    factory :question_1_1 do
      module_code 'Y'
      question_code 'Y-1'
      question 'Question Y-1 content - info node'
      sort '1'
      kind 'i'
      conclusion_1 'Continue'
      conclusion_2 ''
      conclusion_3 ''
      subject_id 1
    end

    factory :question_1_2 do
      module_code 'Y'
      question_code 'Y-2'
      question 'Question Y-2 content - question node'
      sort '2'
      kind 'q'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 'Analyze'
      subject_id 1
    end
    
    factory :question_1_3 do
      module_code 'Y'
      question_code 'Y-3'
      question 'Question Y-3 content - question node'
      sort '3'
      kind 'q'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 1
    end

    factory :question_1_4 do
      module_code 'Y'
      question_code 'Y-4'
      question 'Question Y-4 content - question node'
      sort '4'
      kind 'q'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 1
    end

    factory :question_1_5 do
      module_code 'Y'
      question_code 'Y-5'
      question 'Question Y-5 content - decision node'
      sort '5'
      kind 'd'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 1
    end

    factory :question_1_6 do
      module_code 'Y'
      question_code 'Y-6'
      question 'Question Y-6 content - conclusion node'
      sort '6'
      kind 'c'
      conclusion_1 ''
      conclusion_2 ''
      conclusion_3 ''
      subject_id 1
    end

    factory :question_2_1 do
      module_code 'Z'
      question_code 'Z-1'
      question 'Question Z-1 content - info node'
      sort '1'
      kind 'i'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 2
    end

    factory :question_2_2 do
      module_code 'Z'
      question_code 'Z-2'
      question 'Question Z-2 content - question node'
      sort '2'
      kind 'q'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 'Analyze'
      subject_id 2
    end
    
    factory :question_2_3 do
      module_code 'Z'
      question_code 'Z-3'
      question 'Question Z-3 content - question node'
      sort '3'
      kind 'q'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 2
    end

    factory :question_2_4 do
      module_code 'Z'
      question_code 'Z-4'
      question 'Question Z-4 content - question node'
      sort '4'
      kind 'q'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 2
    end

    factory :question_2_5 do
      module_code 'Z'
      question_code 'Z-5'
      question 'Question Z-5 content - decision node'
      sort '5'
      kind 'd'
      conclusion_1 'Yes'
      conclusion_2 'No'
      conclusion_3 ''
      subject_id 2
    end

    factory :question_2_6 do
      module_code 'Z'
      question_code 'Z-6'
      question 'Question Z-6 content - conclusion node'
      sort '6'
      kind 'c'
      conclusion_1 ''
      conclusion_2 ''
      conclusion_3 ''
      subject_id 2
    end
  end
end
