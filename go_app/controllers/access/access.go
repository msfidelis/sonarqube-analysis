package access

import (
	"app/pkg/configuration"
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis"
)

// GET /ping
func Ping(c *gin.Context) {

	configs := configuration.Load()
	fmt.Println(configs.RedisURL)
	client := redis.NewClient(&redis.Options{
		Addr:     configs.RedisURL,
		Password: "",
		DB:       0,
	})

	result, err := client.Incr("counter").Result()
	if err != nil {
		panic(err)
	}

	c.JSON(200, gin.H{
		"message": "pong",
		"access":  result,
		"status":  200,
	})
}
