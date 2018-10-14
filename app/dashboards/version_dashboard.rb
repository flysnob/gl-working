require "administrate/base_dashboard"

class VersionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    subject: Field::BelongsTo,
    questions: Field::HasMany,
    version_nodes: Field::HasMany,
    id: Field::Number,
    module_code: Field::String,
    version_number: Field::String,
    effective_date: Field::DateTime,
    expiration_date: Field::DateTime,
    status: Field::String,
    json: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :subject,
    :questions,
    :version_nodes,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :subject,
    :questions,
    :version_nodes,
    :id,
    :module_code,
    :version_number,
    :effective_date,
    :expiration_date,
    :status,
    :json,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :subject,
    :questions,
    :version_nodes,
    :module_code,
    :version_number,
    :effective_date,
    :expiration_date,
    :status,
    :json,
  ].freeze

  # Overwrite this method to customize how versions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(version)
  #   "Version ##{version.id}"
  # end
end
