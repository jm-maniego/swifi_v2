class ExpenseCategory < ActiveRecord::Base
  include Displayable

  has_many :expense_line_items

  validates :name, presence: true

  ACCESSIBLE_ATTRIBUTES = [
    :name
  ]

  scope :defaults, -> {
    where(default_flag: true)
  }

  # TODO:
  # - This is ugly
  # - Default flag must be an icon
  def default_flag_display
    default_flag.to_s.humanize
  end
end
