json.array!(@barrios) do |barrio|
  json.extract! barrio, :nombre
  json.url barrio_url(barrio, format: :json)
end
