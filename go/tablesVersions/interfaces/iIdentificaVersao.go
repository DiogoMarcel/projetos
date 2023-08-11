package interfaces

import cnt "github.com/DiogoMarcel/tablesVersions/constantes"

// IIdentificaVersao : Interface para identificação de versão
type IIdentificaVersao interface {
	GetIdentificacao() string
	SetIdentificacao(pDescricao cnt.CVersoes)
}
