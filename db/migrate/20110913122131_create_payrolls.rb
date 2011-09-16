class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.references :user
      t.string :company
      t.date :pay_day
      t.string :data

      t.timestamps
    end
  end
end
