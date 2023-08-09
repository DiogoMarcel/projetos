package gerardb

import lst "github.com/DiogoMarcel/baseTables/adlistas"

// //cdb "github.com/DiogoMarcel/baseTables/dbconfig"
// lst "github.com/DiogoMarcel/baseTables/adlistas"
// ifc "github.com/DiogoMarcel/baseTables/libinterface"
// log "github.com/DiogoMarcel/baseTables/logsis"
// sts "github.com/DiogoMarcel/baseTables/structs"

// GerarEsquemas : Utilizado para geração de tabelas no sistema
func GerarEsquemas(ls *lst.SListasEsqTbl) {
	gsh := new(gerarEsquema)

	// gtb.tabelas = ls.GetListaTabela()
	// gtb.mpEsquema = ls.GetEsquemaSimplificado(&ls.SListaEsquema)

	gsh.startGerarEsquema()
}

// gerarEsquema : Estrutura para geração de esquemas
type gerarEsquema struct {
	// tabelas   ifc.IListaTabela
	// mpEsquema *sts.MEsquema
}

func (s *gerarEsquema) startGerarEsquema() {

}
