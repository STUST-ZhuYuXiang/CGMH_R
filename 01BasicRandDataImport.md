R語言基礎+資料載入與前處理
========================================================
author: 長庚資管 曾意儒 Yi-Ju Tseng
autosize: true
font-family: 'Microsoft JhengHei'
navigation: slide

資料分析步驟
========================================================
- **資料匯入** 
- **資料清洗處理**並轉換為Tidy data
- **資料分析**
- **資料呈現與視覺化**


在分析之前
========================================================
- RStudio怎麼用？
- R基本語法
- R資料結構


RStudio Interface
========================================================
left: 30%
共有四個區塊，分別為：

- 程式碼編輯區 Source editor
- 執行視窗 Console
- 環境/物件
- 檔案/圖表/說明文件

***

![plot of chunk unnamed-chunk-1](figures/RStudio.png)

RStudio 使用步驟
========================================================
- New Project (如果原本沒有的話) **CGMH_R**
- New R Script (如果原本沒有的話) **20180706.R**
- 在左上方**程式碼編輯區 Source editor**撰寫程式碼
- 將需要執行的程式碼反白，點選**Run**，或**Ctrl+Enter**，執行程式碼
- 將游標移至需要執行的程式碼，點選**Run** 也可執行該行程式碼
- 程式碼會在左下方Console視窗執行，顯示結果
- 如果有畫圖，會出現在右下方視窗
- 可在右上方視窗檢查所有變數

Console視窗
========================================================
- R是可**直譯**的語言
- 可在執行視窗(左下Console)直接打程式碼
- **>** : 輸入指令
- **+** : 表示前面的程式碼還沒打完
    - 鍵入完整的程式碼
    - **Esc**跳出

R = Base + Other Packages
========================================================
- 安裝套件Package的方法如下：

```r
install.packages("套件名稱")
```

- 套件名稱需要加上雙引號

```r
install.packages("ggplot2")
```

- 載入**已安裝**的套件：

```r
library(ggplot2)
```

- **不用**在套件名稱前後加雙引號


Functions - Basic
========================================================
- 內建Functions函數
- 安裝Packages套件後各套件也會提供多種函數
- 使用方式: `函數名稱(參數1,參數2,....)`
- `?函數名稱` 查詢所需參數與說明
以計算平均數為例，可使用`mean()`函數:

```r
##計算1~6的平均數
mean(c(1,2,3,4,5,6)) 
```

```
[1] 3.5
```

Functions - Arguments 順序
========================================================
- 函數的參數設定有順序性
- 不想照順序-->指定參數名稱

如序列產生函數`seq()`，參數順序為`from, to, by`，代表序列起點、序列終點，以及相隔單位。

```r
#1~9，每隔2產生一數字
seq(from=1,to=9,by=2)
```

```
[1] 1 3 5 7 9
```

Functions - Arguments 順序
========================================================

```r
seq(from=1,to=9,by=2)
```

```
[1] 1 3 5 7 9
```

```r
#按照順序輸入參數，可省去參數名稱
seq(1,9,2)
```

```
[1] 1 3 5 7 9
```

```r
#不照順序輸入，需要參數名稱
seq(by=2,to=9,from=1)
```

```
[1] 1 3 5 7 9
```

Variable [<-]
========================================================
- 使用 `<-` 設定變數
- **變數名稱** `<-` **變數內容(值)**
- **變數名稱**可依箭頭方向放置於左側 `<-` 或右側 `->` 
- 但為方便閱讀，**變數名稱**多放置於左側


```r
a<-1 
a
```

```
[1] 1
```

```r
2->b
b
```

```
[1] 2
```

Variable 命名規則
========================================================
- 不可使用保留字
    - break, else, FALSE, for, function, if, Inf, NA, NaN, next, repeat, return, TRUE, while等
    - 在RStudio輸入，會變色
- 開頭只能是英文字，或 `.`
- 大小寫敏感（白話文：大小寫有差）


資料型態
========================================================
- **數值 (numeric)**
- **字串 (character)**
- **布林變數 (logic)**
- **日期 (Date)**

數值 (numeric)
========================================================
數值包括
- 整數integer（沒有小數點）

```r
num1<-100 
```
- 浮點數（有小數點）

```r
num2<-1000.001
```


字串 (character)
========================================================
- 用雙引號`"`框起 : 字串格式
- 數字前後加上雙引號 : 字串格式
    - 無法進行數值的加減乘除

```r
char1<-"abcTest" 
char2<-"100"
char3<-"200"
#char2+char3 
#會輸出Error message: non-numeric argument to binary operator
```


布林變數 (logic)
========================================================
- 用於邏輯判斷
- 大寫**TRUE**或**T**代表**真**
- 大寫**FALSE**或**F**代表**假**

```r
boolT<-TRUE
boolT1<-T
boolF<-FALSE
boolF1<-F
boolT
```

```
[1] TRUE
```

```r
boolF1
```

```
[1] FALSE
```

日期 (Date)
========================================================
- 表示日期
- `Sys.Date()`可得系統日期


```r
dateBook<-Sys.Date()
dateBook
```

```
[1] "2018-07-04"
```


資料型態包括?
====================================
type:alert


基本運算子: 數學運算
========================================================
數學運算與其他程式語言相同

- 加 `+`
- 減 `-`

```r
num1<-1
num2<-100
num1+num2
```

```
[1] 101
```

```r
num1-num2
```

```
[1] -99
```
***
- 乘 `*`
- 除 `/`
- 餘數 `%%`
- 次方 `^`

```r
num1*num2
```

```
[1] 100
```

```r
num1/num2
```

```
[1] 0.01
```


基本運算子: 邏輯運算
========================================================
常用之邏輯判斷也可在R中直接使用
- 大於 `>`
- 小於 `<`

```r
num1<-1
num2<-100
num1>num2
```

```
[1] FALSE
```

```r
num1<num2
```

```
[1] TRUE
```

***

- 等於 `==`，**雙等號**
- 大於等於 `>=`
- 小於等於 `<=`

```r
num1==num2
```

```
[1] FALSE
```

```r
1==1
```

```
[1] TRUE
```

基本運算子: 邏輯運算
========================================================
文字字串也可比較大小

```r
char1<-"abcTest" 
char2<-"defTest"
char3<-"AbcTest"
char1>char2
```

```
[1] FALSE
```

```r
char1>char3
```

```
[1] FALSE
```

基本運算子: 邏輯判斷
========================================================
在R中使用**單符號**即可表示且`&`和或`|`
- 且 `&`


```r
TRUE & TRUE
```

```
[1] TRUE
```

```r
TRUE & FALSE
```

```
[1] FALSE
```

***
在R中使用**單符號**即可表示且`&`和或`|`
- 或 `|`

```r
TRUE | TRUE
```

```
[1] TRUE
```

```r
TRUE | FALSE
```

```
[1] TRUE
```
基本運算子: 反向布林變數 !
========================================================


```r
!TRUE
```

```
[1] FALSE
```

```r
!FALSE
```

```
[1] TRUE
```


解讀錯誤訊息
========================================================

- Message：有可能的錯誤通知，程式會繼續執行
- Warning：有錯誤，但是不會影響太多，程式會繼續執行
- Error：有錯，而且無法繼續執行程式
- Condition：可能會發生的情況

```r
log(-1)
```

```
[1] NaN
```

```r
mena(NA)
```

```
Error in eval(expr, envir, enclos): 沒有這個函數 "mena"
```

解讀錯誤訊息 範例
========================================================
```
# Error: could not find function "fetch_NBAPlayerStatistics"
# 找不到"fetch_NBAPlayerStatistics" function
```
可能原因：沒安裝或沒讀入SportsAnalytics package


```
# Error in library(knitr): there is no package called 'knitr'
# 找不到"knitr" package
```
可能原因：沒安裝knitr package

Help
========================================================
- R語言與套件均有完整的文件與範例可以參考
- 輸入`?函數名稱`或`?套件名稱`

```r
?ggplot2
?ymd
```

- Google
- [Stack Overflow](http://stackoverflow.com/)也有許多問答


R 常見的資料結構
========================================================
- **向量** Vector
- **因子** Factor
- 列表 List
- 矩陣 Matrix
- **資料框** data.frame
- 屬性查詢函數 **str()**

向量 Vector
========================================================
type:sub-section
- 一維資料
- 所有元素之**資料型態必須相同**
- `c()`函數 定義向量

```r
vec<-c('a','b','c','d','e')
```

- a~e: **元素(element)**
- 順序固定
    - `a`: 第**1**個元素
    - `b`: 第**2**個元素

向量 Vector 取值
========================================================  

若要將`vec`向量的第**4**個元素取出，可使用**向量名稱[元素位置]**: 

```r
vec[4] ## 第4個元素
```

```
[1] "d"
```
也可同時取出多個元素

```r
vec[c(2,3)] ## 第2與第3個元素
```

```
[1] "b" "c"
```


向量 Vector 元素設定
========================================================   

```r
vec[3]
```

```
[1] "c"
```

```r
vec[3]<-'z' ##第三個元素值設定為“z”
vec[3] 
```

```
[1] "z"
```

產生向量函數
========================================================   

若要產生連續向量，如1~20，可使用`:`來串連首字與最後一字

```r
1:20 ## c(1,2,...,19,20)
```

```
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

向量取值練習
====================================
type:alert
incremental:true

- 新增一向量a，包含數字1到10
- 新增一向量b，包含數字1到20中的所有偶數
- 取出a向量的第4個元素
- 取出b向量的第5,6,7個元素


向量運算
========================================================  
向量也可直接做加減乘除運算，如

```r
numvec<-1:10 ## c(1,2,3,4,5,6,7,8,9,10)
numvec+3 ## 所有元素+3
```

```
 [1]  4  5  6  7  8  9 10 11 12 13
```

```r
numvec*2 ## 所有元素*2
```

```
 [1]  2  4  6  8 10 12 14 16 18 20
```

向量運算
========================================================  
向量和向量也可做運算，如

```r
numvec1<-1:3 ## c(1,2,3)
numvec2<-4:6 ## c(4,5,6)
numvec1+numvec2
```

```
[1] 5 7 9
```

```r
numvec1*numvec2
```

```
[1]  4 10 18
```

向量運算練習
====================================
type:alert
incremental:true

- 新增一向量a，包含數字1到10
- 新增一向量b，包含數字1到10中的所有偶數
- a+b=?

因子 factor
========================================================
type:sub-section
- 由向量轉換而成
- 表示**類別**數據
- 使用方法為`factor(資料向量,levels=類別次序)`

```r
factor(c("門診","住院","急診"),
       levels = c("門診","住院","急診"))
```

```
[1] 門診 住院 急診
Levels: 門診 住院 急診
```
因子變量一但決定其類別的種類與數目時，通常不會再作更動，也就是任何新增的元素都要門診、住院、急診其中一種。


資料框 data.frame
======================================================== 
type:sub-section
- 二維資料格式 (像Excel試算表)
- 由欄位（Column）和列（Row）組成
- 使用`data.frame()`來創建新的資料框

```r
##欄位名稱=欄位值
StuDF <- data.frame(StuID=c(1,2,3), 
                  name=c("小明","大雄","胖虎"),
                  score=c(80,60,90))
StuDF 
```

```
  StuID name score
1     1 小明    80
2     2 大雄    60
3     3 胖虎    90
```


資料框 data.frame
======================================================== 
- 每列：觀察值 / 每欄：變數
- 欄位需有名稱
    - StuID, name, score
    - 若沒有設定，自動指派V1~Vn
- 欄位的資料型態相同
- 每一列有列名
    - 依序指派1~n作為列名
- **stringsAsFactors = F**

資料框 data.frame
======================================================== 


```r
colnames(StuDF) #檢查欄位名稱
```

```
[1] "StuID" "name"  "score"
```

```r
rownames(StuDF) #檢查列名
```

```
[1] "1" "2" "3"
```

```r
nrow(StuDF) #幾列
```

```
[1] 3
```

```r
ncol(StuDF) #幾欄
```

```
[1] 3
```

資料框 data.frame
======================================================== 
如需檢查個欄位之資料型別，可使用`str()`函數

**解釋iris資料框**???


```r
str(iris) 
```

```
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

資料框資料擷取
======================================================== 
資料框可用`$`符號做**欄位**資料擷取

```r
#取得iris資料框中的Species欄位的第1,11,21,31個值
iris$Species[c(1,11,21,31)] 
```

```
[1] setosa setosa setosa setosa
Levels: setosa versicolor virginica
```

資料框資料編輯
======================================================== 
資料框可用`$`符號做**欄位**資料擷取後，當成向量，並使用**[ ]**做資料編輯。

```r
iris$Species[2]<-"versicolor"
iris$Species[1:4]
```

```
[1] setosa     versicolor setosa     setosa    
Levels: setosa versicolor virginica
```

資料框資料編輯練習
====================================
type:alert
incremental:true

- iris$Time<-1 會發生什麼事情?



資料分析步驟
========================================================
- **資料匯入** 
- 資料清洗處理並轉換為Tidy data
- 資料分析
- 資料呈現與視覺化


資料匯入
====================================
- 從檔案匯入
- 資料匯出

從檔案匯入
====================================
type:section
- Import Dataset功能 (RStudio)
- R物件 .rds
- R程式 .R

Import Dataset功能 (RStudio)
====================================
選取RStudio四分割視窗右上角的Environment標籤，選擇**Import Dataset**

![plot of chunk unnamed-chunk-15](figures/import.png)

Import Dataset功能 (RStudio)
====================================
- 選取`From CSV` or `From text (readr)` or `From text (base)`
- 點選`Browse`按鈕開啟檔案選取器

![plot of chunk unnamed-chunk-16](figures/csv.png)

Import Dataset功能 (RStudio)
====================================
- 利用下方`Import Options`的選項微調參數
    - `Delimiter`分隔符號
    - `First Row as Names`首列是否為欄位名稱
    
![plot of chunk unnamed-chunk-17](figures/csv2.png)

Import Dataset功能 (RStudio)
====================================
type:alert
incremental:true

- 操作**範例檔案**，Basic.csv
- 若匯入的檔案為**tab分隔文字檔**? 該如何調整參數？

R物件 .rds
====================================
type:sub-section
如果在R程式內處理完資料後，必須儲存一份以供後續分析，使用R物件儲存是最佳的方式

- 檔案小
- 讀取快速
- 推薦使用`readRDS()`函數讀取RDS檔案
- [A better way of saving and loading objects in R](http://www.fromthebottomoftheheap.net/2012/04/01/saving-and-loading-r-objects/)

```r
dataset <- readRDS("檔案路徑與名稱")
```


資料匯出
====================================
type:section
- 文字檔 .txt
- CSV檔 .csv
- R物件 .rds


CSV檔 .csv
====================================

```r
write.csv(iris,file="iris.csv",row.names = F)
```
- 要匯出的資料
- `file` 檔案名稱
- `append` T/F T:在檔案後加字，F:直接覆蓋檔案 (預設F)
- `quote` 是否需要用雙引號將字串包起 (預設T)
- `row.names` T/F 是否需要輸出row names
- `col.names` T/F 是否需要輸出column names
- `fileEncoding` 編碼設定



R物件 .rds
====================================

若是要在R的環境繼續使用，建議匯出成R物件檔案(.rds)

```r
saveRDS(iris,"iris.rds")
```

資料分析步驟
========================================================
- 資料匯入
- **資料清洗處理**並轉換為Tidy data
- 資料分析
- 資料呈現與視覺化


資料清洗與處理
====================================
- Tidy Data
- 資料型別轉換處理
- 文字字串處理
- 子集Subset
- 排序
- 資料組合
- 長表與寬表

Tidy Data
====================================
type:sub-section 

Each column is a variable. Each row is an observation.

- 一個欄位（Column）內只有一個數值，最好要有凡人看得懂的Column Name
- 不同的觀察值應該要在不同列（Row）
- 一張表裡面，有所有分析需要的資料
- 如果一定要多張表，中間一定要有index可以把表串起來
- One file, one table



資料型別轉換處理
====================================
type:sub-section 
包括**資料型別檢查**與**資料型別轉換**

資料型別:

- 數值 (numeric)
- 字串 (character)
- 布林變數 (logic)
- 日期 (Date)


資料型別檢查 - is.
====================================
使用`is.`函數檢查資料型別，回傳布林變數，若為**真**，回傳**TRUE**

- 是否為**數字** `is.numeric(變數名稱)`
- 是否為**文字** `is.character(變數名稱)`
- 是否為**布林變數** `is.logical(變數名稱)`


```r
library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入
knitr::kable(head(EMDiagS))
```



| 院區| 資料年月|歸戶代號                                 | 輸入日期|門診號                                   |掛號科別 | 疾病序號|疾病碼 |主診斷 |重大傷病 |資料年齡 |
|----:|--------:|:----------------------------------------|--------:|:----------------------------------------|:--------|--------:|:------|:------|:--------|:--------|
|    3|   200905|29FA4C0973C651385CE1459594B633CD03D46F8C | 20090518|58D66E27654D9352953786F04119C56B8CB3DB24 |33W10    |        1|28522  |NA     |NA       |NA       |
|    3|   200903|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090314|4727A0AA87106EDAC08E4D27C481C4D06118BC4D |33W20    |        1|6119   |Y      |NA       |NA       |
|    3|   200904|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090421|14DC1295765A35586CD52089120CBBCAECF85B45 |33W20    |        1|1743   |Y      |Y        |NA       |
|    3|   200904|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090421|14DC1295765A35586CD52089120CBBCAECF85B45 |33W20    |        2|1749   |NA     |Y        |NA       |
|    3|   200905|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090520|67DFFC73DB09635F4B8B3F4CAFA1D7FC82757E47 |33W20    |        1|1749   |Y      |Y        |NA       |
|    3|   200904|5E50709499C0D51FE8120E15CC83F3AEDDB55567 | 20090401|F3FC4660571AE4EDC41E5925AB4EABB30E93BC1C |33W20    |        1|1479   |Y      |Y        |NA       |

資料型別檢查 - is.
====================================
使用`is.`函數檢查資料型別，回傳布林變數，若為**真**，回傳**TRUE**

- 是否為**數字** `is.numeric(變數名稱)`
- 是否為**文字** `is.character(變數名稱)`
- 是否為**布林變數** `is.logical(變數名稱)`


```r
is.numeric(EMDiagS$疾病序號)
```

```
[1] TRUE
```

```r
is.character(EMDiagS$疾病序號)
```

```
[1] FALSE
```

資料型別檢查 - class()
====================================
使用`class(變數名稱)`函數，直接回傳**資料型別**

```r
class(EMDiagS$疾病序號)
```

```
[1] "integer"
```

```r
class(Sys.Date())
```

```
[1] "Date"
```


資料型別轉換 - as.
====================================

使用`as.`函數轉換型別

- 轉換為**數字** `as.numeric(變數名稱)`
- 轉換為**文字** `as.character(變數名稱)`
- 轉換為**布林變數** `as.logical(變數名稱)`


```r
cha<-"100"
as.numeric(cha)
```

```
[1] 100
```

資料型別轉換 - as.
====================================

若無法順利完成轉換，會回傳空值`NA`，並出現警告訊息

```r
as.numeric("abc")
```

```
[1] NA
```



資料型別轉換練習
====================================
type:alert
incremental:true

資料年月是整數型別 (integer)，該如何將這此欄位轉成文字呢？

```r
#提示程式碼
library(readr)
#自行載入
EMDiagS <- read_csv("EMDiagS.csv") 
str(EMDiagS)
```

```
Classes 'tbl_df', 'tbl' and 'data.frame':	1673 obs. of  11 variables:
 $ 院區    : int  3 3 3 3 3 3 3 3 3 3 ...
 $ 資料年月: int  200905 200903 200904 200904 200905 200904 200905 200905 200902 200902 ...
 $ 歸戶代號: chr  "29FA4C0973C651385CE1459594B633CD03D46F8C" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" ...
 $ 輸入日期: int  20090518 20090314 20090421 20090421 20090520 20090401 20090514 20090519 20090211 20090211 ...
 $ 門診號  : chr  "58D66E27654D9352953786F04119C56B8CB3DB24" "4727A0AA87106EDAC08E4D27C481C4D06118BC4D" "14DC1295765A35586CD52089120CBBCAECF85B45" "14DC1295765A35586CD52089120CBBCAECF85B45" ...
 $ 掛號科別: chr  "33W10" "33W20" "33W20" "33W20" ...
 $ 疾病序號: int  1 1 1 2 1 1 1 1 1 2 ...
 $ 疾病碼  : chr  "28522" "6119" "1743" "1749" ...
 $ 主診斷  : chr  NA "Y" "Y" NA ...
 $ 重大傷病: chr  NA NA "Y" "Y" ...
 $ 資料年齡: chr  NA NA NA NA ...
 - attr(*, "spec")=List of 2
  ..$ cols   :List of 11
  .. ..$ 院區    : list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 資料年月: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 歸戶代號: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 輸入日期: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 門診號  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 掛號科別: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 疾病序號: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 疾病碼  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 主診斷  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 重大傷病: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 資料年齡: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  ..$ default: list()
  .. ..- attr(*, "class")= chr  "collector_guess" "collector"
  ..- attr(*, "class")= chr "col_spec"
```


日期 (Date) - lubridate
========================================================
- `lubridate` package : 日期與字串的相關轉換操作
- `ymd()`函數 : 將`年/月/日`格式的文字轉換為日期物件
    - y表年year
    - m表月month
    - d表日day

```r
#install.packages("lubridate") 第一次使用需安裝
library(lubridate)
ymd('2012/3/3')
```

```
[1] "2012-03-03"
```


日期 (Date) - lubridate
========================================================
- `mdy()`函數 : 將`月/日/年`格式的文字轉換為日期物件
    - y表年year
    - m表月month
    - d表日day
- 以此類推


```r
mdy('3/3/2012')
```

```
[1] "2012-03-03"
```

```r
ymd_hms("2013/06/23 13:15:07")
```

```
[1] "2013-06-23 13:15:07 UTC"
```

- 其他使用方法：[The Yhat Blog](http://blog.yhat.com/static/pdf/R_date_cheat_sheet.pdf)


資料型別轉換練習
====================================
type:alert
incremental:true

輸入日期是整數型別 (integer)，該如何將這此欄位轉成日期呢？

```r
library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入
str(EMDiagS)
```

```
Classes 'tbl_df', 'tbl' and 'data.frame':	1673 obs. of  11 variables:
 $ 院區    : int  3 3 3 3 3 3 3 3 3 3 ...
 $ 資料年月: int  200905 200903 200904 200904 200905 200904 200905 200905 200902 200902 ...
 $ 歸戶代號: chr  "29FA4C0973C651385CE1459594B633CD03D46F8C" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" ...
 $ 輸入日期: int  20090518 20090314 20090421 20090421 20090520 20090401 20090514 20090519 20090211 20090211 ...
 $ 門診號  : chr  "58D66E27654D9352953786F04119C56B8CB3DB24" "4727A0AA87106EDAC08E4D27C481C4D06118BC4D" "14DC1295765A35586CD52089120CBBCAECF85B45" "14DC1295765A35586CD52089120CBBCAECF85B45" ...
 $ 掛號科別: chr  "33W10" "33W20" "33W20" "33W20" ...
 $ 疾病序號: int  1 1 1 2 1 1 1 1 1 2 ...
 $ 疾病碼  : chr  "28522" "6119" "1743" "1749" ...
 $ 主診斷  : chr  NA "Y" "Y" NA ...
 $ 重大傷病: chr  NA NA "Y" "Y" ...
 $ 資料年齡: chr  NA NA NA NA ...
 - attr(*, "spec")=List of 2
  ..$ cols   :List of 11
  .. ..$ 院區    : list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 資料年月: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 歸戶代號: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 輸入日期: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 門診號  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 掛號科別: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 疾病序號: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 疾病碼  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 主診斷  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 重大傷病: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 資料年齡: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  ..$ default: list()
  .. ..- attr(*, "class")= chr  "collector_guess" "collector"
  ..- attr(*, "class")= chr "col_spec"
```


文字字串處理
====================================
type:sub-section 

- 基本處理
- 搜尋字串
- [Regular Expression 正規表示式 @ R](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/105/RegularExpression.md)

基本處理
====================================

- 切割 `strsplit()` **Split**
- 子集 `substr()` **sub string**
- 大小寫轉換 `toupper()` `tolower()`
- 兩文字連接 `paste()` `paste0()`
- 文字取代 `gsub()` **substitute**
- 前後空白去除 `str_trim()` 需安裝`stringr` package **trim**

基本處理-切割
====================================
strsplit (欲切割的字串,用什麼符號切割)

```r
strsplit ("Hello World"," ")
```

```
[[1]]
[1] "Hello" "World"
```

基本處理-切割（多字元）|
====================================
strsplit (欲切割的字串,切割符號1|切割符號2|...)

```r
strsplit ("Hello World"," |o")
```

```
[[1]]
[1] "Hell" ""     "W"    "rld" 
```

基本處理-子集（切一小段）
====================================
substr(欲做子集的字串,開始位置,結束位置)

```r
substr("Hello World", start=2,stop=4)
```

```
[1] "ell"
```

基本處理-大小寫轉換
====================================

```r
toupper("Hello World")
```

```
[1] "HELLO WORLD"
```

```r
tolower("Hello World")
```

```
[1] "hello world"
```

基本處理-兩文字連接
====================================
paste(欲連接的字串1, 欲連接的字串2, 欲連接的字串3,.... sep=中間用什麼符號分隔)

```r
paste("Hello", "World")
```

```
[1] "Hello World"
```

```r
paste("Hello", "World", sep='')
```

```
[1] "HelloWorld"
```

```r
paste0("Hello", "World")
```

```
[1] "HelloWorld"
```

基本處理-文字取代
====================================
gsub(想要換掉的舊字串,想要換成的新字串,欲作取代的完整字串)

```r
gsub("o","0","Hello World")
```

```
[1] "Hell0 W0rld"
```

基本處理-文字取代（多字元）|
====================================
gsub(想要換掉的舊字串1|想要換掉的舊字串2|...,想要換成的新字串,欲作取代的完整字串)

```r
gsub("o|l","0","Hello World")
```

```
[1] "He000 W0r0d"
```

基本處理-前後空白去除
====================================
str_trim要使用前需要安裝與載入**stringr**套件

```r
library(stringr)
str_trim(" Hello World ")
```

```
[1] "Hello World"
```


搜尋字串
====================================
- 通常使用在**比對文字向量**
- **有分大小寫**
- 依照回傳值的型態不同，有兩種常用函數
    - 回傳符合條件之向量位置(index) `grep(搜尋條件,要搜尋的向量)`
    - 回傳每個向量是否符合條件(TRUE or FALSE) `grepl(搜尋條件,要搜尋的向量)`


```r
##在姓名文字向量中尋找A，回傳包含"A"之元素位置
grep("A",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1] 1 3
```

搜尋字串 - grepl()
====================================

```r
##在姓名文字向量中尋找A，回傳各元素是否包含"A"
grepl("A",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1]  TRUE FALSE  TRUE FALSE FALSE
```

```r
##在姓名文字向量中尋找a，回傳各元素是否包含"a"
grepl("a",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1] FALSE FALSE FALSE FALSE  TRUE
```

搜尋字串 - grep()
====================================

```r
##在姓名文字向量中尋找A，回傳包含"A"的元素位置
grep("A",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1] 1 3
```

```r
##在姓名文字向量中尋找a，回傳包含"a"的元素位置
grep("a",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1] 5
```

搜尋字串 - grep()
====================================
type:alert
多字元？

搜尋字串 - grep()
====================================
type:alert
- 搜尋所有疾病碼中，包含250的資料

```r
library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入
```


子集Subset - 一維資料
====================================
type:sub-section 

之前有介紹使用`[ ]`取出單一或多個元素的方法

```r
##R語言內建資料之一
letters 
```

```
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q"
[18] "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

```r
##取出letters向量的第一個元素
letters[1] 
```

```
[1] "a"
```

子集Subset - 一維資料
====================================

也可以用“負號”去掉不要的資料

```r
##取出letters向量的第1,3,5個元素
letters[c(1,3,5)] 
```

```
[1] "a" "c" "e"
```

```r
##取出letters向量除了第1,3,5個元素之外的所有元素
letters[c(-1,-3,-5)] 
```

```
 [1] "b" "d" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
[18] "u" "v" "w" "x" "y" "z"
```

子集Subset - 一維資料
====================================
若想要快速取得一向量的開頭與結尾元素，可使用`head()`和`tail()`函數

```r
##取出letters向量的前五個元素
head(letters,5) 
```

```
[1] "a" "b" "c" "d" "e"
```

```r
##取出letters向量的後三個元素
tail(letters,3) 
```

```
[1] "x" "y" "z"
```

子集Subset - 二維資料
====================================
type:sub-section 
- 可針對列(Row)和行(Column)做子集
- 使用`[ ]`，但因應二維資料的需求，以`,`分隔列與行的篩選條件
- 資料篩選原則為**前Row,後Column**，**前列,後行**
- 若不想篩選列，則在`,`前方保持**空白**即可。
- 篩選方式可輸入**位置(index)**、**欄位名稱**或輸入**布林變數(TRUE/FALSE)**
    - 輸入位置: `dataFrame[row index,column index]`
    - 輸入布林變數: `dataFrame[c(T,F,T),c(T,F,T)]`
    - 輸入欄位名稱: `dataFrame[row name,column name]`

子集Subset - 二維資料 []
====================================

```r
##第一列Row，第二行Column
iris[1,2] 
```

```
[1] 3.5
```

```r
##第1~3列Row，所有的行Column
iris[1:3,] 
```

| Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species    |
|------------:|-----------:|------------:|-----------:|:----------|
|          5.1|         3.5|          1.4|         0.2|setosa     |
|          4.9|         3.0|          1.4|         0.2|versicolor |
|          4.7|         3.2|          1.3|         0.2|setosa     |

子集Subset - 二維資料 []
====================================

```r
##第1~10列Row，第1,3,5行Column (TRUE)
iris[1:10,c(T,F,T,F,T)] 
```

| Sepal.Length| Petal.Length|Species    |
|------------:|------------:|:----------|
|          5.1|          1.4|setosa     |
|          4.9|          1.4|versicolor |
|          4.7|          1.3|setosa     |
|          4.6|          1.5|setosa     |
|          5.0|          1.4|setosa     |
|          5.4|          1.7|setosa     |
|          4.6|          1.4|setosa     |
|          5.0|          1.5|setosa     |
|          4.4|          1.4|setosa     |
|          4.9|          1.5|setosa     |

子集Subset - 二維資料 []
====================================

```r
##所有的列Row，名稱為Species的行Column
iris[,"Species"] 
```

```
  [1] setosa     versicolor setosa     setosa     setosa     setosa    
  [7] setosa     setosa     setosa     setosa     setosa     setosa    
 [13] setosa     setosa     setosa     setosa     setosa     setosa    
 [19] setosa     setosa     setosa     setosa     setosa     setosa    
 [25] setosa     setosa     setosa     setosa     setosa     setosa    
 [31] setosa     setosa     setosa     setosa     setosa     setosa    
 [37] setosa     setosa     setosa     setosa     setosa     setosa    
 [43] setosa     setosa     setosa     setosa     setosa     setosa    
 [49] setosa     setosa     versicolor versicolor versicolor versicolor
 [55] versicolor versicolor versicolor versicolor versicolor versicolor
 [61] versicolor versicolor versicolor versicolor versicolor versicolor
 [67] versicolor versicolor versicolor versicolor versicolor versicolor
 [73] versicolor versicolor versicolor versicolor versicolor versicolor
 [79] versicolor versicolor versicolor versicolor versicolor versicolor
 [85] versicolor versicolor versicolor versicolor versicolor versicolor
 [91] versicolor versicolor versicolor versicolor versicolor versicolor
 [97] versicolor versicolor versicolor versicolor virginica  virginica 
[103] virginica  virginica  virginica  virginica  virginica  virginica 
[109] virginica  virginica  virginica  virginica  virginica  virginica 
[115] virginica  virginica  virginica  virginica  virginica  virginica 
[121] virginica  virginica  virginica  virginica  virginica  virginica 
[127] virginica  virginica  virginica  virginica  virginica  virginica 
[133] virginica  virginica  virginica  virginica  virginica  virginica 
[139] virginica  virginica  virginica  virginica  virginica  virginica 
[145] virginica  virginica  virginica  virginica  virginica  virginica 
Levels: setosa versicolor virginica
```

子集 [ ] 練習
====================================
type:alert
incremental:true

- 取出iris資料集"Species"欄位的前十列(Row)
- 取出iris資料集所有單數列(Row)
- 取出iris資料集最後兩個欄位的所有偶數列(Row)

子集Subset - 二維資料 $
====================================
也可使用`$`符號做**Column的篩選**

```r
# 等同於iris[,"Species"]
##所有的列Row，名稱為Species的行Column
iris$Species 
```

```
  [1] setosa     versicolor setosa     setosa     setosa     setosa    
  [7] setosa     setosa     setosa     setosa     setosa     setosa    
 [13] setosa     setosa     setosa     setosa     setosa     setosa    
 [19] setosa     setosa     setosa     setosa     setosa     setosa    
 [25] setosa     setosa     setosa     setosa     setosa     setosa    
 [31] setosa     setosa     setosa     setosa     setosa     setosa    
 [37] setosa     setosa     setosa     setosa     setosa     setosa    
 [43] setosa     setosa     setosa     setosa     setosa     setosa    
 [49] setosa     setosa     versicolor versicolor versicolor versicolor
 [55] versicolor versicolor versicolor versicolor versicolor versicolor
 [61] versicolor versicolor versicolor versicolor versicolor versicolor
 [67] versicolor versicolor versicolor versicolor versicolor versicolor
 [73] versicolor versicolor versicolor versicolor versicolor versicolor
 [79] versicolor versicolor versicolor versicolor versicolor versicolor
 [85] versicolor versicolor versicolor versicolor versicolor versicolor
 [91] versicolor versicolor versicolor versicolor versicolor versicolor
 [97] versicolor versicolor versicolor versicolor virginica  virginica 
[103] virginica  virginica  virginica  virginica  virginica  virginica 
[109] virginica  virginica  virginica  virginica  virginica  virginica 
[115] virginica  virginica  virginica  virginica  virginica  virginica 
[121] virginica  virginica  virginica  virginica  virginica  virginica 
[127] virginica  virginica  virginica  virginica  virginica  virginica 
[133] virginica  virginica  virginica  virginica  virginica  virginica 
[139] virginica  virginica  virginica  virginica  virginica  virginica 
[145] virginica  virginica  virginica  virginica  virginica  virginica 
Levels: setosa versicolor virginica
```


子集Subset - 二維資料grepl()
====================================
**Row的篩選**也可搭配字串搜尋函數`grepl()`

```r
grepl("color",iris$Species)
##Species包含"color"的列，所有的行
iris[grepl("color",iris$Species),] 
```

```
[1] FALSE  TRUE FALSE FALSE FALSE FALSE
```



|   | Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species    |
|:--|------------:|-----------:|------------:|-----------:|:----------|
|2  |          4.9|         3.0|          1.4|         0.2|versicolor |
|51 |          7.0|         3.2|          4.7|         1.4|versicolor |
|52 |          6.4|         3.2|          4.5|         1.5|versicolor |
|53 |          6.9|         3.1|          4.9|         1.5|versicolor |
|54 |          5.5|         2.3|          4.0|         1.3|versicolor |
|55 |          6.5|         2.8|          4.6|         1.5|versicolor |

子集Subset - head()
====================================

若想要快速取得資料框的前幾列(Row)或後幾列，也可使用`head()`和`tail()`函數

```r
 ##取出iris資料框的前五列
head(iris,5)
```

| Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species    |
|------------:|-----------:|------------:|-----------:|:----------|
|          5.1|         3.5|          1.4|         0.2|setosa     |
|          4.9|         3.0|          1.4|         0.2|versicolor |
|          4.7|         3.2|          1.3|         0.2|setosa     |
|          4.6|         3.1|          1.5|         0.2|setosa     |
|          5.0|         3.6|          1.4|         0.2|setosa     |

子集Subset - tail()
====================================

若想要快速取得資料框的前幾列(Row)或後幾列，也可使用`head()`和`tail()`函數

```r
##取出iris資料框的後三列
tail(iris,3) 
```

|    | Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species   |
|:---|------------:|-----------:|------------:|-----------:|:---------|
|148 |          6.5|         3.0|          5.2|         2.0|virginica |
|149 |          6.2|         3.4|          5.4|         2.3|virginica |
|150 |          5.9|         3.0|          5.1|         1.8|virginica |


子集綜合練習
====================================
type:alert
incremental:true

- 取出急診診斷資料中，所有疾病碼等於25000的診斷資料
    - [ ]
- 取出急診診斷資料中，所有疾病碼為250開頭的診斷資料
    - grepl()
    - [ ]
    - google **Regular Expression 起始起始位置**


```r
library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入
str(EMDiagS)
```

```
Classes 'tbl_df', 'tbl' and 'data.frame':	1673 obs. of  11 variables:
 $ 院區    : int  3 3 3 3 3 3 3 3 3 3 ...
 $ 資料年月: int  200905 200903 200904 200904 200905 200904 200905 200905 200902 200902 ...
 $ 歸戶代號: chr  "29FA4C0973C651385CE1459594B633CD03D46F8C" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" "BC9343E012826E01ECE6B33D9C2B774F11EFC549" ...
 $ 輸入日期: int  20090518 20090314 20090421 20090421 20090520 20090401 20090514 20090519 20090211 20090211 ...
 $ 門診號  : chr  "58D66E27654D9352953786F04119C56B8CB3DB24" "4727A0AA87106EDAC08E4D27C481C4D06118BC4D" "14DC1295765A35586CD52089120CBBCAECF85B45" "14DC1295765A35586CD52089120CBBCAECF85B45" ...
 $ 掛號科別: chr  "33W10" "33W20" "33W20" "33W20" ...
 $ 疾病序號: int  1 1 1 2 1 1 1 1 1 2 ...
 $ 疾病碼  : chr  "28522" "6119" "1743" "1749" ...
 $ 主診斷  : chr  NA "Y" "Y" NA ...
 $ 重大傷病: chr  NA NA "Y" "Y" ...
 $ 資料年齡: chr  NA NA NA NA ...
 - attr(*, "spec")=List of 2
  ..$ cols   :List of 11
  .. ..$ 院區    : list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 資料年月: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 歸戶代號: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 輸入日期: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 門診號  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 掛號科別: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 疾病序號: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ 疾病碼  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 主診斷  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 重大傷病: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ 資料年齡: list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  ..$ default: list()
  .. ..- attr(*, "class")= chr  "collector_guess" "collector"
  ..- attr(*, "class")= chr "col_spec"
```



資料組合
====================================
type:sub-section

有時需要在資料框新增一列，或新增一行

- Row 列的組合 `rbind()`
- Column 行的組合 `cbind()`

`rbind()`和`cbind()`的參數可以是向量，也可以是資料框

資料組合 - rbind()
====================================

使用向量做資料整合範例:

```r
rbind(c(1,2,3), #第一列
      c(4,5,6)  #第二列
      ) 
```

```
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
```

資料組合 - rbind()
====================================

使用資料框與向量做資料整合範例:

```r
irisAdd<-rbind(iris, #資料框
      c(1,1,1,1,"versicolor")  #新增一列
      ) 
```

```r
tail(irisAdd,2)
```

|    |Sepal.Length |Sepal.Width |Petal.Length |Petal.Width |Species    |
|:---|:------------|:-----------|:------------|:-----------|:----------|
|150 |5.9          |3           |5.1          |1.8         |virginica  |
|151 |1            |1           |1            |1           |versicolor |

資料組合 - cbind()
====================================

使用向量做資料整合範例:

```r
cbind(c(1,2,3), #第一行
      c(4,5,6)  #第二行
      ) 
```

```
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```

資料組合 - cbind()
====================================

使用資料框與向量做資料整合範例:

```r
irisAdd<-cbind(iris, #資料框
      rep("Add",nrow(iris))  #新增一行
      ) 
```

```r
tail(irisAdd,1)
```

|    | Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species   |rep("Add", nrow(iris)) |
|:---|------------:|-----------:|------------:|-----------:|:---------|:----------------------|
|150 |          5.9|           3|          5.1|         1.8|virginica |Add                    |

    
資料結合 (Join)
====================================

除了按照行列順序的組合外，更常有的情形是依照某個欄位的值作為結合依據，如：

- 用歸戶代號把以下兩個資料框結合成一個資料框
    - 門診診斷資料框
    - 病人基本資料資料框

資料結合 (Join)
====================================

```r
BasicS <- read_csv("BasicS.csv")
EMDiagS <- read_csv("EMDiagS.csv")
```

資料結合 (Join)
====================================

```r
nrow(BasicS)
head(BasicS)
```

```
[1] 1081
```



|院區 |歸戶代號                                 |性別 |     生日|
|:----|:----------------------------------------|:----|--------:|
|1    |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|
|5    |80DB2AFAAEADC0874A35C71DB8CC693B6B33D7BF |F    | 19680725|
|E    |0E48E47A75EC741DFF678BFDCB36D394546E6A82 |F    | 19540914|
|2    |C351B05E72BE70699B9717B3C47C23F2ECFB6094 |F    | 19421110|
|3    |BA115A73BD30BCDB95493964FB36619325C79810 |F    | 19670811|
|E    |83949E36D0009A4BE9ED122D8219ABF399C66AB2 |F    | 19620122|

資料結合 (Join)
====================================

```r
nrow(EMDiagS)
head(EMDiagS)
```

```
[1] 1673
```



| 院區| 資料年月|歸戶代號                                 | 輸入日期|門診號                                   |掛號科別 | 疾病序號|疾病碼 |主診斷 |重大傷病 |資料年齡 |
|----:|--------:|:----------------------------------------|--------:|:----------------------------------------|:--------|--------:|:------|:------|:--------|:--------|
|    3|   200905|29FA4C0973C651385CE1459594B633CD03D46F8C | 20090518|58D66E27654D9352953786F04119C56B8CB3DB24 |33W10    |        1|28522  |NA     |NA       |NA       |
|    3|   200903|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090314|4727A0AA87106EDAC08E4D27C481C4D06118BC4D |33W20    |        1|6119   |Y      |NA       |NA       |
|    3|   200904|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090421|14DC1295765A35586CD52089120CBBCAECF85B45 |33W20    |        1|1743   |Y      |Y        |NA       |
|    3|   200904|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090421|14DC1295765A35586CD52089120CBBCAECF85B45 |33W20    |        2|1749   |NA     |Y        |NA       |
|    3|   200905|BC9343E012826E01ECE6B33D9C2B774F11EFC549 | 20090520|67DFFC73DB09635F4B8B3F4CAFA1D7FC82757E47 |33W20    |        1|1749   |Y      |Y        |NA       |
|    3|   200904|5E50709499C0D51FE8120E15CC83F3AEDDB55567 | 20090401|F3FC4660571AE4EDC41E5925AB4EABB30E93BC1C |33W20    |        1|1479   |Y      |Y        |NA       |

資料結合 (Join) 更有效率的做法
====================================

`dplyr`套件提供更有效率的資料結合方法，包括:

- inner_join()：保留有對應到的資料
- left_join()：保留左邊資料框的所有資料
- right_join()：保留右邊資料框的所有資料
- full_join()：保留所有資料
- semi_join()
- anti_join()

資料結合 - inner_join()
====================================
只保留兩張表都有的列
使用方法 `inner_join(x, y, by = )`


```r
#install.packages("dplyr") 第一次使用先安裝
library(dplyr)
BAndE<-inner_join(BasicS,EMDiagS,by="歸戶代號")
nrow(BAndE)
BAndE
```

```
[1] 4027
```



|院區.x |歸戶代號                                 |性別 |     生日| 院區.y| 資料年月| 輸入日期|門診號                                   |掛號科別 | 疾病序號|疾病碼 |主診斷 |重大傷病 |資料年齡 |
|:------|:----------------------------------------|:----|--------:|------:|--------:|--------:|:----------------------------------------|:--------|--------:|:------|:------|:--------|:--------|
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   200907| 20090713|B84D9A71D44658E97A2465D67C3DA4E83C22851D |33W10    |        1|78903  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201008| 20100803|999840CD1062CF9E54B18C6729154717BADCF951 |33W10    |        1|30781  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201312| 20131201|8395C8D827DB70FEFDD089E00277177A6BA76361 |33W10    |        1|38611  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201504| 20150406|4EABA332603B6570E27EA92C17454AFCCC46CA00 |33W10    |        1|7806   |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201504| 20150406|4EABA332603B6570E27EA92C17454AFCCC46CA00 |33W10    |        2|1749   |NA     |Y        |NA       |
|5      |80DB2AFAAEADC0874A35C71DB8CC693B6B33D7BF |F    | 19680725|      3|   200301| 20030103|8A2490CA9D39C76D01E893FB413FF66A727D85FC |33W10    |        1|465    |NA     |NA       |NA       |

資料結合 - left_join()
====================================
保留左邊的表所有的列
使用方法 `left_join(x, y, by = )`


```r
#install.packages("dplyr") 第一次使用先安裝
library(dplyr)
BAndEL<-left_join(BasicS,EMDiagS,by="歸戶代號")
nrow(BAndEL)
BAndEL
```

```
[1] 4532
```



|院區.x |歸戶代號                                 |性別 |     生日| 院區.y| 資料年月| 輸入日期|門診號                                   |掛號科別 | 疾病序號|疾病碼 |主診斷 |重大傷病 |資料年齡 |
|:------|:----------------------------------------|:----|--------:|------:|--------:|--------:|:----------------------------------------|:--------|--------:|:------|:------|:--------|:--------|
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   200907| 20090713|B84D9A71D44658E97A2465D67C3DA4E83C22851D |33W10    |        1|78903  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201008| 20100803|999840CD1062CF9E54B18C6729154717BADCF951 |33W10    |        1|30781  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201312| 20131201|8395C8D827DB70FEFDD089E00277177A6BA76361 |33W10    |        1|38611  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201504| 20150406|4EABA332603B6570E27EA92C17454AFCCC46CA00 |33W10    |        1|7806   |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201504| 20150406|4EABA332603B6570E27EA92C17454AFCCC46CA00 |33W10    |        2|1749   |NA     |Y        |NA       |
|5      |80DB2AFAAEADC0874A35C71DB8CC693B6B33D7BF |F    | 19680725|      3|   200301| 20030103|8A2490CA9D39C76D01E893FB413FF66A727D85FC |33W10    |        1|465    |NA     |NA       |NA       |
資料結合 - right_join()
====================================
保留右邊的表所有的列
使用方法 `right_join(x, y, by = )`


```r
#install.packages("dplyr") 第一次使用先安裝
library(dplyr)
BAndER<-right_join(BasicS,EMDiagS,by="歸戶代號")
nrow(BAndER)
BAndER
```

```
[1] 4027
```



|院區.x |歸戶代號                                 |性別 |     生日| 院區.y| 資料年月| 輸入日期|門診號                                   |掛號科別 | 疾病序號|疾病碼 |主診斷 |重大傷病 |資料年齡 |
|:------|:----------------------------------------|:----|--------:|------:|--------:|--------:|:----------------------------------------|:--------|--------:|:------|:------|:--------|:--------|
|3      |29FA4C0973C651385CE1459594B633CD03D46F8C |F    | 19470621|      3|   200905| 20090518|58D66E27654D9352953786F04119C56B8CB3DB24 |33W10    |        1|28522  |NA     |NA       |NA       |
|5      |29FA4C0973C651385CE1459594B633CD03D46F8C |F    | 19470621|      3|   200905| 20090518|58D66E27654D9352953786F04119C56B8CB3DB24 |33W10    |        1|28522  |NA     |NA       |NA       |
|3      |BC9343E012826E01ECE6B33D9C2B774F11EFC549 |F    | 19651210|      3|   200903| 20090314|4727A0AA87106EDAC08E4D27C481C4D06118BC4D |33W20    |        1|6119   |Y      |NA       |NA       |
|3      |BC9343E012826E01ECE6B33D9C2B774F11EFC549 |F    | 19651210|      3|   200904| 20090421|14DC1295765A35586CD52089120CBBCAECF85B45 |33W20    |        1|1743   |Y      |Y        |NA       |
|3      |BC9343E012826E01ECE6B33D9C2B774F11EFC549 |F    | 19651210|      3|   200904| 20090421|14DC1295765A35586CD52089120CBBCAECF85B45 |33W20    |        2|1749   |NA     |Y        |NA       |
|3      |BC9343E012826E01ECE6B33D9C2B774F11EFC549 |F    | 19651210|      3|   200905| 20090520|67DFFC73DB09635F4B8B3F4CAFA1D7FC82757E47 |33W20    |        1|1749   |Y      |Y        |NA       |

資料結合 - full_join()
====================================
保留所有的列
使用方法 `full_join(x, y, by = )`


```r
#install.packages("dplyr") 第一次使用先安裝
library(dplyr)
BAndEF<-full_join(BasicS,EMDiagS,by="歸戶代號")
nrow(BAndEF)
BAndEF
```

```
[1] 4532
```



|院區.x |歸戶代號                                 |性別 |     生日| 院區.y| 資料年月| 輸入日期|門診號                                   |掛號科別 | 疾病序號|疾病碼 |主診斷 |重大傷病 |資料年齡 |
|:------|:----------------------------------------|:----|--------:|------:|--------:|--------:|:----------------------------------------|:--------|--------:|:------|:------|:--------|:--------|
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   200907| 20090713|B84D9A71D44658E97A2465D67C3DA4E83C22851D |33W10    |        1|78903  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201008| 20100803|999840CD1062CF9E54B18C6729154717BADCF951 |33W10    |        1|30781  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201312| 20131201|8395C8D827DB70FEFDD089E00277177A6BA76361 |33W10    |        1|38611  |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201504| 20150406|4EABA332603B6570E27EA92C17454AFCCC46CA00 |33W10    |        1|7806   |Y      |NA       |NA       |
|1      |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|      3|   201504| 20150406|4EABA332603B6570E27EA92C17454AFCCC46CA00 |33W10    |        2|1749   |NA     |Y        |NA       |
|5      |80DB2AFAAEADC0874A35C71DB8CC693B6B33D7BF |F    | 19680725|      3|   200301| 20030103|8A2490CA9D39C76D01E893FB413FF66A727D85FC |33W10    |        1|465    |NA     |NA       |NA       |

資料結合 - semi_join()
====================================
留下左邊的ID也有出現在右邊的表的列，右表資料不會輸出
使用方法 `semi_join(x, y, by = )`


```r
#install.packages("dplyr") 第一次使用先安裝
library(dplyr)
BAndES<-semi_join(BasicS,EMDiagS,by="歸戶代號")
nrow(BAndES)
BAndES
```

```
[1] 576
```



|院區 |歸戶代號                                 |性別 |     生日|
|:----|:----------------------------------------|:----|--------:|
|1    |DB26EFB5F66F696208693AA3D402D03B2B8D1CB5 |F    | 19581201|
|5    |80DB2AFAAEADC0874A35C71DB8CC693B6B33D7BF |F    | 19680725|
|2    |C351B05E72BE70699B9717B3C47C23F2ECFB6094 |F    | 19421110|
|E    |83949E36D0009A4BE9ED122D8219ABF399C66AB2 |F    | 19620122|
|E    |6B576B5972961179BCEB010B5A4DF5BF1570E321 |F    | 19700810|
|E    |60E506763DFB1EAC5F959EDC08E02AEFA343CAD2 |F    | 19471010|


資料結合練習
====================================
type:alert

- 讀入門診診斷檔OptDiagS.csv
- 讀入門診醫囑檔OptOrderS.csv
- 依照**歸戶代號**以及**門診號**，將兩張表格結合，只留下有對應到的資料
  - 提示: by=c("歸戶代號","門診號")
- 請問結合後的資料有幾列？



遺漏值處理
====================================
type:sub-section

- 遺漏值(Missing Value)常常出現在真實資料內，在數值運算時常會有問題
- 最簡單的方法是將有缺值的資料移除

遺漏值處理 is.na()
====================================
如資料為向量，可使用`is.na()`來判斷資料是否為空值`NA`，若為真`TRUE`，則將資料移除。

```r
naVec<-c("a","b",NA,"d","e")
is.na(naVec)
```

```
[1] FALSE FALSE  TRUE FALSE FALSE
```

```r
naVec[!is.na(naVec)] ##保留所有在is.na()檢查回傳FALSE的元素
```

```
[1] "a" "b" "d" "e"
```



遺漏值處理 complete.cases()
====================================
若資料型態為資料框，可使用`complete.cases`來選出完整的資料列

```r
head(airquality,5)
```

| Ozone| Solar.R| Wind| Temp| Month| Day|
|-----:|-------:|----:|----:|-----:|---:|
|    41|     190|  7.4|   67|     5|   1|
|    36|     118|  8.0|   72|     5|   2|
|    12|     149| 12.6|   74|     5|   3|
|    18|     313| 11.5|   62|     5|   4|
|    NA|      NA| 14.3|   56|     5|   5|

```r
complete.cases(airquality) 
```

```
  [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
 [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [23]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [34] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE
 [45] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [56] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE
 [67]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
 [78]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
 [89]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
[100]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
[111]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
[122]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[133]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[144]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
```

遺漏值處理 complete.cases()
====================================
若資料型態為資料框，可使用`complete.cases`來選出完整的資料列，如果資料列(row)是完整的，則會回傳**TRUE**


```r
##保留所有在complete.cases()檢查回傳TRUE的元素
head(airquality[complete.cases(airquality),]) 
```

|   | Ozone| Solar.R| Wind| Temp| Month| Day|
|:--|-----:|-------:|----:|----:|-----:|---:|
|1  |    41|     190|  7.4|   67|     5|   1|
|2  |    36|     118|  8.0|   72|     5|   2|
|3  |    12|     149| 12.6|   74|     5|   3|
|4  |    18|     313| 11.5|   62|     5|   4|
|7  |    23|     299|  8.6|   65|     5|   7|
|8  |    19|      99| 13.8|   59|     5|   8|
