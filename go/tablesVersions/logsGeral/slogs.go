package logsgeral

import (
	"fmt"
	"os"

	log "github.com/sirupsen/logrus" // Espero ter apenas um logrus no sistema
)

const impLogs = true // deseja imprimir logs no sistema? basta alterar o valor da constante...

// init para geração de logs
func init() {
	// Armazenar todos os logs em um arquivo único
	if impLogs {
		setArquivoLog()
	}

	// inicializar a var local
	lg = new(LogSistema)
}

// Criar variável inacessível externamente mas que pode ser utilizada para os logs
var lg *LogSistema

// LogSis : Logs impressão no sistema
func LogSis() *LogSistema {
	return lg
}

// setArquivoLog : Direcionar os logs para um arquivo único
func setArquivoLog() {
	fmt.Println("TODO: Arquivo de log logs.txt", "setArquivoLog()", "slogs.go")
	//file := "./DiogoMarcel/baseTables/logs.txt"
	file := "logs.txt"
	if fileexists(file) {
		removefile(file)
	}
	fileLog(file)

	jf := &log.JSONFormatter{}
	jf.DisableTimestamp = true

	log.SetFormatter(jf)
}

func fileLog(f string) {
	aLog, err := os.OpenFile(f, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)

	if err != nil {
		log.Fatal(err)
	}

	log.SetOutput(aLog)
}

func fileexists(f string) bool {
	if _, err := os.Stat(f); err != nil {
		if os.IsNotExist(err) {
			return false
		}
	}
	return true
}

func removefile(f string) {
	err := os.Remove(f)

	if err != nil {
		log.Fatal(err)
	}
}
