class CreateTestRules < ActiveRecord::Migration[5.1]
  def change
    create_table :test_rules do |t|
      t.integer :ruleUserId
      t.integer :mTestTypeId
      t.integer :testCount
      t.integer :maxScore
      t.integer :maxPoint
      t.integer :minScore
      t.integer :minPoint
      t.integer :midScore
      t.integer :midPoint

      t.timestamps
    end
  end
end
