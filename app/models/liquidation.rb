class Liquidation < ActiveRecord::Base
  belongs_to :expense
  has_many :liquidation_line_items
end