class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
