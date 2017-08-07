FactoryGirl.define do
  factory :version do
    module_code 'X'
    version_number '1'
    subject_id 1
    effective_date 1.year.ago
    expiration_date ''

    factory :version_1 do
      module_code 'Y'
      version_number '1'
      subject_id 1
      effective_date 1.year.ago
      expiration_date ''
      json '[{"question_code":"Y-1","response_1":"Continue","target_1":"Y-2","response_2":"","target_2":"","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":"","module_code":""},
              {"question_code":"Y-2","response_1":"Yes","target_1":"Y-3","response_2":"No","target_2":"Y-4","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":"","module_code":""},
              {"question_code":"Y-3","response_1":"Yes","target_1":"Y-5","response_2":"No","target_2":"Y-6","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":"","module_code":""},
              {"question_code":"Y-4","response_1":"Yes","target_1":"Y-5","response_2":"No","target_2":"Y-6","response_3":"Analyze","target_3":"Z-1","decisionNodeId":"","failResponse":"","bool":"","module_code":"Z"},
              {"question_code":"Y-5","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":"","module_code":""},
              {"question_code":"Y-6","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":"","module_code":""}]'
    end
    
    factory :version_2 do
      module_code 'Z'
      version_number '1'
      subject_id 2
      effective_date 1.year.ago
      expiration_date Date.tomorrow
      json '[{"question_code":"Z-1","response_1":"Yes","target_1":"Z-2","response_2":"No","target_2":"Z-1","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-2","response_1":"Yes","target_1":"Z-3","response_2":"No","target_2":"Z-4","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-3","response_1":"Yes","target_1":"Z-5","response_2":"No","target_2":"Z-6","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-4","response_1":"Yes","target_1":"Z-1","response_2":"No","target_2":"Z-5","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-5","response_1":"Yes","target_1":"Z-6","response_2":"No","target_2":"Z-6","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-6","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""}]'
    end
    
    factory :version_3 do
      module_code 'Z'
      version_number '2'
      subject_id 2
      effective_date Date.tomorrow + 1.day
      expiration_date ''
      json '[{"question_code":"Z-1","response_1":"Yes","target_1":"Z-2","response_2":"No","target_2":"Z-1","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-2","response_1":"Yes","target_1":"Z-3","response_2":"No","target_2":"Z-4","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-3","response_1":"Yes","target_1":"Z-5","response_2":"No","target_2":"Z-6","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-4","response_1":"Yes","target_1":"Z-1","response_2":"No","target_2":"Z-5","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-5","response_1":"Yes","target_1":"Z-6","response_2":"No","target_2":"Z-6","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""},
              {"question_code":"Z-6","response_1":"","target_1":"","response_2":"","target_2":"","response_3":"","target_3":"","decisionNodeId":"","failResponse":"","bool":""}]'
    end
  end
end
