class CreateResultHisDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :result_his_details do |t|
      t.integer :testHistId
      t.integer :testSeq
      t.string :testQuestion
      t.string :testFirstAnswer
      t.string :testAnswer
      t.string :expectAnswer
      t.string :testResult
      t.string :created_id
      t.string :updated_id

      t.timestamps
    end
  end
end
