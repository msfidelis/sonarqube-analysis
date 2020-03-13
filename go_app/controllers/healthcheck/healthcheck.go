package healthcheck

import "github.com/gin-gonic/gin"

// GET /healthcheck
func Get(c *gin.Context) {
	c.JSON(200, gin.H{
		"status": 200,
	})
}
