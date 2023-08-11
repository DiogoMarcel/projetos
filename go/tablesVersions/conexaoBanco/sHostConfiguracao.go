package conexaobanco

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
	log "github.com/DiogoMarcel/tablesVersions/logsGeral"
)

// SConfigDB : Estrutura para configurar os dados de conexão com o banco de dados
type SConfigDB struct {
	Fhost       string
	FdbName     string
	Fport       string
	Fuser       string
	Fpassword   string
	Fowner      string
	Fencoding   string
	FtableSpace string
	Ftemplate   string
}

func (c *SConfigDB) setConfig() {
	fmt.Println("TODO: Arquivo de leitura base.txt", "setConfig()", "sHostConfiguracao.go")

	//file, err := os.Open("./DiogoMarcel/baseTables/base.txt")
	file, err := os.Open("base.txt")

	log.LogSis().IfFatalln(err, "setConfig(): sconfigdb.go", "Não encontrou o arquivo")

	defer file.Close()

	scanner := bufio.NewScanner(file)

	mp := make(map[cnt.CHostConfiguracao]string)

	for scanner.Scan() {
		// ln : No texto deve ter apenas um tipo e valor
		ln := strings.Split(scanner.Text(), ":")

		if len(ln) == 0 {
			log.LogSis().Panicln("setConfig(): sHostConfiguracao.go", "Arquivo sem informações")
		} else {
			c := cnt.ToIDConfigDB[ln[0]]

			if _, found := (mp)[c]; !found {
				(mp)[c] = ln[1]
			}
		}
	}

	err = scanner.Err()
	log.LogSis().IfFatalln(err, "setConfig(): sHostConfiguracao.go")

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

func (c *SConfigDB) validaSet(pVar *string, pName cnt.CHostConfiguracao) {
	if *pVar == "" {
		log.LogSis().Warningf("(%s) Campo não informado! [%s]", "validaSet(): sHostConfiguracao.go", pName.GetHostConfiguracao())
		// log.WithFields(log.Fields{
		// 	"campo": n.Get(),
		// }).Warn("Campo não informado!")
	}
}

func (c *SConfigDB) setHost(host string) *SConfigDB {
	c.Fhost = host
	c.validaSet(&host, cnt.HOST)
	return c
}

func (c *SConfigDB) setDBName(dbName string) *SConfigDB {
	c.FdbName = dbName
	c.validaSet(&dbName, cnt.DBNAME)
	return c
}

func (c *SConfigDB) setPort(pt string) *SConfigDB {
	c.Fport = pt
	c.validaSet(&pt, cnt.PORT)
	return c
}

func (c *SConfigDB) setUser(us string) *SConfigDB {
	c.Fuser = us
	c.validaSet(&us, cnt.USER)
	return c
}

func (c *SConfigDB) setPassword(ps string) *SConfigDB {
	c.Fpassword = ps
	c.validaSet(&ps, cnt.PASSWORD)
	return c
}

func (c *SConfigDB) setOwner(ow string) *SConfigDB {
	c.Fowner = ow
	c.validaSet(&ow, cnt.OWNER)
	return c
}

func (c *SConfigDB) setEncoding(en string) *SConfigDB {
	c.Fencoding = en
	c.validaSet(&en, cnt.ENCODING)
	return c
}

func (c *SConfigDB) setTableSpace(ts string) *SConfigDB {
	c.FtableSpace = ts
	c.validaSet(&ts, cnt.TABLESPACE)
	return c
}

func (c *SConfigDB) setTemplate(tm string) *SConfigDB {
	c.Ftemplate = tm
	c.validaSet(&tm, cnt.TEMPLATE)
	return c
}

func (c *SConfigDB) getHost() string       { return c.Fhost }
func (c *SConfigDB) getDBName() string     { return c.FdbName }
func (c *SConfigDB) getPort() string       { return c.Fport }
func (c *SConfigDB) getUser() string       { return c.Fuser }
func (c *SConfigDB) getPassword() string   { return c.Fpassword }
func (c *SConfigDB) getOwner() string      { return c.Fowner }
func (c *SConfigDB) getEncoding() string   { return c.Fencoding }
func (c *SConfigDB) getTableSpace() string { return c.FtableSpace }
func (c *SConfigDB) getTemplate() string   { return c.Ftemplate }
