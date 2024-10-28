class CreateFields < ActiveRecord::Migration[7.2]
  def change
    create_table :fields do |t|
      t.references :calculator, null: false
      t.string :type, null: false
      t.string :label, null: false
      
      t.timestamps
    end
  end
end
