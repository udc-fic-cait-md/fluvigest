json.array!(@modelos_contadores) do |modelos_contadore|
  json.extract! modelos_contadore, :marca, :modelo
  json.url modelos_contadore_url(modelos_contadore, format: :json)
end
