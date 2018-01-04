class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :toyName
      t.string :toyUrl
      t.integer :toyPoint
      t.string :toyImage
      t.string :testDesc
      t.string :created_id
      t.string :updated_id

      t.timestamps
    end
  end
end
