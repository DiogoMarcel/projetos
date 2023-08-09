package libtabela

import (
	ifc "github.com/DiogoMarcel/baseTables/libinterface"
)

// TbCfgEsquema : Tabela de configurações de esquemas
func TbCfgEsquema() ifc.ITabela {
	t := tbs.NovaTabela(tbn.TbCfgEsquema())

	t.AddCampo(cps.AddPk("id"))
	t.AddCampo(cps.AddInt("empresa"))
	t.AddCampo(cps.AddVCh("esqmovto").SetTamanho(5).SetNotNull())
	t.AddCampo(cps.AddVCh("esqcliente").SetTamanho(5).SetNotNull())
	t.AddCampo(cps.AddVCh("esqestoque").SetTamanho(5).SetNotNull())

	return t
}

// TbHashTabela :
func TbHashTabela() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbHashVerificacao())

	t.AddCampo(cps.AddPk("id_hash"))
	t.AddCampo(cps.AddVCh("codhash").SetTamanho(65))
	t.AddCampo(cps.AddVCh("esquema").SetTamanho(10))
	t.AddCampo(cps.AddVCh("tabela").SetTamanho(20))
	t.AddCampo(cps.AddInt("empresa"))

	return t
}

// TbOutra :
func TbOutra() ifc.ITabela {

	t := tbs.NovaTabela(tbn.TbOutraCfg())

	t.AddCampo(cps.AddPk("id_outra"))
	t.AddCampo(cps.AddInt("empresa"))

	return t
}
