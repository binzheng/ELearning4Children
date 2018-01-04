class CreateAddColumnToResultHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :add_column_to_result_histories do |t|
      t.integer :testPoint

      t.timestamps
    end
  end
end
