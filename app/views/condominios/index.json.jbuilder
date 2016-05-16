json.array!(@condominios) do |condominio|
  json.extract! condominio, :id, :nome, :cnpj, :endereco, :cidade, :uf, :cep
  json.url condominio_url(condominio, format: :json)
end
