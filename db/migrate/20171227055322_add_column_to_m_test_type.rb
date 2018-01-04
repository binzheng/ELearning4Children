class AddColumnToMTestType < ActiveRecord::Migration[5.1]
  def change
    add_column :m_test_types, :testEnNm, :string
  end
end
