class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|

      t.timestamps
      t.string :name
    end
  end
end
