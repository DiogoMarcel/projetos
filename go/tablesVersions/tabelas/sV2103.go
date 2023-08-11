package tabelas

import (
	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
)

// STabelasIniciais : Estrutura para carregar as tabelas da versão v2102
type Sv2103 struct{ sPadraoTabelas }

//func (s *STabelasIniciais) GetTabelaVersao() ifc.ICriarTabela {
func (s *Sv2103) TabelaPortador() ifc.ICriarTabela {

	s.FTabelaCriar.SetTabela(s.FNomeTabela.TabelaPortador())
	s.FTabelaCriar.AddCampo(s.FCampos.AddInt("Marcel").SetTamanho(cnt.CBIGINT))

	return &s.FTabelaCriar
}
