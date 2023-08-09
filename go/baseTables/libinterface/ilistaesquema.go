package libinterface

// IListaEsquema :
type IListaEsquema interface {
	AddEsquema(s IEsquema) []IEsquema
	GetEsquemas() []IEsquema
	LogEsquemas()
}
