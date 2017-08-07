describe ProjectsController do
  it 'creates project questions' do
    FactoryGirl.create(:version_1)
    FactoryGirl.create(:version_2)
    FactoryGirl.create(:version_3)
    FactoryGirl.create(:subject)
    FactoryGirl.create(:question_1_1)
    FactoryGirl.create(:question_1_2)
    FactoryGirl.create(:question_1_3)
    FactoryGirl.create(:question_1_4)
    FactoryGirl.create(:question_1_5)
    FactoryGirl.create(:question_1_6)
    FactoryGirl.create(:question_2_1)
    FactoryGirl.create(:question_2_2)
    FactoryGirl.create(:question_2_3)
    FactoryGirl.create(:question_2_4)
    FactoryGirl.create(:question_2_5)
    FactoryGirl.create(:question_2_6)

    post :create,
         project: {
           name: 'My project',
           version: 1,
           subject: 1,
           date: Date.today
         }

    project = Project.first

    expect(project.project_questions.count).to eq(12)
    expect(project.project_questions.last.question.question_code).to eq('Z-6')
  end

  it 'finds the initial project question' do
    FactoryGirl.create(:version_1)
    FactoryGirl.create(:version_2)
    FactoryGirl.create(:version_3)
    FactoryGirl.create(:subject)
    FactoryGirl.create(:question_1_1)
    FactoryGirl.create(:question_1_2)
    FactoryGirl.create(:question_1_3)
    FactoryGirl.create(:question_1_4)
    FactoryGirl.create(:question_1_5)
    FactoryGirl.create(:question_1_6)
    FactoryGirl.create(:question_2_1)
    FactoryGirl.create(:question_2_2)
    FactoryGirl.create(:question_2_3)
    FactoryGirl.create(:question_2_4)
    FactoryGirl.create(:question_2_5)
    FactoryGirl.create(:question_2_6)
    FactoryGirl.create(:project)
  end
end
