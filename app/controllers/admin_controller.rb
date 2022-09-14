class AdminController < ApplicationController
  def home
    @bases = Instituicao.all.select {|i| i.administracao == "Não se aplica"}
    codes = []
    Instituicao.all.each do |y|
      codes << y.codigo
    end
    @militares = Instituicao.all.select{|i| codes.include?(i.pai) == false && i.pai != 0}
    @ordering = {"Gabinete" => 1, "Assessoria" => 2, "Vice-" => 3, "Secretaria" => 4, "Casa" => 5, "-Geral" => 6, "Banco Central" => 7, "Ministério" => 8}
    @kinds = {"Autarquia de Natureza Especial" => 1, "Agência Reguladora" => 2, "Autarquia/Fundação" => 3, "IFES" => 4, "Empresa Pública" => 5, "Banco Pública" => 6}
  end

  def unidade
    @instit = Instituicao.find(params[:id])
    @order = {"Gabinete" => 1, "Estado-Maior" => 1.2, "Comando d" => 1.5, "Assessoria" => 2, "Secretaria-Executiva" => 3, "Procuradoria" => 3, "Secretaria-Geral" => 3, "Secretaria Especial" => 4,"Secretaria" => 5, "Subsecretaria" => 6, "Departamento" => 7, "Coordenação-Geral" => 8, "Coordenação" => 9, "Divisão" => 10,"Equipe" => 11, "Conselho" => 12, "Comitê" => 13}
  end

  def numeros
    @inst = Instituicao.all
    @qtd_orgs = @inst.size
    @uorgs = Uorg.all
    @qtd_uorgs = @uorgs.size
    @adm_direta = @inst.select{|i| i.administracao == "Direta"}
    @qtd_uorgs_direta = 0
    @adm_direta.each do |a|
      @qtd_uorgs_direta += a.uorgs.size
    end
    @qtd_direta = @adm_direta.size
    @adm_indireta = @inst.select{|i| i.administracao == "Indireta"}
    @qtd_uorgs_indireta = 0
    @adm_indireta.each do |a|
      @qtd_uorgs_indireta += a.uorgs.size
    end
    @qtd_indireta = @adm_indireta.size
    @empresas = @inst.select{|i| i.natureza == "Empresa Pública"}
    @qtd_empresas = @empresas.size
    @bancos = @inst.select{|i| i.natureza == "Banco Público"}
    @qtd_bancos = @bancos.size
    @ifes = @inst.select {|i| i.natureza == "IFES"}
    @qtd_ifes = @ifes.size
    @ministerios = @inst.select {|i| i.natureza == "Ministério"}
    @qtd_ministerios = @ministerios.size
    @reguladoras = @inst.select {|i| i.natureza == "Agência Reguladora"}
    @qtd_reguladoras = @reguladoras.size
    @especiais = @inst.select {|i| i.natureza == "Autarquia de Natureza Especial"}
    @qtd_especiais = @especiais.size
    @autaefund =  @inst.select {|i| i.natureza == "Autarquia/Fundação"}
    @qtd_autfund = @autaefund.size
    @bases = @inst.select {|i| i.administracao == "Não se aplica"}
    @qtd_bases = @bases.size
    codes = []
    Instituicao.all.each do |y|
      codes << y.codigo
    end
    @militares = Instituicao.all.select{|i| codes.include?(i.pai) == false && i.pai != 0}
    @qtd_militares = @militares.size
  end

end