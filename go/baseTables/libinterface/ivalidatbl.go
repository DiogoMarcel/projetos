package libinterface

// IValidaTbl é uma interface para validar tabelas
//  - Deve ser implementado um método que retorne Bool validando a execução ou não da tabela
type IValidaTbl interface {
	GetValido() bool
	SetValidacao(f func() bool)
}
