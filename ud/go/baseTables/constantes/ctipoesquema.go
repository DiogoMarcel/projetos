package constantes

import (
	"bytes"
	"encoding/json"
)

const (
	// Sh000 : Esquemas
	Sh000 = iota
	// ShShare : Esquemas
	ShShare
	// ShEstoque : Esquemas
	ShEstoque
	// ShCliente : Esquemas
	ShCliente
	// ShMovimento : Esquemas
	ShMovimento
)

// CTipoEsquema é um tipo para os esquemas do banco
type CTipoEsquema int

var toStrEsquema = map[CTipoEsquema]string{
	Sh000:       "Sh000",
	ShShare:     "ShShare",
	ShEstoque:   "ShEstoque",
	ShCliente:   "ShCliente",
	ShMovimento: "ShMovimento",
}

var toIDEsquema = map[string]CTipoEsquema{
	"Sh000":       Sh000,
	"ShShare":     ShShare,
	"ShEstoque":   ShEstoque,
	"ShCliente":   ShCliente,
	"ShMovimento": ShMovimento,
}

// GetDescricao converte o iota CTIpoEsquema para uma string
func (e CTipoEsquema) GetDescricao() string {
	return [...]string{"Sh000", "ShShare", "ShEstoque", "ShCliente", "ShMovimento"}[e]
}

// MarshalJSON : carregar para o JSON o CTipoEsquema
func (e CTipoEsquema) MarshalJSON() ([]byte, error) {
	buffer := bytes.NewBufferString(`"`)
	buffer.WriteString(toStrEsquema[e])
	buffer.WriteString(`"`)
	return buffer.Bytes(), nil
}

// UnmarshalJSON : carregar de um JSON
func (e *CTipoEsquema) UnmarshalJSON(b []byte) error {
	var j string
	if err := json.Unmarshal(b, &j); err != nil {
		return err
	}
	*e = toIDEsquema[j]
	return nil
}
