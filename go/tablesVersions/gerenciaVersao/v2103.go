package gerenciaversao

import (
	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
	tbs "github.com/DiogoMarcel/tablesVersions/tabelas"
	vrs "github.com/DiogoMarcel/tablesVersions/versao"
)

// Versao2103 : Versão de 2021 - Fevereiro
type Versao2103 struct {
	vrs.SVersao
}

// Identificacao : Identificar a versão corrente
func (s *Versao2103) Identificacao() {
	s.SetIdentificacao(cnt.V2102)
}

// CarregarVersao : Carregar os dados da versão corrente
func (s *Versao2103) CarregarVersao() ifc.IVersao {
	s.Identificacao()

	s.AddCriarTabela(new(tbs.Sv2103).TabelaPortador())

	return s
}
