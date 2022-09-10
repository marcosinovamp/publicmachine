class UnOrg < ApplicationRecord

    def pai
        UnOrg.find_by(código: self.unidade_pai)
    end

    def filhos
        UnOrg.all.select{ |o| o.unidade_pai == self.código}
    end

    def orgao
        UnOrg.find_by(código: self.orgao_entidade)
    end

    def estrutura
        UnOrg.all.select{ |o| o.orgao_entidade == self.código}
    end

end
