json.array!(@linea_facturas) do |linea_factura|
  json.extract! linea_factura, :factura_id, :numero, :descripcion
  json.url linea_factura_url(linea_factura, format: :json)
end
