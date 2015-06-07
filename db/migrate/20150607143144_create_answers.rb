class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :url
      t.string :reply
      t.references :member, index: true, foreign_key: true
      t.references :questionnaire, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
