package main

import (
	"fmt"
	"time"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

type Portfolio struct {
	PortfolioID       int       `gorm:"AUTO_INCREMENT"　json:portfolio_id`
	UserID            int       `json:user_id`
	PortfolioTitle    string    `json:portfolio_title`
	PortfolioOverview string    `json:portfolio_overview`
	PortfolioAppeal   string    `json:portfolio_appeal`
	PortfolioTerm     int       `json:portfolio_term`
	PortfolioState    string    `json:portfolio_state`
	NiceCount         int       `json:nice_count`
	InsertDate        time.Time `gorm:"DEFAULT:time.now()" json:insert_date`
	UpdateDate        time.Time `gorm:"DEFAULT:time.now()" json:update_date`
	DeleteFlag        int       `gorm:"DEFAULT:0" json:delete_flag`
}

func gormInit() *gorm.DB {
	DBMS := "mysql"
	USER := "root"
	PASS := "mysql"
	PROTOCOL := "tcp(db:3306)"
	DBNAME := "pflist"
	CONNECT := USER + ":" + PASS + "@" + PROTOCOL + "/" + DBNAME + "?parseTime=true"
	db, err := gorm.Open(DBMS, CONNECT)

	if err != nil {
		panic(err.Error())
	}
	fmt.Println("db connected: ", &db)
	return db
}
