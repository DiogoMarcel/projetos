package libtabela

import (
	cnt "github.com/DiogoMarcel/baseTables/constantes"
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// SetListaEp000 : Lista de tabelas ep000
func SetListaEp000(l ifc.IListaTabela) {
	l.AddTabela(newTbPassword())
}

func newTbPassword() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbPassword())

	t.AddCampo(cps.AddInt("CODIGO_SNH").SetTamanho(cnt.CINTEGER))
	t.AddCampo(cps.AddVCh("NOMEUS_SNH").SetTamanho(30))

	return t
}
