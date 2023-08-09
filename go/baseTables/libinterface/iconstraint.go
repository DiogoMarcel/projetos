package libinterface

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
)

// IConstraint : É uma interface para novas relações do tipo IConstraint
type IConstraint interface {
	GetConstraint() string
	TipoEsquema() cnt.CTipoEsquema
}
