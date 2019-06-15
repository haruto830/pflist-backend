package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello World in Docker !",
		})
	})

	router.StaticFS("/swagger", http.Dir("./static/swaggerui"))
	router.Run(":8080")

}
