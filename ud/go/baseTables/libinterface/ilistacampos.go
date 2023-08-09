package libinterface

// IListaCampos :
type IListaCampos interface {
	GetCampos() []ICampo
	AddCampo(c ICampo)
}
