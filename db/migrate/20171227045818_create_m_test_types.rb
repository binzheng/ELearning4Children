class CreateMTestTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :m_test_types do |t|
      t.string :testName
      t.integer :parentTypeId
      t.string :testUrl
      t.string :testImage
      t.string :testDesc
      t.integer :testSize
      t.string :created_id
      t.string :updated_id

      t.timestamps
    end
  end
end
