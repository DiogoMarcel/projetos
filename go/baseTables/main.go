package main

import (
	"time"

	lst "github.com/DiogoMarcel/baseTables/adlistas"
	cdb "github.com/DiogoMarcel/baseTables/dbconfig" // já fez um CDB pai?
	gtb "github.com/DiogoMarcel/baseTables/gerardb"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// go run -race main.go (verificar se há possibilidade de da ruim ...)

// atualizarDB : Método principal para atualizar a base de dados
func atualizarDB() {
	// A conexão será inicializada na função INIT da package dbconfig
	defer cdb.CloseDB() /*Fechar a conexão apenas ao finalizar a atualização*/

	gtb.PadraoInicial() /*Verificar se as configurações iniciais do DB já estão atualizadas*/

	ltb := new(lst.SListasEsqTbl) /*Estrutura principal com as listas de esquemas e tabelas*/
	ltb.SetListas()               /*Carregar lista de esquemas e tabelas e realizar o vínculo entre ambas*/

	gtb.GerarEsquemas(ltb)    /*Geração de esquemas*/
	gtb.GerarTabelas(ltb)     /*Geração de tabelas*/
	gtb.GerarConstraints(ltb) /*Geração de Constraints entre tabelas*/

	// // teste limpar esquemas para saber se copiou ou vinculou
	// for k := range *ltb.GetE().GetMap() {
	// 	log.Println("Removendo", k, "len:", len(*ltb.GetE().GetMap()))
	// 	delete(*ltb.GetE().GetMap(), k)
	// }

	// for k := range *ltb.GetE().GetMap() {
	// 	log.Println("Ainda tem ", k)
	// }

	// for _, v := range *ltb.GetT().GetLista() {
	// 	if v.Validar() {
	// 		//v.SetSchema("marcel")
	// 		log.Println(v.Validar())
	// 		log.Println("getNomeTabela(): ", v.GetNomeTabela())
	// 	} else {
	// 		log.Println("FALSE na tabela: ", v.GetNomeTabela())
	// 	}
	// }
}

func main() {
	tempo := time.Now() // Log tempo de execução
	defer func(t time.Time) {
		log.LogSis().LogEncerramento("(%s) Tabelas atualizadas com sucesso!\n\nTempo percorrido: %s", "main()", time.Now().Sub(t))
	}(tempo)

	atualizarDB() // executar a atualização
}
