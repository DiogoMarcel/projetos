package structs

import (
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// MEsquema : Map com esquema simplificado - Sem duplicações para geração da base
type MEsquema map[SEsquema]int

// GetEsquemaSimplificado :
func (e *MEsquema) GetEsquemaSimplificado(l ifc.IListaEsquema) *MEsquema {
	*e = make(MEsquema, 0)

	for _, v := range l.GetEsquemas() {
		se := new(SEsquema)
		se.Tipo = v.GetTipo()
		se.Descricao = v.GetNomeEsquema()

		if _, found := (*e)[*se]; !found {
			(*e)[*se] = v.GetEmpresa()
		}

		log.LogSis().Infof("(%s) Tipo: %s - Descri.: %s - Empresa: %v", "GetEsquemaSimplificado(): montartabelas.go", v.GetTipo().GetDescricao(), v.GetNomeEsquema(), v.GetEmpresa())
	}

	return e
}
