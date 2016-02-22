class Client < ActiveRecord::Base
  include Displayable
  self.per_page = 100

  # Associations - Start
  has_many :job_orders
  has_one :bill
  # Associations - End

  # Validations - Start
  validates :name, presence: true
  # Validations - End

  # Constants - Start
  ACCESSIBLE_ATTRIBUTES = [
    :name,
    :address,
    :contact_person,
    :contact_name
  ]
  # Constants - End
end
