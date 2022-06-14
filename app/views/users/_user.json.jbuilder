json.extract! user, :id, :name, :email, :password_digest, :profile, :profile_image_id, :created_at, :updated_at
json.url user_url(user, format: :json)
