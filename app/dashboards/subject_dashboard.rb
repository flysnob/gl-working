require "administrate/base_dashboard"

class SubjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    projects: Field::HasMany,
    questions: Field::HasMany,
    versions: Field::BelongsTo.with_options(class_name: "Versions"),
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :projects,
    :questions,
    :versions,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :projects,
    :questions,
    :versions,
    :id,
    :name,
    :description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :projects,
    :questions,
    :versions,
    :name,
    :description,
  ].freeze

  # Overwrite this method to customize how subjects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(subject)
  #   "Subject ##{subject.id}"
  # end
end
