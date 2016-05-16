json.array!(@unidades) do |unidade|
  json.extract! unidade, :id, :numero, :piso
  json.url unidade_url(unidade, format: :json)
end
