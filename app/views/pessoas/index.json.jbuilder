json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome, :cpf, :email, :cel, :proprietario
  json.url pessoa_url(pessoa, format: :json)
end
