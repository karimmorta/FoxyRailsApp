class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :short_name
      t.string :country

      t.timestamps null: false
    end
  end
end
