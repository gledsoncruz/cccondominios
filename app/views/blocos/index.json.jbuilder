json.array!(@blocos) do |bloco|
  json.extract! bloco, :id, :descricao, :sigla, :obs
  json.url bloco_url(bloco, format: :json)
end
