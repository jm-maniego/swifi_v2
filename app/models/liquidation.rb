class Liquidation < ActiveRecord::Base
  belongs_to :expense
  has_many :liquidation_line_items
  has_many :export_liquidation_line_items, class_name: "ExportLiquidationLineItem", dependent: :destroy
  has_many :import_liquidation_line_items, class_name: "ImportLiquidationLineItem", dependent: :destroy
  has_many :other_liquidation_line_items, class_name: "OtherLiquidationLineItem", dependent: :destroy

  accepts_nested_attributes_for :export_liquidation_line_items, :import_liquidation_line_items, reject_if: :line_item_rejectable?

  validates :liquidated_by_name, presence: true

  def build_export_liquidation_line_items
    raise "TODO"
    except_category_names = liquidation_line_items.pluck(:name)
    LiquidationCategory.defaults.where.not(name: except_category_names).each do |default_lqc|
      export_liquidation_line_items.build(name: default_lqc.name)
    end
    export_liquidation_line_items
  end

  def build_import_liquidation_line_items
    raise "TODO"
    except_category_names = liquidation_line_items.pluck(:name)
    LiquidationCategory.defaults.where.not(name: except_category_names).each do |default_lqc|
      import_liquidation_line_items.build(name: default_lqc.name)
    end
    import_liquidation_line_items
  end

  def line_item_rejectable?(li_attributes)
    line_item_is_new_record = new_record? || li_attributes["id"].blank?
    li_amount_is_zero = li_attributes["amount"].to_f.zero?
    line_item_is_new_record && li_amount_is_zero
  end
end