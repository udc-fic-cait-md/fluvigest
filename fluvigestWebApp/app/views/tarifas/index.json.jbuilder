json.array!(@tarifas) do |tarifa|
  json.extract! tarifa, 
  json.url tarifa_url(tarifa, format: :json)
end
