json.array!(@tarifas) do |tarifa|
  json.extract! tarifa,  :nombre,:descripcion, :tipo, :precioBasura,:engancheContador,:precioAlquiler
  json.url tarifa_url(tarifa, format: :json)
end
