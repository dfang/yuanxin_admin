require "administrate/field/base"
require "matrix"

class CollectionSelectField < Administrate::Field::Base
  def to_s
    # data
    m = Matrix[*collection]
    # p m
    texts = m.column(0).to_a
    # p "texts #{texts}"
    values = m.column(1).to_a
    # p values
    i = values.index(data)
    # p "data #{data}"
    # p "index #{i}"
    if i.present?
      texts[i]
    else
      ""
    end
  end

  def selectable_options
    collection
    # [["女", 0], ["男", 1]]
  end

  def selected_option
    selected
  end

  private

  def collection
    @collection ||= options.fetch(:collection, [])
  end

  def selected
    @selected ||= options.fetch(:selected, "")
  end

end
