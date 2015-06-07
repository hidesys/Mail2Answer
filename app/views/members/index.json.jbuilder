json.array!(@members) do |member|
  json.extract! member, :id, :name, :name_kana, :section, :note, :email, :url
  json.url member_url(member, format: :json)
end
