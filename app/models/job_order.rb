class JobOrder < ActiveRecord::Base
  # Mixins - Start
  include Bitfields
  # Mixins - End

  # Associations
  belongs_to :client

  # Constants - Start
  MODE_OF_SHIPMENT = 0
  SERVICE_TYPE     = 1
  SERVICES         = 2

  FIELD_NAMES = [
    :mode_of_shipment,
    :service_type,
    :services
  ]

  FIELD_VALUES = [
    { 1 => "sea",       2 => "air" },
    { 1 => "import",    2 => "export" },
    { 1 => "brokerage", 2 => "forwarding" }
  ]

  VALID_VALUES = [
    [1, 2],
    [1, 2],
    [1, 2, 3]
  ]
  # Constants - End

  # Bitfields - Start
  bitfield FIELD_NAMES[MODE_OF_SHIPMENT], FIELD_VALUES[MODE_OF_SHIPMENT]
  bitfield FIELD_NAMES[SERVICE_TYPE], FIELD_VALUES[SERVICE_TYPE]
  bitfield FIELD_NAMES[SERVICES], FIELD_VALUES[SERVICES]
  # Bitfields - End

  # Validations - Start
  validates FIELD_NAMES[MODE_OF_SHIPMENT], inclusion: { in: VALID_VALUES[MODE_OF_SHIPMENT] }
  validates FIELD_NAMES[SERVICE_TYPE], inclusion: { in: VALID_VALUES[SERVICE_TYPE] }
  validates FIELD_NAMES[SERVICES], inclusion: { in: VALID_VALUES[SERVICES] }
  # Validations - End

  # Scopes - Start
  scope :for_year,      lambda {|year| where('EXTRACT(YEAR FROM created_at) = ?', year) }
  scope :for_this_year, -> { for_year(Date.today.year) }
  # Scopes - End

  # Callbacks - Start
  after_create do |job_order|
    generate_number
  end
  # Callbacks - End

  def latest_number
    JobOrder.for_this_year.maximum(:number) || 0
  end

  def next_jo_number
    latest_number + 1
  end

  def generate_number
    self.number = next_jo_number
    save!
  end

  def self.mode_of_shipments
    for_dropdown(JobOrder::FIELD_VALUES[JobOrder::MODE_OF_SHIPMENT])
  end

  def self.service_types
    for_dropdown(JobOrder::FIELD_VALUES[JobOrder::SERVICE_TYPE])
  end

  def self.services
    for_dropdown(JobOrder::FIELD_VALUES[JobOrder::SERVICES])
  end

  def client_name
    client.name
  end

  def mode_of_shipment_display
    FIELD_VALUES[MODE_OF_SHIPMENT][mode_of_shipment].humanize
  end

  def service_type_display
    FIELD_VALUES[SERVICE_TYPE][service_type].humanize
  end

  def services_display
    all_services = FIELD_VALUES[SERVICES].keys.inject(&:+)
    FIELD_VALUES[SERVICES].select{|bitvalue, name| !(bitvalue & all_services).zero? }.values.map{|v| v.humanize}.join(", ")
  end

  private

  def self.for_dropdown(job_order_field_values)
    job_order_field_values.map{|value, name| [name.humanize, value]}
  end
end
