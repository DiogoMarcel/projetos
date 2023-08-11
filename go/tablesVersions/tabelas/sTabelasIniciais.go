package tabelas

import (
	ifc "github.com/DiogoMarcel/tablesVersions/interfaces"
)

// STabelasIniciais : Estrutura para carregar as tabelas iniciais
type STabelasIniciais struct{ sPadraoTabelas }

// GetTabelaVersao : Tabela de versão do sistema
func (s *STabelasIniciais) GetTabelaVersao() ifc.ICriarTabela {

	s.FTabelaCriar.SetTabela(s.FNomeTabela.TabelaVersao())
	s.FTabelaCriar.AddCampo(s.FCampos.AddChr("Diogo").SetDefault("B").SetNotNull().SetTamanho(30))

	return &s.FTabelaCriar
}

//func (s *Sv2103) AlterarTabelaHash() ifc.IAlterarTabela {
