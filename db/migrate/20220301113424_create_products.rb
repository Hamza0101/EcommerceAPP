class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :serial_no
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
