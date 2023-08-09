package libinterface

import cnt "github.com/DiogoMarcel/baseTables/constantes"

// IEsquema : É uma interface para novos esquemas
type IEsquema interface {
	GetTipo() cnt.CTipoEsquema
	GetNomeEsquema() string
	GetNomeEsquemaLog() string
	GetEmpresa() int

	SetTipo(t cnt.CTipoEsquema)
	SetNomeEsquema(d string)
	SetEmpresa(e int)
}
