json.array!(@answers) do |answer|
  json.extract! answer, :id, :user_name, :blood_group, :posts_id, :email, :phone, :cellphone, :message
  json.url answer_url(answer, format: :json)
end
