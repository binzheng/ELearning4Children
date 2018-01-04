class CreateResultHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :result_histories do |t|
      t.string :testResultFirst
      t.string :testResultLast
      t.timestamp :testStartTime
      t.timestamp :testEndTime
      t.string :testTypeId
      t.string :created_id
      t.string :updated_id

      t.timestamps
    end
  end
end
