# frozen_string_literal: true

require 'administrate/field/base'

class FileField < Administrate::Field::Base
  def to_s
    data.filename
  end
end
