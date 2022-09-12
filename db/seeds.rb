# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"
require "json"
require "open-uri"

filepath = "db/Instit.csv"

CSV.foreach(filepath) do |row|
  Instituicao.create(codigo: row[0].to_i, nome: row[1].gsub("$§", ","), sigla: row[2], pai: row[3].to_i, tipo: row[5], natureza: row[8])
end

url = "http://estruturaorganizacional.dados.gov.br/doc/estrutura-organizacional/completa"
rascunho = URI.open(url).read
orgs = JSON.parse(rascunho)

orgs["unidades"].each do |o|
    if o["codigoEsfera"].nil? || o["codigoEsfera"].empty? || o["codigoEsfera"].gsub("http://estruturaorganizacional.dados.gov.br/id/esfera/", "").to_i == 1
        if o["codigoPoder"].nil? || o["codigoPoder"].empty? || o["codigoPoder"].gsub("http://estruturaorganizacional.dados.gov.br/id/poder/", "").to_i == 1
            @neworg = Uorg.new(codigo: o["codigoUnidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", "").to_i, nome: o["nome"], sigla: o["sigla"], pai: o["codigoUnidadePai"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", "").to_i, tipo: o["codigoTipoUnidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/tipo-unidade/", ""))
            if Instituicao.find_by(codigo: o["codigoOrgaoEntidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", "").to_i).nil? == false && o["codigoOrgaoEntidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", "").to_i != 0
                @neworg.instituicao_id = Instituicao.find_by(codigo: o["codigoOrgaoEntidade"].gsub("http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/", "").to_i).id
            end
            @neworg.save
        end
    end
end
