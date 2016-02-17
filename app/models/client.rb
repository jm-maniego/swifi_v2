class Client < ActiveRecord::Base
  self.per_page = 100

  # Associations - Start
  has_many :job_orders
  # Associations - End

  # Validations - Start
  validates :name, presence: true
  # Validations - End

  # Constants - Start
  ACCESSIBLE_ATTRIBUTES = [
    :id,
    :name,
    :contact_person,
    :contact_name
  ]
  # Constants - End
end
