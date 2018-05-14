require "administrate/base_dashboard"

class ChipDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    user_id: Field::Number,
    serial_number: Field::String,
    vendor: Field::String,
    amount: Field::Number,
    manufacture_date: Field::DateTime,
    unit_price: Field::Number.with_options(decimals: 2),
    specification: Field::String,
    is_verified: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user_id,
    :serial_number,
    :vendor,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user_id,
    :serial_number,
    :vendor,
    :amount,
    :manufacture_date,
    :unit_price,
    :specification,
    :is_verified,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user_id,
    :serial_number,
    :vendor,
    :amount,
    :manufacture_date,
    :unit_price,
    :specification,
    :is_verified,
  ].freeze

  # Overwrite this method to customize how chips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(chip)
  #   "Chip ##{chip.id}"
  # end
end
