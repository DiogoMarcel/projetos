package main

import (
	"time"

	cdb "github.com/DiogoMarcel/tablesVersions/conexaoBanco"
	ger "github.com/DiogoMarcel/tablesVersions/gerenciaVersao"
	log "github.com/DiogoMarcel/tablesVersions/logsGeral"
)

// main : Método para execução geral do sistema
func main() {
	tempoExecucao := time.Now()
	defer func(t time.Time) {
		cdb.CloseDB()
		log.LogSis().LogEncerramento("(%s) Atualização de tabelas encerrado! - Tempo percorrido: %s", "main()", time.Now().Sub(t))
	}(tempoExecucao)

	new(ger.SGerenciaVersao).Executar()
}
