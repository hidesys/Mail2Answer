class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :subject
      t.string :content

      t.timestamps null: false
    end
  end
end
