json.array!(@inmuebles) do |inmueble|
  json.extract! inmueble, :numero, :piso, :portal, :puerta, :nombre, :orden, :cod_postal, :escalera, :inmueblescol
  json.url inmueble_url(inmueble, format: :json)
end
