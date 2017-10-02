# application helper module
module ApplicationHelper
  def subject_select_options(subject = nil)
    options_for_select(Subject.all.map { |s| [s.name, s.id, {onclick: "select_versions(this)"}] }, selected: subject.try(:id) || '')
  end

  def version_select_options(version = nil)
    options_for_select(Version.all.map { |v| ["v#{v.version_number} - effective #{v.effective_date.strftime('%m/%d/%Y')}", v.id, {class: "subject-#{v.subject_id} hidden "}] }, selected: version.try(:id) || '')
  end
  
  def kind_select_options(kind = nil)
    kinds = [ {short: 'i', long: 'Info'}, {short: 'q', long: 'Question'}, {short: 'd', long: 'Decision'}, {short: 'r', long: 'recommendation'}]
    options_for_select( kinds.map { |t| [t[:long], t[:short], {onclick: "select_kinds(this)"}] }, selected: kind || '')
  end
end
