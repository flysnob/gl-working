# application helper module
module ApplicationHelper
  def question_select_options(question = nil, subject)
    options_for_select(Question.where(subject: subject).map { |q| [ q.question_code, q.id, {onclick: "select_questions(this)"}] }.compact, selected: question.try(:id) || '')
  end

  def subject_select_options(subject = nil)
    options_for_select(Subject.all.map { |s| [s.name, s.id, {onclick: "select_versions(this)"}] if s.display }.compact, selected: subject.try(:id) || '')
  end

  def version_select_options(version = nil)
    options_for_select(Version.all.map { |v| ["v#{v.version_number} - effective #{v.effective_date.strftime('%m/%d/%Y')}", v.id, {class: "subject-#{v.subject_id} hidden "}] }, selected: version.try(:id) || '')
  end
  
  def kind_select_options(kind = nil)
    kinds = make_kinds 
    options_for_select( kinds.map { |t| [t[:long], t[:short], {onclick: "select_kinds(this)"}] }, selected: kind || '')
  end
  
  def display_select_options(display = nil)
    options_for_select([['Yes', true], ['No', false]], selected: display ? 'true' : 'false')
  end

  def status_select_options(status = nil)
    options_for_select([['Production', 'prod'], ['Development', 'dev'], ['Beta', 'beta']], selected: status || '')
  end
  
  def subject_select_options_for_question(subject = nil)
    options_for_select(Subject.all.map { |s| [s.name, s.id, {onclick: "select_versions(this)"}] }.compact, selected: subject.try(:id) || '')
  end

  def make_kinds
    [ 
      {short: 'i', long: 'Info'},
      {short: 'q', long: 'Question'},
      {short: 'd', long: 'Decision'},
      {short: 'cf', long: 'Conclusion - Fail'},
      {short: 'cp', long: 'Conclusion - Pass'},
      {short: 'r', long: 'recommendation'}
    ]
  end
end
