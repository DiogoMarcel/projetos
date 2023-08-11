package versao

import (
	"fmt"

	cnt "github.com/DiogoMarcel/tablesVersions/constantes"
)

// SCampo : Estrutura de um campo da tabela
type SCampo struct {
	Nome    string      `json:"nome,omitempty"`
	Tamanho int         `json:"tamanho,omitempty"`
	Decimal int         `json:"decimal,omitempty"`
	Default interface{} `json:"default,omitempty"`
	NotNull bool        `json:"notnull,omitempty"`
}

// AddPk para adicionar um novo campo [Primary Key]
func (c *SCampo) AddPk(n string) *TCPk { return &TCPk{SCampo: SCampo{Nome: n}} }

// AddFk para adicionar um novo campo [Foreing Key]
func (c *SCampo) AddFk(n string) *TCFk { return &TCFk{SCampo: SCampo{Nome: n}} }

// AddNro para adicionar um novo campo [NUMERIC]
func (c *SCampo) AddNro(n string) *TCNro { return &TCNro{SCampo: SCampo{Nome: n}} }

// AddInt para adicionar um novo campo [INTEGER/NUMERIC]
func (c *SCampo) AddInt(n string) *TCInt { return &TCInt{SCampo: SCampo{Nome: n}} }

// AddChr para adicionar um novo campo [CHAR]
func (c *SCampo) AddChr(n string) *TCChr { return &TCChr{SCampo: SCampo{Nome: n}} }

// AddVCh para adicionar um novo campo [VARCHAR]
func (c *SCampo) AddVCh(n string) *TCVCr { return &TCVCr{SCampo: SCampo{Nome: n}} }

// AddTxt para adicionar um novo campo [TEXT]
func (c *SCampo) AddTxt(n string) *TCTxt { return &TCTxt{SCampo: SCampo{Nome: n}} }

// AddDta para adicionar um novo campo [DATE]
func (c *SCampo) AddDta(n string) *TCDta { return &TCDta{SCampo: SCampo{Nome: n}} }

// AddTSm para adicionar um novo campo [TIMESTAMP]
func (c *SCampo) AddTSm(n string) *TCTSm { return &TCTSm{SCampo: SCampo{Nome: n}} }

// AddLgc para adicionar um novo campo [BOOL]
func (c *SCampo) AddLgc(n string) *TCLgc { return &TCLgc{SCampo: SCampo{Nome: n}} }

// AddOID para adicionar um novo campo [OID]
func (c *SCampo) AddOID(n string) *TCOID { return &TCOID{SCampo: SCampo{Nome: n}} }

// AddByt para adicionar um novo campo [BYTEA]
func (c *SCampo) AddByt(n string) *TCByt { return &TCByt{SCampo: SCampo{Nome: n}} }

// GetNomeCampo :
func (c *SCampo) GetNomeCampo() string { return c.Nome }

// GetNotNull :
func (c *SCampo) GetNotNull() string {
	if c.NotNull {
		return "NOT NULL"
	}
	return ""
}

// GetDefault :
func (c *SCampo) GetDefault() string {
	switch v := c.Default.(type) {
	case int:
		return fmt.Sprintf(" DEFAULT %d", v)
	case string:
		return fmt.Sprintf(" DEFAULT %s", v)
	case float32:
		return fmt.Sprintf(" DEFAULT %f", v)
	default:
		return ""
	}
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCPk

// TCPk : Campos Primary Key
type TCPk struct{ SCampo }

// SetNotNull : Adicionar not null ao campo
func (c *TCPk) SetNotNull() *TCPk {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCPk) SQL() string {
	return fmt.Sprintf("%s serial %s %s", c.Nome, c.GetNotNull(), c.GetDefault())

	// campo := c.Nome + " "
	// campo += c.Tipo

	// if c.Tamanho != 0 {
	// 	campo += "("
	// 	campo += strconv.Itoa(c.Tamanho)
	// 	campo += ")"
	// }

	// if c.NotNull {
	// 	campo += "NOT NULL"
	// }

	// return campo

	/*
	   abc integer NOT NULL DEFAULT nextval('taba_abc_seq'::regclass),
	   descri character varying(33) COLLATE pg_catalog."default" NOT NULL,
	   CONSTRAINT taba_pkey PRIMARY KEY (abc, descri)
	*/
}

// Adicionar funcionalidades do PK ...

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCFk

// TCFk : Campos Foreing Key
type TCFk struct{ SCampo }

// SetNotNull : Adicionar not null ao campo
func (c *TCFk) SetNotNull() *TCFk {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCFk) SQL() string {
	return ""
}

// Adicionar funcionalidades do FK ...

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCInt

// TCInt : Campos Numeric
type TCInt struct{ SCampo }

// SetTamanho : Adicionar tamanho do campo inteiro - small/ int/ bigint
func (c *TCInt) SetTamanho(t cnt.CTamanhoInteger) *TCInt {
	c.Tamanho = t.GetTamanhoInt()
	return c
}

// SetDefault : Adicionar default
func (c *TCInt) SetDefault(d int) *TCInt {
	c.Default = d
	return c
}

// SetNotNull : Adicionar not null ao campo
func (c *TCInt) SetNotNull() *TCInt {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCInt) SQL() string {
	return fmt.Sprintf("%s integer %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCNro

// TCNro : Campos Numeric
type TCNro struct{ SCampo }

// SetTamanho : Adicionar tamanho do campo
func (c *TCNro) SetTamanho(t int) *TCNro {
	c.Tamanho = t
	return c
}

// SetDecimal : Adicionar decimal ao campo numeric
func (c *TCNro) SetDecimal(d int) *TCNro {
	c.Decimal = d
	return c
}

// SetDefault : Adicionar default
func (c *TCNro) SetDefault(d float64) *TCNro {
	c.Default = d
	return c
}

// SetNotNull : Adicionar not null ao campo
func (c *TCNro) SetNotNull() *TCNro {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCNro) SQL() string {
	return fmt.Sprintf("%s numeric(%d, %d) %s %s", c.Nome, c.Tamanho, c.Decimal, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCChr

// TCChr é um campo Char
type TCChr struct{ SCampo }

// SetTamanho : Adicionar tamanho do campo
func (c *TCChr) SetTamanho(t int) *TCChr {
	c.Tamanho = t
	return c
}

// SetDefault : Adicionar default
func (c *TCChr) SetDefault(d string) *TCChr {
	c.Default = d
	return c
}

// SetNotNull : Adicionar not null ao campo
func (c *TCChr) SetNotNull() *TCChr {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCChr) SQL() string {
	return fmt.Sprintf("%s char(%v) %s %s", c.Nome, c.Tamanho, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCVCr

// TCVCr : Campos
type TCVCr struct{ SCampo }

// SetTamanho : Adicionar tamanho do campo
func (c *TCVCr) SetTamanho(t int) *TCVCr {
	c.Tamanho = t
	return c
}

// SetDefault : Adicionar default
func (c *TCVCr) SetDefault(d string) *TCVCr {
	c.Default = d
	return c
}

// SetNotNull : Adicionar not null ao campo
func (c *TCVCr) SetNotNull() *TCVCr {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCVCr) SQL() string {
	return fmt.Sprintf("%s character varying(%v) %s %s", c.Nome, c.Tamanho, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCTxt

// TCTxt : Campos
type TCTxt struct{ SCampo }

// SetTamanho : Adicionar tamanho do campo
func (c *TCTxt) SetTamanho(t int) *TCTxt {
	c.Tamanho = t
	return c
}

// SetDefault : Adicionar default
func (c *TCTxt) SetDefault(d string) *TCTxt {
	c.Default = d
	return c
}

// SetNotNull : Adicionar not null ao campo
func (c *TCTxt) SetNotNull() *TCTxt {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCTxt) SQL() string {
	return fmt.Sprintf("%s text %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCDta

// TCDta : Campos
type TCDta struct{ SCampo }

// SetNotNull : Adicionar not null ao campo
func (c *TCDta) SetNotNull() *TCDta {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCDta) SQL() string {
	return fmt.Sprintf("%s date %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCTSm - TimeStamp

// TCTSm : Campos
type TCTSm struct{ SCampo }

// SetNotNull : Adicionar not null ao campo
func (c *TCTSm) SetNotNull() *TCTSm {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCTSm) SQL() string {
	return fmt.Sprintf("%s timestamp with time zone %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCLgc

// TCLgc : Campos
type TCLgc struct{ SCampo }

// SetDefault : Adicionar default
func (c *TCLgc) SetDefault(d bool) *TCLgc {
	c.Default = d
	return c
}

// SetNotNull : Adicionar not null ao campo
func (c *TCLgc) SetNotNull() *TCLgc {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCLgc) SQL() string {
	return fmt.Sprintf("%s boolean %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCOID

// TCOID : Campos
type TCOID struct{ SCampo }

// SetNotNull : Adicionar not null ao campo
func (c *TCOID) SetNotNull() *TCOID {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCOID) SQL() string {
	return fmt.Sprintf("%s oid %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}

// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> //
// <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCByt

// TCByt : Campos
type TCByt struct{ SCampo }

// SetNotNull : Adicionar not null ao campo
func (c *TCByt) SetNotNull() *TCByt {
	c.NotNull = true
	return c
}

// SQL :
func (c *TCByt) SQL() string {
	return fmt.Sprintf("%s bytea %s %s", c.Nome, c.GetNotNull(), c.GetDefault())
}
