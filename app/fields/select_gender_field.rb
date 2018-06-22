require "administrate/field/base"

class SelectGenderField < Administrate::Field::Base
  def to_s
    data
  end

  def associated_resource_options
    # %w(male female)
    [["男", 1], ["女", 0]]
  end

  def selected_option
    "男"
  end
end
