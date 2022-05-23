"########################################################################
"# File Name:readme@xxdk.sh
"# Version: v0.1.0
"# Author: XXDK
"# mail: v.manstein@qq.com
"# Created Time: Thu 04 Jun 2015 05:59:17 PM CST
"# NOTE
"########################################################################
XXDK-------------------------系统级环境配置>>：

	1.mkdir ~/src@xxdk: all the source packages put in ~/src@xxdk
	2.install vmtools
	3.apt-get update
	4.sudo apt-get install build-essential 安装c、c++必须组件
	5.sudo apt-get install vim
	6.sudo apt-get install xscreensaver
	  sudo apt-get install xscreensaver-extra
	  sudo apt-get install xscreensaver-gl
	  sudo apt-get install xscreensaver-gl-extra
	7.livewallpaper
	  sudo add-apt-repository ppa:fyrmir/livewallpaper-daily 
      sudo apt-get update && sudo apt-get install livewallpaper livewallpaper-config livewallpaper-indicator
XXDK--------------------------嵌入式环境配置>>：

	1.拷贝bashrc@xxdk和vimrc@xxdk和README@xxdk到xxdk/ 打开三个文件按要求配置
	2.
	3.
	4.
	5.
	6.ctags和taglist安装
		a.安装ctags，Redhat和CentOS可以执行yum install ctags，Debian和Ubantu可以执行apt-get install ctags

		下载Taglist，地址是http://sourceforge.net/projects/vim-taglist/files/vim-taglist/

		解压taglist_45.zip，可以看到有两个目录doc和plugin，结构如下

		复制代码
		taglist_46
		|
		|-------- doc
		|         \-------- taglist.txt
		|
		\-------- plugin
				  \-------- taglist.vim
		复制代码
		 
		执行下列shell命令，即安装完成(注意：这里的vim74视具体vim版本而定)

		cp  doc/taglist.txt  /usr/share/vim/vim74/doc/
		cp  plugin/taglist.vim  /usr/share/vim/vim74/plugin/
		
		b.生成tags文件
		安装成功后，要为源码文件生成tags文件，才可享受ctags为阅读代码带来的便利。

		$ ctags -R
		递归的为当前目录及子目录下的所有代码文件生成tags文件

		为某些源码生成tags文件，使用如下命令
		$ ctags filename.c filename1.c file.h 
		或
		$ ctags *.c *.h

		为了使得字段补全有效，在生成tags时需要一些额外的参数，推荐的c++参数主要是：
		ctags -R --c++-kinds=+px --fields=+iaS --extra=+q
		其中：
		选项c++-kinds 用于指定C++语言的 tags记录类型,  --c-kinds用于指定c语言的，  通用格式是  --{language}-kinds
		选项 fileds 用于指定每条标记的扩展字段域
		extra 选项用于增加额外的条目:   f表示为每个文件增加一个条目，  q为每个类增加一个条目

    	c.ctags使用方法
		在vim打开源码时，指定tags文件，才可正常使用，通常手动指定，在vim命令行输入：
		:set tags=./tags(当前路径下的tags文件)
		若要引用多个不同目录的tags文件，可以用逗号隔开

		或者，设置 ~/.vimrc，加入一行，则不用手动设置tags路径：
		set tags=~/path/tags

		若要加入系统函数或全局变量的tag标签，则需执行(注意：生成的tags文件可能位于~/下，可将其重命名移动到~/.vim/下)：
		ctags -I __THROW –file-scope=yes –langmap=c:+.h –languages=c,c++ –links=yes –c-kinds=+p --fields=+S -R -f ~/.vim/systags /usr/include /usr/local/include
		并且在~/.vimrc中添加（亦可用上面描述的手动加入的方式）：
		set tags+=~/.vim/systags
		这样，便可以享受系统库函数名补全、原型预览等功能了。

		如果经常在不同工程里查阅代码，那么可以在~/.vimrc中添加：
		set tags=tags;
		set autochdir

		设置好了tags文件，在定位变量/函数的定义时，最常用的快捷键是：
		Ctrl + ]
		跳转到变量或函数的定义处，或者用命令
		:ta name
		而使用快捷组合键
		Ctrl + o/t 
		返回到跳转前的位置。

		另外，ctags不会生成局部变量的索引，不过可以使用gd组合键（对光标所在处的word进行快捷查找定位）来定位，也是相当快捷的。

		$ vim -t myAdd
		用vim打开文件时，添加参数-t funcName会自动打开定义该函数的文件并定位到定义首行，上面这句就是找到myAdd定义的文件打开并将光标置于定义的第一行处。

		:tags 
		会列出查找/跳转过程(经过的标签列表)

		另外，附上vim环境中其他较为好用的快捷键：
		* 定位至当前光光标所指单词的下一次出现的地方
		# 定位至当前光光标所指单词的上一次出现的地方
		n 定位至跳至已被标记出的单词下一次出现的地方
		shift+n 定位至跳至已被标记出的单词上一次出现的地方

		关于更详细的ctags用法，vim中使用
		:help tags
		
	    d.taglist使用方法：
		在源码目录下，执行ctags -R对各目录递归创建生成tags文件

		用Vim打开源码文件，以命令模式执行Tlist，即可启用Taglist插件，<F1>可以查看taglist的帮助信息
		
XXDK--------------------------pixhawk环境配置>>：		
		Building the pixhawk code
		Quick start
		For Ubuntu, follow these steps to build the code:
		1.Install git:
			  sudo apt-get -qq -y install git
		2.Clone the source:
			  mkdir ~/pixhawk -p
			  cd ~/pixhawk/
			  git clone https://github.com/ArduPilot/ardupilot.git
		3.Run the install-prereqs-ubuntu.sh script:
			  cd pixhawk
			  ardupilot/Tools/scripts/install-prereqs-ubuntu.sh -y
		4.Reload the path (log-out and log-in to make permanent):
			  NOTE<the ardupilot env path is in ~/.profile>
			  . ~/.profile
		5.Export the crossing tools chain in ~/.bashrc
			  export PATH="$PATH:/...xxdk.../bin"
		6.Restart the system
			  init 6
		7.Update the submodules in ardupilot
			  cd ~/pixhawk/ardupilot
			  git submodule update --init --recursive
		8.Change the directory to the target directory such as ArduCopter and make
			  make px4-v2
		9.Get the Image in /ardupilot/modules/PX4Firmware/Images(make sure the ground station has been installed)
			  px4fmu-v2_APM.px4
			  make px4-v2-upload
		10.Enjoy！！！
		
XXDK--------------------------Makefile template>>：		
	不才，总结个人常用makefile模板，以备后用。
	1、编译动态库
		[plain] view plain copy
		#############################################################   
		# Makefile for shared library.  
		# 编译动态链接库  
		#############################################################  
		#set your own environment option  
		CC = g++  
		CC_FLAG = -D_NOMNG -D_FILELINE  
		  
		#set your inc and lib  
		INC =   
		LIB = -lpthread -L./ -lsvrtool  
		  
		#make target lib and relevant obj   
		PRG = libsvrtool.so  
		OBJ = Log.o  
		  
		#all target  
		all:$(PRG)  
		  
		$(PRG):$(OBJ)  
			$(CC) -shared -o $@ $(OBJ) $(LIB)  
		  
		.SUFFIXES: .c .o .cpp  
		.cpp.o:  
			$(CC) $(CC_FLAG) $(INC) -c $*.cpp -o $*.o  
		  
		.PRONY:clean  
		clean:  
			@echo "Removing linked and compiled files......" 
			rm -f $(OBJ) $(PRG)  
	2、编译静态库
		[plain] view plain copy
		#############################################################  
		# Makefile for static library.  
		# 编译静态链接库  
		#############################################################  
		#set your own environment option  
		CC = g++  
		CC_FLAG = -D_NOMNG -D_FILELINE  
		  
		#static library use 'ar' command   
		AR = ar  
		  
		#set your inc and lib  
		INC =   
		LIB = -lpthread -L./ -lsvrtool  
		  
		#make target lib and relevant obj   
		PRG = libsvrtool.a  
		OBJ = Log.o  
		  
		#all target  
		all:$(PRG)  
		$(PRG):$(OBJ)  
			${AR} rv ${PRG} $?  
		  
		.SUFFIXES: .c .o .cpp  
		.cpp.o:  
			$(CC) $(CC_FLAG) $(INC) -c $*.cpp -o $*.o  
		  
		.PRONY:clean  
		clean:  
			@echo "Removing linked and compiled files......"  
			rm -f $(OBJ) $(PRG)  
	3、可执行程序
		[plain] view plain copy
		###########################################  
		#Makefile for simple programs  
		###########################################  
		INC=  
		LIB= -lpthread  
		  
		CC=CC  
		CC_FLAG=-Wall  
		  
		PRG=threadpooltest  
		OBJ=CThreadManage.o CThreadPool.o CThread.o CWorkerThread.o threadpooltest.o  
		  
		$(PRG):$(OBJ)  
			$(CC) $(INC) $(LIB) -o $@ $(OBJ)  
			  
		.SUFFIXES: .c .o .cpp  
		.cpp.o:  
			$(CC) $(CC_FLAG) $(INC) -c $*.cpp -o $*.o  
		  
		.PRONY:clean  
		clean:  
			@echo "Removing linked and compiled files......"  
			rm -f $(OBJ) $(PRG)  

	随机组合、举一反三会写出适合项目的makefile

XXDK--------------------------find grep sed awk>>：

	1，在某个路径下查文件。
		在/etc下查找“*.log”的文件
		find /etc -name “*.log”
		2，扩展，列出某个路径下所有文件，包括子目录。
		find /etc -name “*”
		3，在某个路径下查找所有包含“hello abcserver”字符串的文件。
		find /etc -name “*” | xargs grep “hello abcserver”
		或者find /etc -name “*” | xargs grep “hello abcserver” > ./cqtest.txt
		4，网上摘抄的几个和查找文件或文件内容相关的命令详说：
		正则表达式
		\分别表示单词的开始和结束
		ex: \ 以T或者t开头，om结尾的单词
		正则表达式的元字符集：
		1) ^行首 /^love/ 以love开头的行；
		2) $行尾 /love$/ 以love结尾的行；
		3) .    /l..e/ 匹配所有这样的行，字母l后面紧跟任意两个字符然后是e的行
		4) * 重复0次或者任意多次前面字符
		5) [x-y] 字符范围
		6) [^x-y] 排除字符范围
		7) \ 转义字符
		8) \ 界定单词的开头和结尾
		9) \( \) 标记后面用到的匹配字符 \(love\)able \1er=loveable lover
		10) x\{m,n\} 重复字符x至少m此，至多n次
		—————————————————————————
		—————————————————————————
	grep家族
		RE–regular expression; g: global; p: print
		出了上面10种元字符集，grep还支持下面的RE
		\w 字母或者数字
		\W 非单词字符（标点符号）
		+ 重复一个或者多个前面的字符
		｜ 或 love(a:b)表示lovea或者lobeb
		？单个字符
		grep返回状态值（$?） 0表示成功，1表示失败，2表示没有找到文件
		rgrep递归访问目录树
		—————————————————————————
		ls -l |grep ^d 显示目录
		grep -n -v -# -A# -B#
		-i 不区分大小写
		-n 显示匹配行和行号
		-v只显示不匹配行
		-#显示匹配行上下#行
		-A#匹配行后面打印#行
		-B#匹配行前面打印#行
		-c 只输出匹配行的行数
		-h 查询多文件的时候不显示匹配的文件名字
		-l 查询多文件只显示匹配的文件名
		-s 不显示错误信息
		grep与正则表达式同用
		grep “^[^abc]” *.f 提取行首不是abc的行
		grep “[0-9]\{3\}[8]” *.f 提取类似xxx8的行，x表示任意数字
		grep “a\{2\}” *.f 显示a至少出现两次的行，注意grep是以行处理单位的
		grep -n “^$” file 列出空行的行号
		-E参数，可以使用”与”和”或”模式
		grep -E “abc | def” *.f 显示包含abc或者def的行
		ex:
		ls -l | grep “^$” 显示目录
		ls -l | grep “^d” 显示文件
		ls -l | grep “^d..x..x..x” 显示特定权限的目录
		ps aux | grep “httpd” |grep -v “grep”
		—————————————————————————
	使用find和xargs
		1. find pathname -options [-print -exec -ok]
		-optinos
		1)-name:按照文件名查找
		find ~ -name “*.txt” -print
		find ~ -name “[a-z][0-9].txt” -print
		2)-perm:按照权限查找文件
		find ~ -perm 755 -print 查找权限为755的文件
		find ~ -perm 007 -print 查找o位置上具有7权限的文件
		find ~ -perm 4000 -print 查找具有suid的文件
		3)-prune
		不在当前目录下查找
		4)-user和－nouser
		find ~ -user zhao -print 查找文件属主是zhao的文件
		find ~ -nouser -print 查找文件属主已经被删除的文件
		5)-group和－nogroup
		find ~ -group zhao -print 查找文件群组是zhao的文件
		6)按照时间
		find ~ -mtime -5 -print 文件更改时间在5天内的文件
		find ~ -mtime +3 -print 文件更改时间在3天前的文件
		find ~ -newer file1 -print 查找比文件file1新的文件
		7)按照类型查找
		find ~ -type d -print 查找所有目录
		8)按照大小
		find ~ -size +1000000C -print 查找文件大小大于1000000字节(1M)的文件
		9)查找位于本文件系统里面的文件
		find / -name “*.txt” -mount -print
		-exec,-ok:find命令对于匹配文件执行该参数所给出shell命令，相应命令形式为: ‘command’ {} \;
		-ok 在执行命令前要确认
		find ~ -type f -exec ls -l {} \;
		find / -name “*.log” -mtime +5 -ok rm {} \;
		find . -name core -exec rm {} \;
		使用-x dev参数
		防止find搜索其他分区
		find . -size 0 -exec rm {} \;
		删除尺寸为０的文件
		2. xargs与-exec功能类似
		find ~ -type f | xargs ls -l
		find / -name “*.log” -type f -print| xargs grep -i DB0
		find . -type f |xargs grep -i “Mary”
		在所有文件中检索字符串Mary
		ls *~ |xargs rm -rf
		删除所有以~结尾的文件
		—————————————————————————
	SED:
		sed [options] sedcommand inputfile >outputfile
		sed不接触初始输入文件，对其不做修改，若想保存改动，重要将输出重定向到一个文件即可
		a\: 当前行后面加入一行或者文本
		c\: 用信文本替换本行的文本
		d: 删除一行
		D: 删除模板块的第一行
		i\: 在当前行上面插入文本
		h: 拷贝模板块的内容到内存缓冲区
		H: 追加模板块的内容到内存缓冲区
		g: 获得内存缓冲区内容，并替换当前模板中的文本
		G: 获得内存缓冲区内容，并追加到当前模版块文本的后面
		n: 读取下一个输入行，用下一个命令处理新行而不是第一个命令
		N: 追加下一个输入行到模版块后面，并在二者间插入一个新行，改变当前行的号码
		p: 打印模板块的行
		P: 打印模板块的地一行
		q: 退出sed
		r file: 从file中读行
		!: 表示后面的命令对所有没有选中的行起作用
		s/re/strint/: 用string替换正则表达式re
		=: 打印当前行号
		#command: 把注释扩展到下一个换行符号前
		l 打印匹配行，包括显示控制符号
		**替换标记
		g: 行内全部替换
		p: 打印行
		w: 把行写入一个文件
		x: 互换模板块和缓冲区中的文本
		y: 把一个字符翻译成另外一个字符
		**sed中元字符可以使用正则表达式中所有的
		新加：
		& 保存搜索字符 s/love/**&**/ 用**love**代替love
		**sed定位文本的方式
		x 行号
		x-y 从x行到y行
		/patern/ 查询包括patern的行
		x,y! 不包括指定x-y行号的行
		ex:
		sed ‘/Tom/d’ file
		删除包含Tom的行；
		sed ‘/Tom/!d’ file
		删除所有不包含Tom的行；
		sed -n /north/p’ file
		打印包含north的行；
		sed ‘3d’ file
		删除第三行；
		sed ’3,$d’ file
		删除第三行到最后一行；
		sed ‘$d’ file
		删除最后一行；
		sed ‘/north/d’ file
		删除包含north的行；
		sed -n ‘s/west/north/g’ file
		替换所有west为north；
		sed -n ‘s/^west/north/p’ file
		一行的开头的west用north替换，并打印发生替换的行；
		sed ‘s/[0-9][0-9]$/&.5/’ file
		所有以两个数字结尾的行，最后两个数字被他们自己替换并附加.5；
		sed -n ‘s/\(Mar\)got/\1ianne/p’ file
		将Margot替换为Marianne，并打印发生替换的行；
		sed ‘s#abc#ABC#g’ file
		所有abc由ABC替换，（所有s后面紧跟的字符都被认为是新的分隔符）；
		sed ‘/west/,/east/p’ file
		打印包含west行和包含east行中间的所有行；
		sed ’1,/east/s/$/**A**/’ file
		地一行和包含east行之间的所有行的行尾加上字符串**A**；
		sed -e ’1,3d’ -e ‘s/aa/bb/’ file
		先删除1到3行，然后用bb替换aa；
		sed ‘/Sam/r file1′ file
		将文件file1中的内容附加在包含Sam的行后面；
		sed ‘/Sam/w file1′ file
		将还有Sam行写入文件file1中；
		sed ‘/^north /a\new line second line’ file
		所有以north加空格开头的行后面附加上两行文本，a\表示追加文本，\表示换行(tcsh中需要，bash中不需要)；
		sed ‘/^north/i\new line’ file
		在行首为north的行前面插入一个新行；
		sed ‘/norht/{n; s/aa/bb/;}’ file
		首先匹配含有north的行，然后执行一组命令，n表示移到下一行，并用bb代替aa；
		sed ’1,3g/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/’ file
		将1到3行中的所有小写字母用大写字母替换；
		sed ‘/Lewis/{s/Lewis/bbb;q;}’ file
		首先找到匹配Lewis的行，然后用bbb代替Lewis，接着q退出seq；
		sed -e ‘/north/h’ -e ‘$G’ file
		首先找到包含norht的行，h拷贝到内存缓冲区，然后到文件随后一行($)，G附加在最后一行后面；
		sed -e ‘/we/{h;d;}’ -e ‘/ct/{G:}’ file
		查找包含we的行，拷贝并且删除他，然后查找包含ct的行，将拷贝内容附加到他后面；
		sed -e ‘/north/h’ -e ‘$g’ file
		首先找到包含norht的行，h拷贝到内存缓冲区，然后到文件随后一行并覆盖他；
		sed -n ‘l’ file
		打印所有包含不能打印字符的行。
		sed -n ‘/.*ing/p’ file
		显示含有以ing结尾单词的行；
		sed -n ‘/music/=’ file
		打印含有music的行号；
		sed ‘^$d’ file
		删除空行
		sed ‘s/^/abcd/g’ file
		在行首填加abcd
		sed ‘s/$/abcd/g’ file
		在行尾填加abcd
		sed ‘s/rm$/played &/g’ file
		&表示在替换的时候保留被替换的词(rm–played rm)
		sed ‘s/^M//g’ file
		去掉行尾的^M (^M的输入，先按ctrl+v然后按enter即可即可)
		—————————————————————————
	gawk程序：
		awk [-F 域分隔符] ‘commands’ inputfile
		awk执行时，其域标志符为$1,$2,$3………$n，$0表示所有的域
		awk -v var=value 赋值给一个用户定义的变量
		awk ‘pattern’ file
		awk ‘{action}’ file
		awk ‘pattern {action}’ file
		ex：
		awk ‘{print $0}’ file
		打印所有的域
		awk ‘/Mary/’ file
		打印包含file中包含Mary的行；
		awk ‘{print $1}’ file
		打印文件的第一列（第一个域）；
		awk ‘/Mary/ {print $1,$2}’ file
		打印文件file包含Mary的行的第一和第二个域；
		df | awk ‘S4>75000′
		打印可用空间大于75000的文件系统
		date | awk ‘{print ” month:”, $2, “\n year:” $6}’
		格式化date的输出；
		awk ‘BEGIN{OFMT=”%.2f”; print 1.25463}’
		指定数字输出格式，小数点后面保留两位有效数(1.25)；
		awk ‘/[ab]cdef/’ file
		打印匹配acdef或者bcdef的行；
		awk ‘{print NR, $0}’ file
		awk ‘{print $0, NR}’ file
		NR当前记录数，每处理一个记录NR就加1
		上面的命令相当于在每一行后面加上一个行号；
		NF则记录每一行的域的个数；
		awk -F ‘[ :\t]‘ ‘{print $0}’ file
		指定域分隔符为空格、:或者tab
		awk ‘/^[A-Z][a-z]+/’ file
		打印所有以一个大写字母开头，然后是一个或者多个小写字母的行；
		awk ‘$1~/[Bb]ill/’ file
		第一个域匹配Bill或者bill的行；
		awk ‘$1!~/ly$/’ file
		第一个域末尾不是ly的行；
		awk ‘/^(No|no)/’ file
		打印行首为No或者no的行；
		awk ‘BEGIN {print “file head \n”} {print $1 \t $4}’ file
		awk ‘BEGIN {print “file head \n”} {print $1 \t $4}’ file |tee out.file
		打印文件的时候附加一个文件头
		awk ‘BEGIN {print “file head \n”} {print $1 \t $4} END {print “end of file”}’ file
		打印文件的时候附加一个文件头和文件尾
		awk中使用正则表达式
		awk ‘{if($1~/hello/) print $0}’ file
		如果域1中包含hello，就打印所有的域
		~//表示匹配正则表达式，!~//表示不匹配正则表达式
		awk ‘{if($6,>=,==,!=,~,!~（匹配，不匹配）
		awk ‘$3==5346′ file
		第三个域等于5346，就打印出该行；
		awk ‘$3>5000 {print $1}’ file
		第三个域大于5000就打印该行第一个域
		awk ‘{max={$1>$2}?$1:$2; print max}’ file
		如果第一个域大于第二个域，max=$1否则=$2，打印最大值
		awk ‘{print ($1==11?”high\t” $2:”low\t” $2)}’ file
		&&逻辑和，||逻辑或，!逻辑非
		awk ‘$2==$5 && $3>5′ file
		awk ‘/Tom/,/Jary/’ file
		Tom第一次出现和Jary第一次出现之间的所有行；
		awk ‘/north/ {print $3+10}’ file
		包含north行的地三个域加10；
		awk ‘$3==”aa” {$2=”dd”; print $0}’ file
		将地三个域为aa的行的第二域变成dd，并打印该行；
		**awk编程：
		使用变量
		awk ‘$1~/Tom/ {wage=$2+$3; print wage}’ file
		先扫描第一个域，如果匹配Tom，就将第二和第三域的总和赋值给变量wage并输出；
		awk ‘BEGIN{FS=”:”; OFS=”\t”;ORS=”\n\n”}{print $0}’ file
		处理文件前设置
		域分隔符(FS)为(:)
		输出域分隔(OFS)为(\t)
		输出记录分隔符(ORS)为(\n\n)
		awk ‘END{print “The number of record is:’ NR}’ file
		处理完文件后执行END语句
		输出总记录数
		awk ‘/Mary/{count++} END{print “Mary was found” count “times”}’ file
		计数文件中Mary出现的次数；
		**awk输入输出重定向
		awk ‘$4>=70 {print $1, $2 >”outfile”}’ file
		结果重定向到文件outfile中
		awk ‘BEGIN{“date” |getline d; print d}’
		将date结果输给getline函数，并打印
		(getline从标准输出，管道等获得输入)
		awk ‘BEGIN{“date” |getline d; split(d,mon); print mon[1] mon[2]}’
		将date结果输给getline函数，slpit将d分解成数组，打印数组第2个变量
		**split函数：split(string,array,field seperator)
		awk ‘BEGIN{while(“ls”|getline) print}’
		依次输出ls的每一项
		awk
		‘BEGIN{print “what is your name?”; getline name 0) {lc++; print lc ” ” a}}’
		awk ‘BEGIN{while(getline a 0) {lc++; print lc}}’
		如果文件不存在，getline返回-1
		到达文件尾返回0
		读到一行返回1
		读取文件/etc/passwd，计数行数
	awk控制语句
		if语句：
		awk ‘{if($6>50) print $1 “too high”}’ file
		awk ‘{if($6>20 && $250}{x++; print x} else {y++;print y}’ file
		awk ‘{if($1~/peter/){next} else {print}}’ file
		如果第一个域包含peter，awk就忽略这一行，读取文件的下一行，脚本从头开始执行；
		循环语句：
		awk ‘{i=1; while(i file
		cat -v file 显示文件，包括其中的控制符(-v)
		cat -n file 为每一行编号
		cat -b file 每个非空行编号
		cat -T file 以^I显示tab

		管道 | 把一个命令的输出传递给另外一个命令为输入ex:
		ls | grep file.doc
		查找文件file.doc
		who | awk ‘{print $1 “\t” $2}’ 只显示用户名和所在终端
		df -h | awk ‘{print $1}’ |grep -v “filesystem” (-v表示输出不包括filesystem的项目)
		df -h | awk ‘{print $1}’ |grep -v “filesystem” |sed ‘s/\/dev\///g’ 显示设备的时候不显示/dev/
		
		tee:
		who | tee who.txt 输出到屏幕的同时输出到文件
		who | tee -a who.txt 附加在文件的后面
		
		文件重定向:
		ls -l |grep ^d >file.out 所有目录名字重定向到一个文件
		cat /etc/passwd | awk -F: ‘{print $1}’ |sort >a.out (-F:指定分隔符为:)
		cat >file.out reboot
		at> ctrl+D
		3小时后reboot
		
		bc – 计算器
		scale=3 设置小数点后数字为数
		ibase=2 二进制运算

		ls -d dir
		只显示目录而不显示其下面的文件。

		sync
		更新superblock并把它写入硬盘

=======================================================================
