package libfuncoes

import (
	"crypto/sha256"
	"fmt"
)

// GetHASH : função para gerar um hash code para cada tabela
func GetHASH(obj interface{}) string {
	h := sha256.New()
	h.Write([]byte(fmt.Sprintf("%v", obj)))
	return fmt.Sprintf("%x", h.Sum(nil))
}
