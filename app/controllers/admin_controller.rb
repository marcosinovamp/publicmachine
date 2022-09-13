class AdminController < ApplicationController
  def home
    @inst = Instituicao.all
    @uorgs = Uorg.all
    @adm_direta = @inst.select{|i| i.administracao == "Direta"}
    @adm_indireta = @inst.select{|i| i.administracao == "Indireta"}
    @empresas = @inst.select {|i| i.natureza == "Empresa Pública" || i.natureza == "Banco Público"}
    @ifes = @inst.select {|i| i.natureza == "IFES"}
    @ministerios = @inst.select {|i| i.natureza == "Ministério"}
    @reguladoras = @inst.select {|i| i.natureza == "Agência Reguladora"}
    @especiais = @inst.select {|i| i.natureza == "Autarquia de Natureza Especial"}
    @autaefund =  @inst.select {|i| i.natureza == "Autarquia/Fundação"}
    @bases = @inst.select {|i| i.administracao == "Não se aplica"}
    codes = []
    @inst.each do |y|
      codes << y.codigo
    end
    @militares = @inst.select{|i| codes.include?(i.pai) == false && i.pai != 0}
  end

  def unidade
    @instit = Instituicao.find(params[:id])
    @order = {"Gabinete" => 1, "Assessoria" => 2, "Secretaria-Executiva" => 3, "Secretaria Especial" => 4,"Secretaria" => 5, "Subsecretaria" => 6, "Departamento" => 7, "Coordenação-Geral" => 8, "Coordenação" => 9, "Divisão" => 10,"Equipe" => 11, "Conselho" => 12, "Comitê" => 13}
  end
end