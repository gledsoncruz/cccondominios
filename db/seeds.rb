# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@admin.com', password: '@admin123#')

bela = Condominio.create(nome: 'Residencial Bela Roma', cnpj: '42424242')

30.times do |i|
	bloco = Bloco.create(descricao: "BLOCO #{i}", sigla: "BL- #{i}", condominio: bela)

	12.times do |a|
		unidade = Unidade.create(numero: "#{a}", piso: "001", bloco: bloco)

		4.times do |p|
			pessoa = Pessoa.create(nome: "Pessoa #{p}", dta_nasc: Time.now, sexo: "M", tipo: "tipo")
			UnidadePessoa.create(unidade: unidade, pessoa: pessoa)
		end
	end

end
