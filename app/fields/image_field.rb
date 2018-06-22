require "administrate/field/base"

class ImageField < Administrate::Field::Base
  def to_s
    data
  end

  def image_url
    data
  end
end
