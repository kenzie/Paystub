class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.references :user
      t.date :pay_day
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.datetime :data_updated_at

      t.timestamps
    end
  end
end
