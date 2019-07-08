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

	router.GET("/list", func(c *gin.Context) {
		db := gormInit()
		defer db.Close()

		portfolio := []Portfolio{}
		db.Find(&portfolio)

		c.JSON(200, portfolio)
	})

	router.POST("/list", func(c *gin.Context) {
		db := gormInit()
		defer db.Close()

		portfolio := Portfolio{}
		portfolio.UserID = 1
		portfolio.PortfolioTitle = "INSERTテスト用ポートフォリオ"
		portfolio.PortfolioOverview = "Insertされたデータです"

		db.Create(&portfolio)

		c.JSON(200, portfolio)
	})

	router.GET("/list/:portfolioId", func(c *gin.Context) {
		db := gormInit()
		defer db.Close()

		portfolio := Portfolio{}
		portfolioid := c.Param("portfolioId")

		db.Where("portfolio_id = ?", portfolioid).Find(&portfolio)

		c.JSON(200, portfolio)
	})

	router.PUT("/list/:portfolioId/nice", func(c *gin.Context) {
		db := gormInit()
		defer db.Close()

		portfolio := Portfolio{}
		portfolioid := c.Param("portfolioId")

		db.Select("nice_count").Where("portfolio_id = ?", portfolioid).Find(&portfolio)
		updateNiceCount := portfolio.NiceCount + 1

		db.Model(&portfolio).Where("portfolio_id = ?", portfolioid).Update("nice_count", updateNiceCount)

		c.JSON(200, gin.H{
			"niceCount": &portfolio.NiceCount,
		})
	})

	router.DELETE("/list/:portfolioId", func(c *gin.Context) {
		db := gormInit()
		defer db.Close()

		portfolio := Portfolio{}
		portfolioid := c.Param("portfolioId")

		db.Where("portfolio_id = ?", portfolioid).Delete(&portfolio)

		c.String(http.StatusOK, "OK")
	})

	router.Run(":8080")

}
