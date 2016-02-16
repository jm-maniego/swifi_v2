class Client < ActiveRecord::Base
  self.per_page = 10

  # Associations - Start
  has_many :job_orders
  # Associations - End

  # Validations - Start
  validates :name, presence: true
  # Validations - End

  # Constants - Start
  ACCESSIBLE_ATTRIBUTES = [
    :name,
    :contact_person,
    :contact_name
  ]
  # Constants - End
end
