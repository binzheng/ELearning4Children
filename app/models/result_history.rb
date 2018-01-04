class ResultHistory < ApplicationRecord
    belongs_to :m_test_type,:foreign_key => "testTypeId"    
end
