json.array!(@posts) do |post|
  json.extract! post, :id, :post_name, :user_name, :blood_type, :message, :user_id
  json.url post_url(post, format: :json)
end
