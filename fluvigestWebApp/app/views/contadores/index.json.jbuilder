json.array!(@contadores) do |contadore|
  json.extract! contadore, :num_serie, :calibre, :dt_instalacion, :dt_retirada, :dt_revision, :estado
  json.url contadore_url(contadore, format: :json)
end
