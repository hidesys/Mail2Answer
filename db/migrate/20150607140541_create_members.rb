class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :name_kana
      t.string :section
      t.string :note
      t.string :email
      t.string :url

      t.timestamps null: false
    end
  end
end
