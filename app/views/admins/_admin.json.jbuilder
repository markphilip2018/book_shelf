json.extract! admin, :id, :library_id, :name, :email, :password, :created_at, :updated_at
json.url admin_url(admin, format: :json)
