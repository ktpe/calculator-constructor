class CreateFields < ActiveRecord::Migration[7.2]
  def change
    create_table :fields do |t|
      t.references :calculator, null: false
      t.string :field_type, null: false
      t.string :label, null: false
      t.string :var_name, null: false
      
      t.timestamps
    end
  end
end
