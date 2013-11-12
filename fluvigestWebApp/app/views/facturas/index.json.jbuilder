json.array!(@facturas) do |factura|
  json.extract! factura, :descripcion, :fecha
  json.url factura_url(factura, format: :json)
end
