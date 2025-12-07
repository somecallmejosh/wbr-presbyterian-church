json.extract! church_member, :id, :name, :date_of_birth, :created_at, :updated_at
json.url church_member_url(church_member, format: :json)
