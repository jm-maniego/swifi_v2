class LiquidationCategory < ActiveRecord::Base
  include Displayable

  has_many :liquidation_line_items

  validates :name, presence: true

  ACCESSIBLE_ATTRIBUTES = [
    :name
  ]

  # TODO:
  # - This is ugly
  # - Default flag must be an icon
  def default_flag_display
    default_flag.to_s.humanize
  end
end