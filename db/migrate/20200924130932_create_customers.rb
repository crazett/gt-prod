class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|

      t.timestamps
      t.string     :name
    end
  end
end
