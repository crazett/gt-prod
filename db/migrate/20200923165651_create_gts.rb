class CreateGts < ActiveRecord::Migration[6.0]
  def change
    create_table :gts do |t|
      t.timestamps
      t.datetime   :order_date
      t.datetime   :deliver_date
      t.integer    :customer_id
      t.string     :ref_num
      t.integer    :length
      t.integer    :amount
      t.integer    :width
      t.integer    :degree
      t.boolean    :rivet, default: true
      t.boolean    :under_steel
      t.string     :quality
      t.boolean    :precut_gt
      t.integer    :precut_extra_steel
      t.string     :etching, default: "Standard"
      t.boolean    :pipe
      t.boolean    :packing
      t.boolean    :gt_tool
      t.boolean    :gt_flexo
      t.boolean    :gt_engraving
      t.text       :comment
      t.integer    :worker_id
      t.integer    :approver_id
      t.integer    :priority, default: 1
      t.boolean    :under_bool
      t.boolean    :precut_gt_bool
      t.boolean    :precut_extra_bool
      t.boolean    :done, default: false
    end
  end
end
