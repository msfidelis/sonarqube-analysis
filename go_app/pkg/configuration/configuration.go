package configuration

import (
	"fmt"
	"os"
	"strings"

	"github.com/tkanos/gonfig"
)

type Configuration struct {
	Port     int
	RedisURL string
}

func Load() Configuration {
	configuration := Configuration{}
	env := os.Getenv("ENVIRONMENT")
	if env == "" {
		env = "prod"
	}
	path := fmt.Sprintf("configs/%s.json", strings.ToLower(env))
	fmt.Println(path)
	err := gonfig.GetConf(path, &configuration)
	if err != nil {
		panic(err)
	}
	return configuration
}
