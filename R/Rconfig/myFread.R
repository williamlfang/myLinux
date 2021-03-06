## =============================================================================
## myFread.R
##
## 用于读取数据　csv 文件
##
## 1.FUN: myFreadHFT
## 用于处理　HFT 高频数据
##
## 2.FUN: myFreadBar
## 用于处理　Bar 数据
##
## 3.FUN: myFreadFromDC
## 用于处理　FromDC 的那份数据
##
## Input:
## data.csv
##
## Outpus:
## data.table::dt
## =============================================================================

## =============================================================================
## FUN: myFread
myFreadHFT <- function(x){
  ## -- 如果使用　fread 可以正常读取数据文件
  if(class(try(fread(x, showProgress = FALSE, fill = TRUE, nrows = 1000),
               silent = TRUE))[1] != "try-error"){
    dt <- fread(x, showProgress = TRUE, fill = TRUE,
                select = c('Timestamp','TradingDay','UpdateTime','UpdateMillisec'
                           ,'InstrumentID','LastPrice','Volume','Turnover','OpenInterest'
                           ,'UpperLimitPrice','LowerLimitPrice'
                           ,'BidPrice1','BidVolume1','BidPrice2','BidVolume2'
                           ,'BidPrice3','BidVolume3','BidPrice4','BidVolume4'
                           ,'BidPrice5','BidVolume5'
                           ,'AskPrice1','AskVolume1','AskPrice2','AskVolume2'
                           ,'AskPrice3','AskVolume3','AskPrice4','AskVolume4'
                           ,'AskPrice5','AskVolume5'
                ),
                colClasses = list(character = c("TradingDay","InstrumentID","UpdateTime"),
                                  numeric   = c("Volume","Turnover") )) %>%
      .[grep("^[0-9]{8}:[0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{4,6}$", Timestamp)]
      ## 考虑到部分文件可能使用的　Timestamp 是乱码
  }else{
  ## -- 如果使用　fread 读取失败，则使用　read_csv
    dt <- read_csv(x,
                   col_types = list(TradingDay   = col_character(),
                                    InstrumentID = col_character(),
                                    UpdateTime   = col_character(),
                                    Volume       = col_number(),
                                    Turnover     = col_number())
                   ) %>% as.data.table() %>%
      .[grep("^[0-9]{8}:[0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{4,6}$", Timestamp)] %>%
      .[,.(Timestamp, TradingDay, UpdateTime, UpdateMillisec
           ,InstrumentID,LastPrice
           ,Volume,Turnover,OpenInterest
           ,UpperLimitPrice,LowerLimitPrice
           ,BidPrice1,BidVolume1,BidPrice2,BidVolume2
           ,BidPrice3,BidVolume3,BidPrice4,BidVolume4
           ,BidPrice5,BidVolume5
           ,AskPrice1,AskVolume1,AskPrice2,AskVolume2
           ,AskPrice3,AskVolume3,AskPrice4,AskVolume4
           ,AskPrice5,AskVolume5)]
  }
  ##----------------------------------------------------------------------------
  return(dt)
}


## =============================================================================
## FUN: myFreadBar
## 用于制作 bar
myFreadBar <- function(x){
  ## -- 如果使用　fread 可以正常读取数据文件
  if(class(try(fread(x, showProgress = FALSE, fill = TRUE, nrows = 1000),
               silent = TRUE))[1] != "try-error"){
    dt <- fread(x, showProgress = TRUE, fill = TRUE,
                select = c('Timestamp','TradingDay','UpdateTime','UpdateMillisec'
                           ,'InstrumentID','LastPrice'
                           ,"OpenPrice", "HighestPrice", "LowestPrice","ClosePrice"
                           ,'Volume','Turnover','OpenInterest'
                           ,'SettlementPrice','UpperLimitPrice','LowerLimitPrice'
                           ,'BidPrice1','BidVolume1','BidPrice2','BidVolume2'
                           ,'BidPrice3','BidVolume3','BidPrice4','BidVolume4'
                           ,'BidPrice5','BidVolume5'
                           ,'AskPrice1','AskVolume1','AskPrice2','AskVolume2'
                           ,'AskPrice3','AskVolume3','AskPrice4','AskVolume4'
                           ,'AskPrice5','AskVolume5'
                ),
                colClasses = list(character = c("TradingDay","InstrumentID","UpdateTime"),
                                  numeric   = c("Volume","Turnover") )) %>%
      .[grep("^[0-9]{8}:[0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{4,6}$", Timestamp)]
  }else{
  ## -- 如果使用　fread 读取失败，则使用　read_csv
    dt <- read_csv(x,
                   col_types = list(TradingDay   = col_character(),
                                    InstrumentID = col_character(),
                                    UpdateTime   = col_character(),
                                    Volume       = col_number(),
                                    Turnover     = col_number())
    ) %>% as.data.table() %>%
      .[grep("^[0-9]{8}:[0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{4,6}$", Timestamp)] %>%
      .[,.(Timestamp, TradingDay, UpdateTime, UpdateMillisec
           ,InstrumentID,LastPrice
           ,OpenPrice, HighestPrice, LowestPrice,ClosePrice
           ,Volume,Turnover,OpenInterest
           ,SettlementPrice,UpperLimitPrice,LowerLimitPrice
           ,BidPrice1,BidVolume1,BidPrice2,BidVolume2
           ,BidPrice3,BidVolume3,BidPrice4,BidVolume4
           ,BidPrice5,BidVolume5
           ,AskPrice1,AskVolume1,AskPrice2,AskVolume2
           ,AskPrice3,AskVolume3,AskPrice4,AskVolume4
           ,AskPrice5,AskVolume5)]
  }
  ##----------------------------------------------------------------------------
  return(dt)
}

## =============================================================================
## FUN: myFreadBarCTP
## 用于制作 bar
myFreadBarCTP <- function(x){
  ## -- 如果使用　fread 可以正常读取数据文件
  if(class(try(fread(x, showProgress = FALSE, fill = TRUE, nrows = 1000),
               silent = TRUE))[1] != "try-error"){
    dt <- fread(x, showProgress = TRUE, fill = TRUE,
                select = c('TimeStamp','TradingDay','UpdateTime','UpdateMillisec'
                           ,'InstrumentID','LastPrice'
                           ,"OpenPrice", "HighestPrice", "LowestPrice","ClosePrice"
                           ,'Volume','Turnover','OpenInterest'
                           ,'SettlementPrice','UpperLimitPrice','LowerLimitPrice'
                           ,'BidPrice1','BidVolume1','BidPrice2','BidVolume2'
                           ,'BidPrice3','BidVolume3','BidPrice4','BidVolume4'
                           ,'BidPrice5','BidVolume5'
                           ,'AskPrice1','AskVolume1','AskPrice2','AskVolume2'
                           ,'AskPrice3','AskVolume3','AskPrice4','AskVolume4'
                           ,'AskPrice5','AskVolume5'
                ),
                colClasses = list(character = c("TradingDay","InstrumentID","UpdateTime"),
                                  numeric   = c("Volume","Turnover") )) %>%
      .[grep("^[0-9]{8}:[0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{4,6}$", TimeStamp)]
  }else{
  ## -- 如果使用　fread 读取失败，则使用　read_csv
    dt <- read_csv(x,
                   col_types = list(TradingDay   = col_character(),
                                    InstrumentID = col_character(),
                                    UpdateTime   = col_character(),
                                    Volume       = col_number(),
                                    Turnover     = col_number())
    ) %>% as.data.table() %>%
      .[grep("^[0-9]{8}:[0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{4,6}$", TimeStamp)] %>%
      .[,.(TimeStamp, TradingDay, UpdateTime, UpdateMillisec
           ,InstrumentID,LastPrice
           ,OpenPrice, HighestPrice, LowestPrice,ClosePrice
           ,Volume,Turnover,OpenInterest
           ,SettlementPrice,UpperLimitPrice,LowerLimitPrice
           ,BidPrice1,BidVolume1,BidPrice2,BidVolume2
           ,BidPrice3,BidVolume3,BidPrice4,BidVolume4
           ,BidPrice5,BidVolume5
           ,AskPrice1,AskVolume1,AskPrice2,AskVolume2
           ,AskPrice3,AskVolume3,AskPrice4,AskVolume4
           ,AskPrice5,AskVolume5)]
  }
  ##----------------------------------------------------------------------------
  return(dt)
}


## =============================================================================
## FUN: myFreadBar
## 从　DC 那份数据文件读取数据，用于制作　Bar
myFreadFromDC <- function(x){
  ## -- 如果使用　fread 可以正常读取数据文件
  if(class(try(fread(x, showProgress = FALSE, fill = TRUE, nrows = 1000),
               silent = TRUE))[1] != "try-error"){
    dt <- fread(x, showProgress = TRUE, fill = TRUE,
                select = c('TradingDay','UpdateTime','UpdateMillisec'
                           ,'InstrumentID','LastPrice'
                           ,"OpenPrice", "HighestPrice", "LowestPrice","ClosePrice"
                           ,'Volume','Turnover','OpenInterest'
                           ,'SettlementPrice','UpperLimitPrice','LowerLimitPrice'
                           ,'BidPrice1','BidVolume1','BidPrice2','BidVolume2'
                           ,'BidPrice3','BidVolume3','BidPrice4','BidVolume4'
                           ,'BidPrice5','BidVolume5'
                           ,'AskPrice1','AskVolume1','AskPrice2','AskVolume2'
                           ,'AskPrice3','AskVolume3','AskPrice4','AskVolume4'
                           ,'AskPrice5','AskVolume5','AveragePrice'
                ),
                colClasses = list(character = c("TradingDay","InstrumentID","UpdateTime"),
                                  numeric   = c("Volume","Turnover") ))
  }else{
  ## -- 如果使用　fread 读取失败，则使用　read_csv
    dt <- read_csv(x,
                   col_types = list(TradingDay   = col_character(),
                                    InstrumentID = col_character(),
                                    UpdateTime   = col_character(),
                                    Volume       = col_number(),
                                    Turnover     = col_number())
    ) %>% as.data.table() %>%
      .[,.(TradingDay, UpdateTime, UpdateMillisec
           ,InstrumentID,LastPrice
           ,OpenPrice, HighestPrice, LowestPrice,ClosePrice
           ,Volume,Turnover,OpenInterest
           ,SettlementPrice,UpperLimitPrice,LowerLimitPrice
           ,BidPrice1,BidVolume1,BidPrice2,BidVolume2
           ,BidPrice3,BidVolume3,BidPrice4,BidVolume4
           ,BidPrice5,BidVolume5
           ,AskPrice1,AskVolume1,AskPrice2,AskVolume2
           ,AskPrice3,AskVolume3,AskPrice4,AskVolume4
           ,AskPrice5,AskVolume5,AveragePrice)]
  }
  ##----------------------------------------------------------------------------
  return(dt)
}


## =============================================================================
## FUN: myFreadvnpy
myFreadvnpy <- function(x){
  ## -- 如果使用　fread 可以正常读取数据文件
  if(class(try(fread(x, showProgress = FALSE, fill = TRUE, nrows = 100000),
               silent = TRUE))[1] != "try-error"){
    dt <- fread(x, showProgress = TRUE, fill = TRUE,
                select = c('timeStamp','date','time'
                           ,'symbol','lastPrice'
                           ,"openPrice", "highestPrice", "lowestPrice","closePrice"
                           ,'volume','turnover','openInterest'
                           ,'settlementPrice','upperLimit','lowerLimit'
                           ,'bidPrice1','bidVolume1','bidPrice2','bidVolume2'
                           ,'bidPrice3','bidVolume3','bidPrice4','bidVolume4'
                           ,'bidPrice5','bidVolume5'
                           ,'askPrice1','askVolume1','askPrice2','askVolume2'
                           ,'askPrice3','askVolume3','askPrice4','askVolume4'
                           ,'askPrice5','askVolume5'
                ),
                colClasses = list(character = c("date","symbol","time"),
                                  numeric   = c("volume","turnover") )) %>%
      .[grep("^[0-9]{8} [0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{4,6}$", timeStamp)]
      ## 考虑到部分文件可能使用的　Timestamp 是乱码
  }else{
  ## -- 如果使用　fread 读取失败，则使用　read_csv
    dt <- read_csv(x,
                   col_types = list(timeStamp = col_character(),
                                    date      = col_character(),
                                    symbol    = col_character(),
                                    time      = col_character(),
                                    volume    = col_number(),
                                    turnover  = col_number())
                   ) %>% as.data.table() %>%
      .[grep("^[0-9]{8} [0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{4,6}$", timeStamp)] %>%
      .[,.(timeStamp, date, time
           ,symbol,lastPrice
           ,openPrice,highestPrice,lowestPrice,closePrice
           ,volume,turnover,openInterest
           ,settlementPrice,upperLimit,lowerLimit
           ,bidPrice1,bidVolume1,bidPrice2,bidVolume2
           ,bidPrice3,bidVolume3,bidPrice4,bidVolume4
           ,bidPrice5,bidVolume5
           ,askPrice1,askVolume1,askPrice2,askVolume2
           ,askPrice3,askVolume3,askPrice4,askVolume4
           ,askPrice5,askVolume5)]
  }
  ##----------------------------------------------------------------------------
  return(dt)
}
