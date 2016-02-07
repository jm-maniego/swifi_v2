class Client < ActiveRecord::Base
  has_many :job_orders
end
