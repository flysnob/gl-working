require "administrate/base_dashboard"

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    subject: Field::BelongsTo,
    version: Field::BelongsTo,
    nodes: Field::HasMany,
    responses: Field::HasMany,
    returns: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    date: Field::DateTime,
    entity: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :subject,
    :version,
    :nodes,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :subject,
    :version,
    :nodes,
    :responses,
    :returns,
    :id,
    :name,
    :description,
    :date,
    :entity,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :subject,
    :version,
    :nodes,
    :responses,
    :returns,
    :name,
    :description,
    :date,
    :entity,
  ].freeze

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project)
  #   "Project ##{project.id}"
  # end
end
