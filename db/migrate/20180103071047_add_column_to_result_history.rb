class AddColumnToResultHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :result_histories, :testPoint, :integer
  end
end
