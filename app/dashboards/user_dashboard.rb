require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    nickname: Field::String,
    pwd: Field::String,
    phone: Field::String,
    email: Field::String,
    avatar: ImageField,
    gender: CollectionSelectField.with_options(collection: [["女", 0], ["男", 1]]),
    # gender: SelectGenderField,
    biography: Field::Text,
    created_at: Field::DateTime,
    login_date: Field::DateTime,
    real_name: Field::String,
    identity_card_num: Field::String,
    identity_card_front: ImageField,
    identity_card_back: ImageField,
    from_code: Field::String,
    license: Field::String,
    expertise: Field::String,
    resume: Field::String,
    role: CollectionSelectField.with_options(collection: [["卖家", 2],["专家", 3]] ),
    remark: Field::Text,
    is_verified: CollectionSelectField.with_options(collection: [["",""], ["否", false], ["是", true]]),
  }.freeze

  COLLECTION_SCOPES = {
    role: [:sellers, :professionals]
  }
  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :nickname,
    :phone,
    :created_at,
    :role,
    :is_verified
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # sellers: Field::BelongsTo.with_options(class_name: "User"),

    :id,
    :nickname,
    :phone,
    :email,
    :avatar,
    :gender,
    :biography,
    :created_at,
    :login_date,
    :real_name,
    :identity_card_num,
    :identity_card_front,
    :identity_card_back,
    :from_code,
    :license,
    :expertise,
    :resume,
    :role,
    :is_verified,
    :remark,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :nickname,
    :phone,
    :email,
    :avatar,
    :gender,
    :biography,
    :login_date,
    :real_name,
    :identity_card_num,
    :identity_card_front,
    :identity_card_back,
    :from_code,
    :license,
    :expertise,
    :resume,
    :role,
    :is_verified,
    :remark,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
