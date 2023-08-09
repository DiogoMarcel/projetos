package funcs

import (
	"fmt"

	log "github.com/sirupsen/logrus" // Espero ter apenas um logrus no sistema
)

// LogSistema : Estrutura para utilização de receiver em impressões de logs
type LogSistema struct{}

// LogEncerramento : Log para encerramento - Para tratar a mensagem...
func (l *LogSistema) LogEncerramento(format string, args ...interface{}) {
	jf := &log.JSONFormatter{}
	jf.DisableTimestamp = false

	log.SetFormatter(jf)

	if impLogs {
		log.Infof(format, args...)
	} else {
		fmt.Printf(format+"\n", args...)
	}
}

// Println logs
func (l *LogSistema) Println(args ...interface{}) {
	if impLogs {
		log.Println(args...)
	}
}

// Infoln logs
func (l *LogSistema) Infoln(args ...interface{}) {
	if impLogs {
		log.Infoln(args...)
	}
}

// Warnln logs
func (l *LogSistema) Warnln(args ...interface{}) {
	if impLogs {
		log.Warnln(args...)
	}
}

// Warningln logs
func (l *LogSistema) Warningln(args ...interface{}) {
	if impLogs {
		log.Warningln(args...)
	}
}

// Errorln logs
func (l *LogSistema) Errorln(args ...interface{}) {
	if impLogs {
		log.Errorln(args...)
	}
}

// Panicln logs
func (l *LogSistema) Panicln(args ...interface{}) {
	if impLogs {
		log.Panicln(args...)
	}
}

// IfFatalln logs
func (l *LogSistema) IfFatalln(err error, args ...interface{}) {
	if err != nil {
		args = append(args, err)
		log.Fatalln(args...)
	}
}

// Infof logs
func (l *LogSistema) Infof(format string, args ...interface{}) {
	if impLogs {
		log.Infof(format, args...)
	}
}

// Warnf logs
func (l *LogSistema) Warnf(format string, args ...interface{}) {
	if impLogs {
		log.Warnf(format, args...)
	}
}

// Warningf logs
func (l *LogSistema) Warningf(format string, args ...interface{}) {
	if impLogs {
		log.Warningf(format, args...)
	}
}

// Errorf logs
func (l *LogSistema) Errorf(format string, args ...interface{}) {
	if impLogs {
		log.Errorf(format, args...)
	}
}

// Panicf logs
func (l *LogSistema) Panicf(format string, args ...interface{}) {
	if impLogs {
		log.Panicf(format, args...)
	}
}

// Fatalf logs
func (l *LogSistema) Fatalf(format string, args ...interface{}) {
	if impLogs {
		log.Fatalf(format, args...)
	}
}
