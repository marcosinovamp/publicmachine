# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "http://estruturaorganizacional.dados.gov.br/doc/estrutura-organizacional/completa"
inter = URI.open(url).read
orgs = JSON.parse(inter)

orgs["unidades"].each do |u|
    UnOrg.create(nome: u["nome"], sigla: u["sigla"], código: u["codigoUnidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", ""), tipo: u["codigoTipoUnidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/tipo-unidade/", ""), unidade_pai: u["codigoUnidadePai"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", ""), orgao_entidade: u["codigoOrgaoEntidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", ""))
end
