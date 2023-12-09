#1. 使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出。
#- 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；
getwd()
mypath = "C:/Users/王一舟/Dropbox/bigdata_econ_2023/data/assignment_idaccuracy/Aminer"
file.exists(mypath)
setwd(mypath)#设置工作路径

library(readr)
merged_data <- data.frame()#创建一个空的数据框

file_list <- list.files(mypath, pattern = "\\.csv", full.names = TRUE)#读入目录下包括隐藏文件在内的所有目录和文件
for (file in file_list) {
  current_data <- read.csv(file,header = TRUE, stringsAsFactors = FALSE, na.strings = "", fill = TRUE)
  merged_data <- rbind(merged_data, current_data)
  }
merged_data <- merged_data[,c("doi","年份","期刊","标题")]
print(merged_data)


#2. 使用apply家族函数替代上述步骤中的for循环
merged_dataframe <- list.files(mypath, full.names = TRUE)
data <- lapply(merged_dataframe, read.csv)
merged_dataframe <- do.call(rbind,data)
merged_dataframe<- merged_dataframe[,c("doi", "年份", "期刊", "标题")]
print(merged_dataframe)

#3. 将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。
#(不太会，麻烦老师指导QAQ)
#! /usr/bin/env Rscript
args = commandArgs(T)
mypath = args(1)

merged_dataframe <- list.files(mypath, full.names = TRUE)
data <- lapply(merged_dataframe, read.csv)
merged_dataframe <- do.call(rbind,data)
merged_dataframe<- merged_dataframe[,c("doi", "年份", "期刊", "标题")]
print(merged_dataframe)

sudo chmod +x assignment2.r
./assignment2.r 3 4


