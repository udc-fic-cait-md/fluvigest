json.array!(@tipo_tarifas) do |tipo_tarifa|
  json.extract! tipo_tarifa, 
  json.url tipo_tarifa_url(tipo_tarifa, format: :json)
end
