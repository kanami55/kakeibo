class CreateFixedcosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fixedcosts do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
