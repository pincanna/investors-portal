json.extract! encrypted_memo, :id, :uid, :title, :body, :created_at, :updated_at
json.url encrypted_memo_url(encrypted_memo, format: :json)
