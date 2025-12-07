json.extract! photo, :id, :caption, :position, :gallery_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
