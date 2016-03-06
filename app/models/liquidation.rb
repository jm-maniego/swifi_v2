class Liquidation < ActiveRecord::Base
  belongs_to :expense
  has_many :export_liquidation_line_items, class_name: "ExportLiquidationLineItem", dependent: :destroy
  has_many :import_liquidation_line_items, class_name: "ImportLiquidationLineItem", dependent: :destroy
  has_many :other_liquidation_line_items, class_name: "OtherLiquidationLineItem", dependent: :destroy

  accepts_nested_attributes_for :export_liquidation_line_items, :import_liquidation_line_items, reject_if: :line_item_rejectable?

  FORM_FIELDS = {
    import: [
      "Processing - Transhipment Permit",
      "Processing - Re-entry",
      "Processing - Warehousing Entry",
      "Processing - Consumption Entry",
      "Processing - Informal Entry",
      "Boatnote Forms & Stamps",
      "Conduction Fee / Customs Guard",
      "Warehouseman Fee",
      "Trucking",
      "Arrastre Charge",
      "Wharfage Due",
      "Storage Fee",
      "Demurrage Charges",
      "Freight/LCL Charges/Breakbulk/THC",
      "Duties & Taxes / Bank Charge",
      "Import Processing Fee (IPF)",
      "AISL/Container Clearance",
      "Chassis Rental",
      "Mission Order",
      "Assycuda",
      "Notarial",
      "Transfer Charges",
      "CFS/Warehouse Charges"
    ],
    export: [
      "Processing - CI Amendment (Warehouseman)",
      "Processing - CI Amendment (WAD)",
      "Processing - Pull-out of orig. CI/CIL/Boatnote",
      "Processing - ED Amendment",
      "Processing - Export Entry",
      "Processing - CI (WAD)",
      "Conduction Fee / Customs Guard",
      "Warehouseman Fee",
      "Arrastre Charge",
      "Wharfage"
    ]
  }

  def build_export_liquidation_line_items
    FORM_FIELDS[:export].map do |name|
      export_liquidation_line_items.build(name: name)
    end
  end

  def build_import_liquidation_line_items
    FORM_FIELDS[:import].map do |name|
      import_liquidation_line_items.build(name: name)
    end
  end

  def line_item_rejectable?(li_attributes)
    line_item_is_new_record = new_record? || li_attributes["id"].blank?
    li_amount_is_zero = li_attributes["amount"].to_f.zero?
    line_item_is_new_record && li_amount_is_zero
  end
end