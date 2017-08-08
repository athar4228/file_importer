class CreatePeople < ActiveRecord::Migration[5.0]

  def change
    create_table :people do |t|
      t.string :name, null: false, index: true
      t.string :email, null: false, index: { unique: true }
      t.string :telephone_number, limit: 100
      t.string :website, limit: 100
      t.timestamps
    end
  end
end
