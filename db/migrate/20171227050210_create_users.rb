class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :User
      t.string :loginNm
      t.string :kataNm
      t.string :kanjiNm
      t.integer :age
      t.string :email
      t.integer :point
      t.string :voiceGood
      t.string :voiceBad
      t.string :voicePerfect
      t.string :created_id
      t.string :updated_id

      t.timestamps
    end
  end
end
