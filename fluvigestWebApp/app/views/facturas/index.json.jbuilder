json.array!(@facturas) do |factura|
  json.extract! factura, :descripcion, :fecha_emision
  json.url factura_url(factura, format: :json)
end
