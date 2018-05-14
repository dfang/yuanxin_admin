class ApplicationRecord < ActiveRecord::Base
  # establish_connection("odoo_#{Rails.env}".to_sym)
  # establish_connection(:news)
  self.abstract_class = true
end
