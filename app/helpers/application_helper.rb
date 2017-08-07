# application helper module
module ApplicationHelper
  def subject_select_options(subject = nil)
    options_for_select(Subject.all.map { |s| [s.name, s.id, {onclick: "select_versions(this)"}] }, selected: subject.try(:id) || '')
  end

  def version_select_options(version = nil)
    options_for_select(Version.all.map { |v| ["v#{v.version_number} - effective #{v.effective_date.strftime('%m/%d/%Y')}", v.id, {class: "subject-#{v.subject_id} hidden "}] }, selected: version.try(:id) || '')
  end
end
