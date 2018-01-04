class TestRule < ApplicationRecord
    belongs_to :m_test_type,:foreign_key => "mTestTypeId"
end
