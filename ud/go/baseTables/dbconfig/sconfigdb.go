package dbconfig

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	cnt "github.com/DiogoMarcel/baseTables/constantes"
	log "github.com/DiogoMarcel/baseTables/logsis"
)

// SConfigDB : Estrutura para configurar os dados de conexão com o banco de dados
type SConfigDB struct {
	host       string
	dbName     string
	port       string
	user       string
	password   string
	owner      string
	encoding   string
	tableSpace string
	template   string
}

func (c *SConfigDB) setConfig() {
	fmt.Println("TODO: Arquivo de leitura base.txt", "setConfig()", "sconfigdb.go")

	file, err := os.Open("./DiogoMarcel/baseTables/base.txt")

	log.LogSis().IfFatalln(err, "setConfig(): sconfigdb.go", "Não encontrou o arquivo")

	defer file.Close()

	scanner := bufio.NewScanner(file)

	mp := make(map[cnt.CConfigDB]string)

	for scanner.Scan() {
		// ln : No texto deve ter apenas um tipo e valor
		ln := strings.Split(scanner.Text(), ":")

		if len(ln) == 0 {
			log.LogSis().Panicln("setConfig(): sconfigdb.go", "Arquivo sem informações")
		} else {
			c := cnt.ToIDConfigDB[ln[0]]

			if _, found := (mp)[c]; !found {
				(mp)[c] = ln[1]
			}
		}
	}

	err = scanner.Err()
	log.LogSis().IfFatalln(err, "setConfig(): sconfigdb.go")

	c.setHost(mp[cnt.HOST])
	c.setDBName(mp[cnt.DBNAME])
	c.setUser(mp[cnt.USER])
	c.setPort(mp[cnt.PORT])
	c.setPassword(mp[cnt.PASSWORD])
	c.setOwner(mp[cnt.OWNER])
	c.setEncoding(mp[cnt.ENCODING])
	c.setTableSpace(mp[cnt.TABLESPACE])
	c.setTemplate(mp[cnt.TEMPLATE])
}

func (c *SConfigDB) validaSet(s *string, n cnt.CConfigDB) {
	if *s == "" {
		log.LogSis().Warningf("(%s) Campo não informado! [%s]", "validaSet(): sconfigdb.go", n.GetConfigDB())
		// log.WithFields(log.Fields{
		// 	"campo": n.Get(),
		// }).Warn("Campo não informado!")
	}
}

func (c *SConfigDB) setHost(host string) *SConfigDB {
	c.host = host
	c.validaSet(&host, cnt.HOST)
	return c
}

func (c *SConfigDB) setDBName(dbName string) *SConfigDB {
	c.dbName = dbName
	c.validaSet(&dbName, cnt.DBNAME)
	return c
}

func (c *SConfigDB) setPort(pt string) *SConfigDB {
	c.port = pt
	c.validaSet(&pt, cnt.PORT)
	return c
}

func (c *SConfigDB) setUser(us string) *SConfigDB {
	c.user = us
	c.validaSet(&us, cnt.USER)
	return c
}

func (c *SConfigDB) setPassword(ps string) *SConfigDB {
	c.password = ps
	c.validaSet(&ps, cnt.PASSWORD)
	return c
}

func (c *SConfigDB) setOwner(ow string) *SConfigDB {
	c.owner = ow
	c.validaSet(&ow, cnt.OWNER)
	return c
}

func (c *SConfigDB) setEncoding(en string) *SConfigDB {
	c.encoding = en
	c.validaSet(&en, cnt.ENCODING)
	return c
}

func (c *SConfigDB) setTableSpace(ts string) *SConfigDB {
	c.tableSpace = ts
	c.validaSet(&ts, cnt.TABLESPACE)
	return c
}

func (c *SConfigDB) setTemplate(tm string) *SConfigDB {
	c.template = tm
	c.validaSet(&tm, cnt.TEMPLATE)
	return c
}

func (c *SConfigDB) getHost() string       { return c.host }
func (c *SConfigDB) getDBName() string     { return c.dbName }
func (c *SConfigDB) getPort() string       { return c.port }
func (c *SConfigDB) getUser() string       { return c.user }
func (c *SConfigDB) getPassword() string   { return c.password }
func (c *SConfigDB) getOwner() string      { return c.owner }
func (c *SConfigDB) getEncoding() string   { return c.encoding }
func (c *SConfigDB) getTableSpace() string { return c.tableSpace }
func (c *SConfigDB) getTemplate() string   { return c.template }
