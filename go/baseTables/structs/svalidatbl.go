package structs

// SValidaTbl é uma interface para validar tabelas
//  - Deve ser implementado um método que retorne Bool validando a execução ou não da tabela
type SValidaTbl struct {
	Valida func() bool
}

// GetValido vai retornar o resultado da função que foi informada
func (v *SValidaTbl) GetValido() bool {
	return v.Valida()
}

// SetValidacao pode adicionar uma nova função para validação
func (v *SValidaTbl) SetValidacao(f func() bool) {
	v.Valida = f
}
