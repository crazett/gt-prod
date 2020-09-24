class CreateGts < ActiveRecord::Migration[6.0]
  def change
    create_table :gts do |t|
      t.timestamps
      t.datetime :order_date
      t.datetime :deliver_date
      t.string     :customer
      t.bigint     :ref_num
      t.integer    :length
      t.integer    :amount
      t.string     :width_degree
      t.boolean    :rivet
      t.boolean    :under_steel
      t.integer    :quality_id
      t.boolean    :precut_gt
      t.integer    :precut_extra_steel
      t.string     :etching
      t.boolean    :pipe
      t.boolean    :packing
      t.boolean    :gt_tool
      t.boolean    :gt_flexo
      t.boolean    :gt_engraving
      t.text       :comment
      t.string     :worker
      t.string     :approver
    end
  end
end
