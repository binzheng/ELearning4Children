json.extract! user, :id, :loginNm, :kataNm, :kanjiNm, :age, :email, :voiceGood, :voiceBad, :voicePerfect, :created_id, :updated_id, :created_at, :updated_at
json.url user_url(user, format: :json)
