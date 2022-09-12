class Instituicao < ApplicationRecord
    has_many :uorgs

    def children
        Instituicao.all.select{|i| i.pai == self.codigo}
    end

    def howmuch
        Instituicao.all.select{|i| i.pai == self.codigo}.size
    end

end
