探索式資料分析
========================================================
author: 長庚資管 曾意儒 Yi-Ju Tseng
autosize: true
font-family: 'Microsoft JhengHei'
navigation: slide


資料分析步驟
========================================================
- 資料匯入
- 資料清洗處理並轉換為Tidy data
- **資料分析**
- 資料呈現與視覺化


資料分析大綱
====================================
type:sub-section 

- 什麼是探索式資料分析
- 量化的分析方式
- dplyr

什麼是探索式資料分析
====================================
type:sub-section 

- 探索式資料分析 (**E**xploratory **D**ata **A**nalysis)
- 在資料量 大/雜/髒 的時候，探索式資料分析非常重要
- 運用**視覺化**、**基本的統計**等工具，反覆的探索**資料特性**，獲取資料所包含的資訊、結構和特點
- 在進行複雜或嚴謹的分析之前，必須要對資料有更多認識，才能訂定**對的資料分析方向**
- 通常**不需要**嚴謹的假設和細節呈現


探索式資料分析
====================================
- 分析各變數間的**關聯性**，看是否有預料之外的有趣發現
- 觀察資料內容是否符合預期，若否，檢查資料**是否有誤**
- 檢查資料是否符合分析前的假設

透過探索性分析來**調整分析的方向**，減少因分析方向錯誤所造成的時間浪費。

探索式資料分析
====================================

- 圖形化Graphical
    - 單變量Univariate
    - 雙變量Bivariate
    - 多變量Multivariate
    
- 量化Quantitative
    - 單變量Univariate
    - 雙變量Bivariate
    - 多變量Multivariate

圖形化的分析
====================================
包括做圖與列表，將會在下章節介紹，本章節著重於量化的分析方式。


量化的分析方式: 單變量
====================================
資料初步統計，量化的分析方式可包含

- 計算集中趨勢
    - 平均值 Mean `mean()`
    - 中位數 Median `median()`
    - 眾數 Mode，R無內建函數，可直接用`table()`找出現次數最多的資料
    
量化的分析方式: 單變量-集中趨勢
====================================

```r
# 讀入資料，請將檔案放在專案路徑下
library(readr)
EMDiagS <- read_csv("EMDiagS.csv")
# 平均
mean(EMDiagS$疾病序號)
```

```
[1] 2.030484
```

量化的分析方式: 單變量-集中趨勢
====================================

```r
# 中位數
median(EMDiagS$疾病序號)
```

```
[1] 2
```

```r
# 個數計算
table(EMDiagS$掛號科別)
```

```

13W10 13W20 23W10 23W20 33W10 33W20 63W10 63W20 83W10 83W20 M3W10 
  272    10   262    12   602    76   148    12   230    44     5 
```
    
量化的分析方式: 單變量
====================================
資料初步統計，量化的分析方式可包含

- 計算資料分散程度
    - 最小值 Min `min()`
    - 最大值 Max `max()`
    - 範圍 Range `range()`
    - 四分位差 Quartiles `quantile()`
    - 變異數 Variance `var()`
    - 標準差 Standard deviation `sd()`
    
量化的分析方式: 單變量-分散程度
====================================

```r
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
DiagSumS <- read_csv("DiagSumS.csv")
min(DiagSumS$住院天數)
```

```
[1] 1
```

```r
max(DiagSumS$住院天數)
```

```
[1] 120
```

```r
range(DiagSumS$住院天數)
```

```
[1]   1 120
```

量化的分析方式: 單變量
====================================

```r
quantile(DiagSumS$住院天數)
```

```
  0%  25%  50%  75% 100% 
   1    1    3    6  120 
```

```r
var(DiagSumS$住院天數)
```

```
[1] 60.21391
```

```r
sd(DiagSumS$住院天數)
```

```
[1] 7.759762
```


量化的分析方式: 雙變量
====================================
- 列聯表 Crosstabs `table()`, `prop.table()`
- 相關性 Correlation `cor()`

量化的分析方式: 雙變量-列聯表
====================================
院區與14天內再次住院的關係

```r
table(DiagSumS$院區,
      DiagSumS$`14天內再次住院註記`)
```

```
   
      N   Y
  1 268   4
  2  80   0
  3 639  34
  5   6   0
  6 199   9
  8 308   8
  E 119  16
  N  12   1
```

量化的分析方式: 卡方
====================================
院區與14天內再次住院的關係

```r
chisq.test(table(DiagSumS$院區,
      DiagSumS$`14天內再次住院註記`))
```

```

	Pearson's Chi-squared test

data:  table(DiagSumS$院區, DiagSumS$`14天內再次住院註記`)
X-squared = 32.048, df = 7, p-value = 3.98e-05
```

量化的分析方式: 雙變量-相關性
====================================
年齡跟住院天數的關聯性（相關係數）

```r
cor(DiagSumS$年齡,
    DiagSumS$住院天數)
```

```
[1] 0.1826021
```

量化的分析方式: 雙變量-平均相比
====================================

```r
t.test(住院天數~`14天內再次住院註記`,DiagSumS)
```

```

	Welch Two Sample t-test

data:  住院天數 by 14天內再次住院註記
t = -1.6284, df = 78.391, p-value = 0.1075
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -3.1694106  0.3172919
sample estimates:
mean in group N mean in group Y 
       5.337830        6.763889 
```

量化的分析方式 w/ R
====================================
- 大多可用R的內建函數完成計算
- 但是在探索式分析時，常常需要**資料分組**
    - 觀察**男性**和**女性**的血壓差異
    - **Case**與**Control**的共病比例差異
    - 接受**治療A**和**治療B**的成效
    - ...等
- 若只用基本的內建函數計算，相當耗時
    - `data.table`和`dplyr` packages可以快速完成**分組分析**!

data.table 參考文件與資源
====================================
- [官網](https://github.com/Rdatatable/data.table/wiki)
- 指令全集[The data.table R package cheat sheet](https://s3.amazonaws.com/assets.datacamp.com/img/blog/data+table+cheat+sheet.pdf)
- [A data.table R tutorial by DataCamp](https://www.datacamp.com/community/tutorials/data-table-r-tutorial#gs.vzMYa_k)
- DataCamp [互動式教學課程](https://www.datacamp.com/courses/data-table-data-manipulation-r-tutorial)


dplyr
====================================
type:sub-section 

- [Hadley Wickham](http://hadley.nz/)開發
- 使用以下函數分析整理資料：
    - `select()`: 選要分析的欄位，欄位子集 (Column)
    - `filter()`: 選要分析的觀察值，觀察值子集 (Row)
    - `mutate()`: 增加新欄位
    - `summarise()`: 計算統計值

dplyr
====================================
type:sub-section 

- 使用以下函數分析整理資料：
    - `group_by()`: 分組依據
    - `arrange()`: 觀察值排序
    - `rename()`: 欄位重新命名
    - `%>%`: the “pipe” operator 連結上述函式，將所有函式計算串在一起執行

dplyr
====================================

如要使用必須安裝並載入`dplyr` package

```r
install.packages("dplyr") ##安裝
```

```r
library(dplyr) ##載入
```

以住院疾病統計檔為例，首先先讀入資料

```r
library(readr)
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
DiagSumS <- read_csv("DiagSumS.csv") 
```

欄位(Column)子集 select() 
====================================
- 針對欄位 (Column)做子集
- `select(資料名稱,欄位條件1,欄位條件2,...)`
- 條件1與條件2是使用**或**的連結概念


欄位(Column)子集 select() 
====================================
- `dplyr`提供幾個方便篩選名稱的函式：
    - `starts_with()`
    - `ends_with()`
    - `contains()`
    - `matches()`: matches a regular expression
    - `num_range()`: num_range("x", 8:11).
    - `one_of()`: variables in character vector
    - `everything()`

詳細說明可在R執行視窗中輸入`?select_helpers`查看。

欄位(Column)子集 select() 
====================================
篩選欄位名稱為`年齡`、開頭是`診斷類別`或是結尾是`日期`的欄位

```r
select1<-
    select(DiagSumS,年齡,starts_with("診斷類別"),
            ends_with("日期"))
head(select1)
```

| 年齡|診斷類別1 |診斷類別2 |診斷類別3 |診斷類別名稱1  |診斷類別名稱2  |診斷類別名稱3  |診斷類別4 |診斷類別5 |診斷類別名稱4      |診斷類別名稱5                |診斷類別6 |診斷類別7 |診斷類別8 |診斷類別9 |診斷類別10 |診斷類別名稱6                |診斷類別名稱7      |診斷類別名稱8                |診斷類別名稱9                                |診斷類別名稱10           | 輸入日期| 住院日期| 出院日期| 第一次住院日期|
|----:|:---------|:---------|:---------|:--------------|:--------------|:--------------|:---------|:---------|:------------------|:----------------------------|:---------|:---------|:---------|:---------|:----------|:----------------------------|:------------------|:----------------------------|:--------------------------------------------|:------------------------|--------:|--------:|--------:|--------------:|
|   38|C182      |C184      |C186      |升結腸惡性腫瘤 |橫結腸惡性腫瘤 |降結腸惡性腫瘤 |D630      |C787      |腫瘤疾病導致的貧血 |肝及肝內膽管之續發性惡性腫瘤 |C786      |C784      |C7889     |C770      |Z800       |後腹腔及腹膜之續發性惡性腫瘤 |小腸續發性惡性腫瘤 |其他消化器官之續發性惡性腫瘤 |頭，顏面及頸部淋巴結之續發性及未明性惡性腫瘤 |消化器官惡性腫瘤之家族史 | 20160421| 20160415| 20160420|       20160415|

欄位(Column)子集 select() 
====================================

若想篩選欄位`性別`到欄位`來源別`間的所有欄位，但不想要`妊娠期`欄位
- 用`:`串連欄位名稱
- 用`-`去除不要的欄位

```r
select3<-
    select(DiagSumS,性別:來源別,-妊娠期)
head(select3,3)
```

|性別 | 郵遞區號|保險別 |分娩方式 | 住院日期| 出院日期| 住院天數|來源別 |
|:----|--------:|:------|:--------|--------:|--------:|--------:|:------|
|M    |      814|A      |NA       | 20160415| 20160420|        5|O      |
|F    |      320|A      |NA       | 20160408| 20160410|        2|O      |
|F    |      813|A      |NA       | 20160226| 20160419|       53|E      |

觀察值(Row)子集 filter()
====================================
- 是針對列 (Row)做子集
- `filter(資料名稱,篩選條件1,篩選條件2)`篩選條件們是用**且**的邏輯串連
- **來源別為E**的診斷資料，可輸入下列指令

```r
filter(DiagSumS,來源別=="E")
```

|院區 |來源別 | 輸入日期| 住院日期| 出院日期| 第一次住院日期|
|:----|:------|--------:|--------:|--------:|--------------:|
|8    |E      | 20160425| 20160226| 20160419|       20160226|
|6    |E      | 20160618| 20160607| 20160612|       20160607|
|8    |E      | 20160710| 20160625| 20160708|       20160625|
|6    |E      | 20160725| 20160628| 20160719|       20160628|
|8    |E      | 20160716| 20160705| 20160714|       20160705|
|8    |E      | 20160507| 20160427| 20160506|       20160427|

觀察值(Row)子集 filter()
====================================
也可選擇住院天數大於50的資料

```r
filter(DiagSumS,住院天數 > 50)
```

|院區 |來源別 | 住院天數| 輸入日期| 住院日期| 出院日期| 第一次住院日期|
|:----|:------|--------:|--------:|--------:|--------:|--------------:|
|8    |E      |       53| 20160425| 20160226| 20160419|       20160226|
|3    |O      |       57| 20110829| 20110629| 20110825|       20110629|
|3    |E      |       62| 20080304| 20071204| 20080204|       20071204|
|3    |E      |       53| 20070208| 20061216| 20070207|       20061216|
|2    |E      |       55| 20040706| 20040508| 20040702|       20040508|
|6    |O      |       55| 20071001| 20070710| 20070903|       20070710|


觀察值(Row)子集 filter()
====================================
也可使用 `&` 和 `|`等符號串連邏輯

```r
filter(DiagSumS,住院天數 > 50
           & 來源別=="E")
```

|院區 |來源別 | 住院天數| 輸入日期| 住院日期| 出院日期| 第一次住院日期|
|:----|:------|--------:|--------:|--------:|--------:|--------------:|
|8    |E      |       53| 20160425| 20160226| 20160419|       20160226|
|3    |E      |       62| 20080304| 20071204| 20080204|       20071204|
|3    |E      |       53| 20070208| 20061216| 20070207|       20061216|
|2    |E      |       55| 20040706| 20040508| 20040702|       20040508|
|3    |E      |      120| 20110509| 20101216| 20110415|       20101216|
|3    |E      |       55| 20130930| 20130725| 20130918|       20130725|

dplyr 子集練習
====================================
type:alert
incremental:true

- 讀入住院疾病統計檔資料

```r
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
library(readr)
DiagSumS <- read_csv("DiagSumS.csv") 
```
- 試著用dplyr語法篩選出所有**男性**且**居住地為高雄市**的資料
- 只留下性別、起始字串為“診斷類別”的所有欄位、住院天數、住院日期 五個欄位




計算統計值 summarise() 
====================================
- **資料筆數**、**不重複的歸戶代號數**以及**不重複的來源別數**等
- n(), n_distinct()

```r
summarise(DiagSumS,
          nRecord=n(),
          nID=n_distinct(歸戶代號),
          nSource=n_distinct(來源別))
```

```
# A tibble: 1 x 3
  nRecord   nID nSource
    <int> <int>   <int>
1    1703   352       2
```

計算統計值 summarise() 
====================================
- 通常會與其他功能合併使用
- 計算**住院超過50天的**的**資料筆數**、**不重複的歸戶代號數**、**平均年齡**以及**性別為男性的資料筆數**

```r
filter1<-filter(DiagSumS,住院天數 > 50)
summarise(filter1,
          nRecord=n(),
          nID=n_distinct(歸戶代號),
          meanAge=mean(年齡),
          nM=sum(性別=="M"))
```

```
# A tibble: 1 x 4
  nRecord   nID meanAge    nM
    <int> <int>   <dbl> <int>
1      10     9    63.1     0
```

dplyr filter()+summarise() 練習
====================================
type:alert
incremental:true

- 讀入住院疾病統計檔資料

```r
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
library(readr)
DiagSumS <- read_csv("DiagSumS.csv") 
```
- 試著用dplyr語法篩選出所有**住院超過30天的**的資料
- 計算這些資料的**來源別為E的數目**，**診斷類別名稱1中包含“腫瘤”文字的資料筆數**
- 提示: grepl

pipe %>%
====================================
- 直接用**pipe**符號`%>%`將指令串連，減少暫存物件（filter1）的生成

```r
filter(DiagSumS,住院天數 > 50) %>%
    summarise(nRecord=n(),
          nID=n_distinct(歸戶代號),
          meanAge=mean(年齡),
          nM=sum(性別=="M"))
```

```
# A tibble: 1 x 4
  nRecord   nID meanAge    nM
    <int> <int>   <dbl> <int>
1      10     9    63.1     0
```

修改欄位名稱 rename()
====================================
`新名稱=舊名稱`

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
DiagSumE[1:5,1:2]
```

```
# A tibble: 5 x 2
   Hosp 資料年月
  <chr>    <int>
1     8   201604
2     3   201604
3     8   201604
4     2   201604
5     3   201604
```

分組 group_by()
====================================
- 設定分組依據
- 與`summarise()`函式合併使用
- 計算各**性別**（以性別作為分組依據）的**資料筆數**、**平均年齡**以及**平均住院天數**

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
group_by(DiagSumE,Gender)%>%
    summarise(nRecord=n(),
        meanAge=mean(年齡),
        meanHos=mean(住院天數))
```

|Gender | nRecord|  meanAge|  meanHos|
|:------|-------:|--------:|--------:|
|F      |    1672| 53.14833| 5.405502|
|M      |      31| 42.48387| 5.000000|

分組 group_by()
====================================

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
group_by(DiagSumE,Gender)%>%
    summarise(nRecord=n(),
        meanAge=mean(年齡),
        meanHos=mean(住院天數))
```

|Gender | nRecord|  meanAge|  meanHos|
|:------|-------:|--------:|--------:|
|F      |    1672| 53.14833| 5.405502|
|M      |      31| 42.48387| 5.000000|

分組 group_by()
====================================
- 可設定**多個**分組依據
- 計算各**院區**各**性別**的**資料筆數**、**平均年齡**以及**平均住院天數**

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
group_by(DiagSumE,Hosp,Gender) %>%
    summarise(nRecord=n(),
        meanAge=mean(年齡),
        meanHos=mean(住院天數))
```

|Hosp |Gender | nRecord|  meanAge|  meanHos|
|:----|:------|-------:|--------:|--------:|
|1    |F      |     272| 50.79412| 2.305147|
|2    |F      |      79| 62.89873| 7.316456|
|2    |M      |       1| 76.00000| 3.000000|


分組 group_by()
====================================

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
group_by(DiagSumE,Hosp,Gender) %>%
    summarise(nRecord=n(),
        meanAge=mean(年齡),
        meanHos=mean(住院天數))
```

|Hosp |Gender | nRecord|  meanAge|  meanHos|
|:----|:------|-------:|--------:|--------:|
|1    |F      |     272| 50.79412| 2.305147|
|2    |F      |      79| 62.89873| 7.316456|
|2    |M      |       1| 76.00000| 3.000000|

排序 arrange()
====================================
排序功能，預設為**遞增排序**

```r
arrange(DiagSumS,住院天數) %>% 
  select(院區,住院天數)
```

|院區 | 住院天數|
|:----|--------:|
|3    |        1|
|1    |        1|
|3    |        1|
|3    |        1|
|3    |        1|
|3    |        1|

遞減排序 arrange()
====================================
使用`desc()`將要**遞減排序**的變數包起來，就可以遞減排序

```r
arrange(DiagSumS,
        desc(住院天數),
        desc(年齡)) %>% 
  select(院區,住院天數,年齡)
```

|院區 | 住院天數| 年齡|
|:----|--------:|----:|
|3    |      120|   68|
|3    |       62|   78|
|3    |       59|   51|
|3    |       57|   74|
|3    |       55|   71|
|2    |       55|   63|



dplyr綜合範例
====================================
- 結合`group_by()`、`summarise()`、`arrange()`，完成一連串的資料分析
- 計算各**院區**各**性別**的資料數、平均住院天數以及平均年齡，並依平均住院天數**由大到小排序**

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
group_by(DiagSumE,Hosp,Gender) %>%
    summarise(nRecord=n(),
        meanAge=mean(年齡),
        meanHos=mean(住院天數)) %>%
  arrange(desc(meanHos))
```

|Hosp |Gender | nRecord|  meanAge|   meanHos|
|:----|:------|-------:|--------:|---------:|
|5    |F      |       6| 51.00000| 14.166667|
|N    |F      |      13| 58.23077|  7.923077|
|2    |F      |      79| 62.89873|  7.316456|


dplyr綜合範例
====================================

```r
DiagSumE <- rename(DiagSumS, Hosp = 院區,Gender=性別)
group_by(DiagSumE,Hosp,Gender) %>%
    summarise(nRecord=n(),
        meanAge=mean(年齡),
        meanHos=mean(住院天數)) %>%
  arrange(desc(meanHos))
```

|Hosp |Gender | nRecord|  meanAge|   meanHos|
|:----|:------|-------:|--------:|---------:|
|5    |F      |       6| 51.00000| 14.166667|
|N    |F      |      13| 58.23077|  7.923077|
|2    |F      |      79| 62.89873|  7.316456|
|3    |F      |     670| 54.64627|  6.537313|
|8    |F      |     289| 52.34948|  5.882353|
|E    |F      |     135| 50.23704|  5.777778|

dplyr 綜合練習
====================================
type:alert
incremental:true

- 讀入住院疾病統計檔資料

```r
library(readr)
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
DiagSumS <- read_csv("DiagSumS.csv")
```

- 試著用dplyr語法篩選出所有**年齡超過60**的**女性**資料
- 依**院區**，計算**總資料筆數**、**來源別為E的資料個數**，**診斷類別名稱1中有腫瘤字樣的資料筆數**
- 依總資料筆數**由大到小**排序
- 用pipe **%>%**


dplyr 參考文件與資源
====================================
- [Introduction to dplyr](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)
- DataCamp互動式教學課程 [Data Manipulation in R with dplyr](https://www.datacamp.com/courses/dplyr-data-manipulation-r-tutorial)

其他常用資料處理方法
====================================
資料分組 (數值型態)

```r
summary(DiagSumS$年齡)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  23.00   46.00   52.00   52.95   59.00   92.00 
```

```r
DiagSumS$AgeGroup<-
  cut(DiagSumS$年齡,
      breaks = c(0,50,65,100),
      labels = c("<=50","50-65",">65"))
```

其他常用資料處理方法
====================================
資料分組 (數值型態)

```r
table(DiagSumS$AgeGroup)
```

```

 <=50 50-65   >65 
  719   708   276 
```

其他常用資料處理方法
====================================
資料分組 (類別型態)

```r
table(DiagSumS$居住地)
```

```

高雄市 高雄縣   基隆 基隆市   嘉義 嘉義縣   苗栗 苗栗縣   屏東 屏東縣 
   190     94    114     49     83     56     67     19     11      3 
  其他 台北市 台北縣   台南 台南市   台中 台中市   臺東   桃園 桃園縣 
     8    126    205     33     25      8     11      1    215    114 
新北市   新竹 新竹縣   宜蘭 宜蘭縣   雲林 雲林縣   彰化 彰化縣 
    48     99     10     13     28     41     15      6     11 
```

其他常用資料處理方法
====================================
資料分組 (類別型態)

```r
DiagSumS$ResGroup<-""
DiagSumS$ResGroup[
  grepl("台北|基隆|苗栗|桃園|新北市|新竹",
        DiagSumS$居住地)] <- "北"
DiagSumS$ResGroup[
  grepl("台中|雲林|彰化",
        DiagSumS$居住地)] <- "中"
DiagSumS$ResGroup[
  grepl("高雄|嘉義|屏東|台南",
        DiagSumS$居住地)] <- "南"
DiagSumS$ResGroup[
  grepl("臺東|宜蘭",DiagSumS$居住地)] <- "東"
table(DiagSumS$ResGroup)
```

```

       北   東   南   中 
   8 1066   42  495   92 
```

其他常用資料處理方法
====================================
資料分組 (類別型態)

```r
table(DiagSumS$ResGroup)
```

```

       北   東   南   中 
   8 1066   42  495   92 
```

其他常用資料處理方法
====================================

診斷碼處理，使用[icd套件](https://cran.r-project.org/web/packages/icd/vignettes/introduction.html)

```r
#install.packages("icd")
library(icd)
head(DiagSumS$診斷類別1)
```

```
[1] "C182"   "Z5111"  "C7932"  "C50911" "C50912" "Z5111" 
```

```r
DiagSumS$Diag1Point<-
  icd_short_to_decimal(DiagSumS$診斷類別1)
head(DiagSumS$Diag1Point)
```

```
[1] "C18.2"   "Z51.11"  "C79.32"  "C50.911" "C50.912" "Z51.11" 
attr(,"icd_short_diag")
[1] FALSE
attr(,"class")
[1] "icd10"     "character"
```

其他常用資料處理方法
====================================

診斷碼處理，使用[icd套件](https://cran.r-project.org/web/packages/icd/vignettes/introduction.html)

```r
AHRQ<-
  icd10_comorbid_ahrq(
    DiagSumS %>% filter(住院日期>20160101) %>% 
      rename(visit_name=住院號,icd_name=診斷類別1))
head(AHRQ)
```

```
                                           CHF Valvular  PHTN   PVD   HTN
09943B25F70692472209D9DC2DB01924E031DCF3 FALSE    FALSE FALSE FALSE FALSE
10789012B227DE0AEA18F558093910F03B81B01C FALSE    FALSE FALSE FALSE FALSE
1154034264E61228A2C3468446E16A0A00DE5806 FALSE    FALSE FALSE FALSE FALSE
11817F33763B2D11EA2F582792881F6F44F104B3 FALSE    FALSE FALSE FALSE FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3 FALSE    FALSE FALSE FALSE FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9 FALSE    FALSE FALSE FALSE FALSE
                                         Paralysis NeuroOther Pulmonary
09943B25F70692472209D9DC2DB01924E031DCF3     FALSE      FALSE     FALSE
10789012B227DE0AEA18F558093910F03B81B01C     FALSE      FALSE     FALSE
1154034264E61228A2C3468446E16A0A00DE5806     FALSE      FALSE     FALSE
11817F33763B2D11EA2F582792881F6F44F104B3     FALSE      FALSE     FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3     FALSE      FALSE     FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9     FALSE      FALSE     FALSE
                                            DM  DMcx Hypothyroid Renal
09943B25F70692472209D9DC2DB01924E031DCF3 FALSE FALSE       FALSE FALSE
10789012B227DE0AEA18F558093910F03B81B01C FALSE FALSE       FALSE FALSE
1154034264E61228A2C3468446E16A0A00DE5806 FALSE FALSE       FALSE FALSE
11817F33763B2D11EA2F582792881F6F44F104B3 FALSE FALSE       FALSE FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3 FALSE FALSE       FALSE FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9 FALSE FALSE       FALSE FALSE
                                         Liver   PUD   HIV Lymphoma  Mets
09943B25F70692472209D9DC2DB01924E031DCF3 FALSE FALSE FALSE    FALSE FALSE
10789012B227DE0AEA18F558093910F03B81B01C FALSE FALSE FALSE    FALSE FALSE
1154034264E61228A2C3468446E16A0A00DE5806 FALSE FALSE FALSE    FALSE FALSE
11817F33763B2D11EA2F582792881F6F44F104B3 FALSE FALSE FALSE    FALSE FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3 FALSE FALSE FALSE    FALSE FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9 FALSE FALSE FALSE    FALSE FALSE
                                         Tumor Rheumatic Coagulopathy
09943B25F70692472209D9DC2DB01924E031DCF3  TRUE     FALSE        FALSE
10789012B227DE0AEA18F558093910F03B81B01C FALSE     FALSE        FALSE
1154034264E61228A2C3468446E16A0A00DE5806  TRUE     FALSE        FALSE
11817F33763B2D11EA2F582792881F6F44F104B3  TRUE     FALSE        FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3 FALSE     FALSE        FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9 FALSE     FALSE        FALSE
                                         Obesity WeightLoss FluidsLytes
09943B25F70692472209D9DC2DB01924E031DCF3   FALSE      FALSE       FALSE
10789012B227DE0AEA18F558093910F03B81B01C   FALSE      FALSE       FALSE
1154034264E61228A2C3468446E16A0A00DE5806   FALSE      FALSE       FALSE
11817F33763B2D11EA2F582792881F6F44F104B3   FALSE      FALSE       FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3   FALSE      FALSE       FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9   FALSE      FALSE       FALSE
                                         BloodLoss Anemia Alcohol Drugs
09943B25F70692472209D9DC2DB01924E031DCF3     FALSE  FALSE   FALSE FALSE
10789012B227DE0AEA18F558093910F03B81B01C     FALSE  FALSE   FALSE FALSE
1154034264E61228A2C3468446E16A0A00DE5806     FALSE  FALSE   FALSE FALSE
11817F33763B2D11EA2F582792881F6F44F104B3     FALSE  FALSE   FALSE FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3     FALSE  FALSE   FALSE FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9     FALSE  FALSE   FALSE FALSE
                                         Psychoses Depression
09943B25F70692472209D9DC2DB01924E031DCF3     FALSE      FALSE
10789012B227DE0AEA18F558093910F03B81B01C     FALSE      FALSE
1154034264E61228A2C3468446E16A0A00DE5806     FALSE      FALSE
11817F33763B2D11EA2F582792881F6F44F104B3     FALSE      FALSE
1576CA34B231793C11F64BA943DBC0BBE64B20D3     FALSE      FALSE
2047F88EC36E01061BBCDAC5D8496F6BC43C2FF9     FALSE      FALSE
```

長表與寬表
====================================
type:sub-section

- 在資料處理的過程中，常因各種需求，需要執行長寬表互換的動作
- tidyr package提供完整的轉換功能
    - 寬表轉長表 `gather(資料/寬表,key=長表標籤欄位名,value=長表數值欄位名,-保留欄位名)`
    - 長表轉寬表 `spread(資料/長表,欄位依據,數值依據)`
    
長表與寬表
====================================
原來的`DiagSumS`資料框中，有診斷類別1~10等欄位 (Column)，屬於寬表

```r
DiagWide<-DiagSumS %>% 
  select(住院號,starts_with("診斷類別"),-contains("名稱")) 
DiagWide%>% head(3)
```

|住院號                                   |診斷類別1 |診斷類別2 |診斷類別3 |診斷類別4 |診斷類別5 |診斷類別6 |診斷類別7 |診斷類別8 |診斷類別9 |診斷類別10 |
|:----------------------------------------|:---------|:---------|:---------|:---------|:---------|:---------|:---------|:---------|:---------|:----------|
|702C16076DD204640C6A5FC7F59B79F197DDB256 |C182      |C184      |C186      |D630      |C787      |C786      |C784      |C7889     |C770      |Z800       |
|7E18FC6A8CA3C9CD01FF31AFD23DE0765FCEF7E1 |Z5111     |C50912    |F410      |NA        |NA        |NA        |NA        |NA        |NA        |NA         |
|9E75B54E1E88CF63E99E543B2EDF48F8478CEC5E |C7932     |G9529     |C50812    |G8221     |NA        |NA        |NA        |NA        |NA        |NA         |

寬表轉長表 gather（）
====================================

- 保留住院號欄位
- 將其他欄位的名稱整合至**診斷類別**欄位，數值整合至**診斷碼**欄位

```r
library(tidyr)
DiagLong<-gather(DiagWide,診斷類別,診斷碼,-住院號)
```

```r
head(DiagLong %>% arrange(住院號))
```

|住院號                                   |診斷類別  |診斷碼 |
|:----------------------------------------|:---------|:------|
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |診斷類別1 |V581   |
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |診斷類別2 |1749   |
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |診斷類別3 |NA     |
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |診斷類別4 |NA     |
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |診斷類別5 |NA     |
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |診斷類別6 |NA     |

長表轉寬表 spread（）
====================================

- `DiagLong`資料框中，剩下住院號，診斷類別，診斷碼等三個欄位 (Column)，屬於長表
- 診斷類別欄位的值轉換為新欄位名稱，並將診斷碼欄位填回新增的欄位


```r
DiagWide2<-spread(DiagLong, 診斷類別,診斷碼) 
```

```r
head(DiagWide2)
```

|住院號                                   |診斷類別1 |診斷類別10 |診斷類別2 |診斷類別3 |診斷類別4 |診斷類別5 |診斷類別6 |診斷類別7 |診斷類別8 |診斷類別9 |
|:----------------------------------------|:---------|:----------|:---------|:---------|:---------|:---------|:---------|:---------|:---------|:---------|
|002CEB0F04298F1AC1FA98F4FC2DDEC1D1ADBFE8 |V581      |NA         |1749      |NA        |NA        |NA        |NA        |NA        |NA        |NA        |
|004DF8BD9AD1D8C92AA2C5739ED223E635509C4D |1748      |NA         |NA        |NA        |NA        |NA        |NA        |NA        |NA        |NA        |
|006D6B3AB3DAEB5AEDB07A923D2E6D4F731861E8 |V581      |NA         |1749      |7032      |4019      |NA        |NA        |NA        |NA        |NA        |
|013C05BC5B079C65F04B776EE196B2DBABFDAF93 |1749      |NA         |NA        |NA        |NA        |NA        |NA        |NA        |NA        |NA        |
|01BBC667F122DAA3D2CE280B6B53410F8CB07ACC |V540      |NA         |4279      |V103      |NA        |NA        |NA        |NA        |NA        |NA        |
|01BF067E746392E7F3894621E231EC670DC563B2 |V581      |NA         |1744      |NA        |NA        |NA        |NA        |NA        |NA        |NA        |

