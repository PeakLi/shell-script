#!/bin/bash
varDemo=lizhenye
echo "Hello" $varDemo
myUrl="http://www.w3cschool.cc"
#只读变量
readonly myUrl
myUrl="http://www.runoob.com"
#删除变量
unset varDemo
#变量被删除后不能再次使用。unset 命令不能删除只读变量。
echo $varDemo
#单引号:单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；单引号字串中不能出现单引号（对单引号使用转义符后也不行）
#双引号
echo "Hello $myUrl"
echo "Hello \"$myUrl\""
#拼接字符串
yourname=lizhenye
greeting="Hello "$yourname""
greeting_1="Hello $yourname"
echo $greeting $greeting_1
#获取字符串的长度
string='abcd'
echo ${#string}
#提取子字符串
#以下实例从字符串第 2 个字符开始截取 4 个字符：
string='abcde fghjk lmn'
echo ${string:1:4}
#查找子字符串 查找字符 "i 或 s" 的位置：
string="rusnoob is a great company"
echo `expr index "$string" is`  # 输出 8
echo `expr index "$string" rs`  # 输出 1
#注意： 以上脚本中 "`" 是反引号，而不是单引号 "'"，不要看错了哦。

#Shell 数组
#bash支持一维数组（不支持多维数组），并且没有限定数组的大小。
#类似与C语言，数组元素的下标由0开始编号。获取数组中的元素要利用下标，下标可以是整数或算术表达式，其值应大于或等于0。
#在Shell中，用括号来表示数组，数组元素用"空格"符号分割开。定义数组的一般形式为：
#数组名=(值1 值2 ... 值n)
array_name=(value0 value1 value2 value3)
#或者
array_name=(
value0
value1
value2
value3
)
#还可以单独定义数组的各个分量：
array_name[0]=value0_new
array_name[1]=value1_new
#array_name[n]=valuen
#读取数组
#读取数组元素值的一般格式是：
#${数组名[下标]}
echo ${array_name[@]}

#获取数组的长度
#获取数组长度的方法与获取字符串长度的方法相同，例如：
# 取得数组元素的个数
# 使用@符号可以获取数组中的所有元素，例如：
length=${#array_name[@]}
echo length@ $length
# 或者
length=${#array_name[*]}
echo length* $length
# 取得数组单个元素的长度,应该是第一个元素的长度
length=${#array_name[n]}
echo lengthn $length

#Shell 注释
	#以"#"开头的行就是注释，会被解释器忽略。
	#sh里没有多行注释，只能每一行加一个#号。只能像这样：
#{每一行加个#符号太费力了，可以把这一段要注释的代码用一对花括号括起来，
#	定义成一个函数，没有地方调用这个函数，
#	这块代码就不会执行，达到了和注释一样的效果}

#Linux 的字符串截取很有用有八种方法。
# 1.号截取，删除左边字符，保留右边字符。最左边开始
var=http://www.aaa.com/123.htm
echo 1:${var#*/}
## 号截取，删除左边字符，保留右边字符。
echo 2:${var##*a}
#2. ##*/ 表示从左边开始删除最后（最右边）一个 / 号及左边的所有字符。最右边开始
#即删除 http://www.aaa.com/
#结果是 123.htm

#3. %号截取，删除右边字符，保留左边字符 最右边开始
echo 3:${var%/*}
#%/* 表示从右边开始，删除第一个 / 号及右边的字符
#结果是：http://www.aaa.com

#4. %% 号截取，删除右边字符，保留左边字符
echo 4:${var%%/*}
#%%/* 表示从右边开始，删除最后（最左边）一个 / 号及右边的字符
#结果是：http:

#5从左边第几个字符开始，及字符的个数
echo 5:${var:0:5}

#6. 从左边第几个字符开始，一直到结束。
echo 6:${var:7}
#其中的 7 表示左边第8个字符开始，一直到结束。
#结果是 ：www.aaa.com/123.htm

#7. 从右边第几个字符开始，及字符的个数
echo 7:${var:0-7:3}
#其中的 0-7 表示右边算起第七个字符开始，3 表示字符的个数。
#结果是：123

#8. 从右边第几个字符开始，一直到结束。
echo 8:${var:0-7}
echo 注：（左边的第一个字符是用 0 表示，右边的第一个字符用 0-1 表示）

var="http://www.runoob.com/linux/linux-shell-variable.html"

s1=${var%%t*}
#h
s2=${var%t*}
#http://www.runoob.com/linux/linux-shell-variable.h
s3=${var%%.*}
#http://www
s4=${var#*/}
#/www.runoob.com/linux/linux-shell-variable.html
s5=${var##*/}
#linux-shell-variable.html
echo $s1 $s2 $s3 $s4 $s5
read -p "Press any key to continue" choice