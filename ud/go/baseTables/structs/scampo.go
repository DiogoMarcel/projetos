package structs

import (
	"fmt"

	cnt "github.com/DiogoMarcel/baseTables/constantes"
)

// SCampo é uma estrutura genérica para um campo
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

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCPk

// TCPk : Campos Primary Key
type TCPk struct{ SCampo }

// SQL :
func (c *TCPk) SQL() string {
	return fmt.Sprintf("%s serial NOT NULL", c.Nome)

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

// GetNomeCampo :
func (c *TCPk) GetNomeCampo() string { return c.Nome }

// Adicionar funcionalidades do PK ...

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCFk

// TCFk : Campos Foreing Key
type TCFk struct{ SCampo }

// SQL :
func (c *TCFk) SQL() string {
	return ""
}

// GetNomeCampo :
func (c *TCFk) GetNomeCampo() string { return c.Nome }

// Adicionar funcionalidades do FK ...

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCInt

// TCInt : Campos Numeric
type TCInt struct{ SCampo }

// SetTamanho : Adicionar tamanho do campo inteiro - small/ int/ bigint
func (c *TCInt) SetTamanho(t cnt.CTamanhoInt) *TCInt {
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
	return fmt.Sprintf("%s integer", c.Nome)
}

// GetNomeCampo :
func (c *TCInt) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCNro

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
	return ""
}

// GetNomeCampo :
func (c *TCNro) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCChr

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

// SQL :
func (c *TCChr) SQL() string {
	return fmt.Sprintf("%s char(%v)", c.Nome, c.Tamanho)
}

// GetNomeCampo :
func (c *TCChr) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCVCr

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
	c.NotNull = false
	return c
}

// SQL :
func (c *TCVCr) SQL() string {
	return fmt.Sprintf("%s character varying(%v)", c.Nome, c.Tamanho)
}

// GetNomeCampo :
func (c *TCVCr) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCTxt

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

// SQL :
func (c *TCTxt) SQL() string {
	return ""
}

// GetNomeCampo :
func (c *TCTxt) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCDta

// TCDta : Campos
type TCDta struct{ SCampo }

// SQL :
func (c *TCDta) SQL() string {
	return fmt.Sprintf("%s date", c.Nome)
}

// GetNomeCampo :
func (c *TCDta) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCTSm - TimeStamp

// TCTSm : Campos
type TCTSm struct{ SCampo }

// SQL :
func (c *TCTSm) SQL() string {
	return ""
}

// GetNomeCampo :
func (c *TCTSm) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCLgc

// TCLgc : Campos
type TCLgc struct{ SCampo }

// SetDefault : Adicionar default
func (c *TCLgc) SetDefault(d bool) *TCLgc {
	c.Default = d
	return c
}

// SQL :
func (c *TCLgc) SQL() string {
	return ""
}

// GetNomeCampo :
func (c *TCLgc) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCOID

// TCOID : Campos
type TCOID struct{ SCampo }

// SQL :
func (c *TCOID) SQL() string {
	return ""
}

// GetNomeCampo :
func (c *TCOID) GetNomeCampo() string { return c.Nome }

// <> // <> // <> // <> // <> // <> // <> // <> // ------- Struct TCByt

// TCByt : Campos
type TCByt struct{ SCampo }

// SQL :
func (c *TCByt) SQL() string {
	return ""
}

// GetNomeCampo :
func (c *TCByt) GetNomeCampo() string { return c.Nome }
