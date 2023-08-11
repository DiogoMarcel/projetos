package constantes

const (
	// HOST : Ip
	HOST = iota
	// DBNAME : Nome
	DBNAME
	// PORT : Porta
	PORT
	// USER : Usuário
	USER
	// PASSWORD : Senha
	PASSWORD
	// OWNER : Alguns DB utilizam para criar o server
	OWNER
	// ENCODING : Encoding do banco
	ENCODING
	// TABLESPACE : Alguns DB utilizam para criar o server
	TABLESPACE
	// TEMPLATE : Alguns DB utilizam para criar o server
	TEMPLATE
)

// CHostConfiguracao : Configurações de conexão com o banco de dados
type CHostConfiguracao int

// ToIDConfigDB : Converter string para IOTA ConfigDB
// Aqui a string deve ser informada do mesmo modo que esta no arquivo
var ToIDConfigDB = map[string]CHostConfiguracao{
	"host ":      HOST,
	"dbName":     DBNAME,
	"port":       PORT,
	"user":       USER,
	"password":   PASSWORD,
	"owner":      OWNER,
	"encoding":   ENCODING,
	"tableSpace": TABLESPACE,
	"template":   TEMPLATE,
}

// GetHostConfiguracao converte o iota CHostConfiguracao para uma string
func (c CHostConfiguracao) GetHostConfiguracao() string {
	return [...]string{"host",
		"dbName",
		"port",
		"user",
		"password",
		"owner",
		"encoding",
		"tableSpace",
		"template"}[c]
}
