package versao

import cnt "github.com/DiogoMarcel/tablesVersions/constantes"

// Estrutura para identificação de versão
type sIdentificaVersao struct {
	FVersao cnt.CVersoes
}

// GetIdentificacao : Descrição para identificação de versão
func (s *sIdentificaVersao) GetIdentificacao() string {
	return cnt.ToStringVersoes[s.FVersao]
}

// IdentifcaVersaoVersao : Descrição para identificação de versão
func (s *sIdentificaVersao) SetIdentificacao(pDescricao cnt.CVersoes) {
	s.FVersao = pDescricao
}
