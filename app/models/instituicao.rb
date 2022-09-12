class Instituicao < ApplicationRecord
    has_many :uorgs

    # def filhos
    #     # @children = Instituicao.all.select{|i| i.pai == self.codigo}
    #     @children = Uorg.all.select{|u| u.pai == self.codigo}
    #     if @children.nil? == false || @children.empty? == false
    #         @children.each do |c|
    #             puts "#{c.nome} - #{c.sigla}"
    #         end
    #     end
    # end
    
    # def pai
    #     if self.pai.nil? == false || self.pai != 0
    #         @pai = Uorg.find_by(codigo: self.pai)
    #         puts "#{@pai.nome} - #{@pai.sigla}"
    #     end
    # end  

end
