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

// CConfigDB : Type para informar configurações IOTA
type CConfigDB int

// ToIDConfigDB : Converter string para IOTA ConfigDB
// Aqui a string deve ser informada do mesmo modo que esta no arquivo
var ToIDConfigDB = map[string]CConfigDB{
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

// GetConfigDB converte o iota CConfigDB para uma string
func (c CConfigDB) GetConfigDB() string {
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
