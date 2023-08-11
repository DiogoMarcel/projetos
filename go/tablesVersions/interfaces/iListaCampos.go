package interfaces

// IListaCampos : Interface para lista de campos a adicionar na tabela
type IListaCampos interface {
	GetCampos() []ICampo
	AddCampo(pCampo ICampo) []ICampo
}
