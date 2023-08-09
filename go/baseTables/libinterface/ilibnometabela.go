package libinterface

import cnt "github.com/DiogoMarcel/baseTables/constantes"

// ILibNomeTabela : É uma interface para nome, extensão e tipo de esquema para cada tabela
type ILibNomeTabela interface {
	GetNomeTabela() string
	GetExtensao() string
	GetTipoEsquema() cnt.CTipoEsquema

	SetNomeTabela(n string)
	SetExtensao(e string)
	SetTipoEsquema(t cnt.CTipoEsquema)
}
