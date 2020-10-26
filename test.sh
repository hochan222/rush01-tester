# Color
RED_COLOR="\033[31m"
LIGHT_RED_COLOR="\033[31m\033[01m"
GREEN_COLOR="\033[32m"
LIGHT_GREEN_COLOR="\033[32m\033[01m"
YELLOW_COLOR="\033[33m"
BLUE_COLOR="\033[34m"
LIGHT_BLUE_COLOR="\033[34m\033[01m"
LIGHT_SKYBLUE_COLOR="\033[36m\033[01m"

BRACKET_COLOR="\033[90m"
SUCCESS_COLOR="\033[32m"
FAIL_COLOR="\033[91m"
# Background color
SUCCESS_BG="\033[42;1;37m"
FAIL_BG="\033[41;5;11m"
CLEAR_COLOR="\033[0m"

# It is exception handling from number 11.
RUSH_GENERAL_TESTCASE=50
SUCCESS=0
FAIL=0

function getRush01 {
	if test -f "./rush01"
	then
		return 0
	else
		if test -f "../rush01"
		then
			rm -rf rush01
			cd ..
			cp rush01 ./rush01-tester/
			cd ./rush01-tester
			return 0
		else
			echo "${FAIL_BG}No rush file${CLEAR_COLOR}${LIGHT_RED_COLOR} rush01"
			echo "Compile the executable file name as rush01.${CLEAR_COLOR}"
			exit;
		fi
	fi
}

function prompt {
	clear
	echo "${LIGHT_RED_COLOR}Any invalid behavior in your program is treated as a test failure." 
	echo "${LIGHT_SKYBLUE_COLOR}For additional test cases or other inquiries, please contact at the address below. :)\n\n"
	echo "     Github: hochan222."
	echo "     Email : hochan049@gmail.co${CLEAR_COLOR}\n"
	echo "\n\n${LIGHT_GREEN_COLOR}PRESS ENTER : ${CLEAR_COLOR}"
	read
	clear
}

function isSuccess {
	if [ $? -eq 0 ]
	then
		echo "$1 ${SUCCESS_BG}SUCCESS${CLEAR_COLOR}"
		SUCCESS=$(($SUCCESS+1))
	else
		echo ">> $1 " >> result
		echo "$1 ${FAIL_BG}FAIL${CLEAR_COLOR}"
		FAIL=$(($FAIL+1))
	fi
}

function fortytwoPrompt {
	echo "${YELLOW_COLOR}
	               .......   .....'......
	             .kMMMMNc   cMMMNl.MMMMMM'
	           'OMMMMX:     cMXc  .MMMMMM'
	         ,0MMMMK;       ::    .MMMMMM'
	       ;KMMMMK;              lNMMMMO.
	     :XMMMM0,              oWMMMMk.
	   cXMMMMK:..........    oWMMMMd.
	  .MMMMMMMMMMMMMMMMMMK  cMMMMMX    'O'
	  .MMMMMMMMMMMMMMMMMMK  cMMMMMX  ,0MM'
	   ;;;;;;;:;;;;kMMMMMK  cWWWWWK,0WWWN'
	               lMMMMMK
	               lMMMMMK
	               .:::::,
${CLEAR_COLOR}"
}

function resultPrompt {
	echo ""
	echo "${BRACKET_COLOR}[${SUCCESS_COLOR}SUCCESS: ${SUCCESS} ${BRACKET_COLOR}/${FAIL_COLOR} FAIL: ${FAIL}${BRACKET_COLOR}]${CLEAR_COLOR}"

	if [ ${SUCCESS} -eq $((${RUSH_GENERAL_TESTCASE}+1)) ]
	then
		echo "${SUCCESS_COLOR}
    ____  __  _______ __  ______ ___   _____ __  ______________________________
   / __ \\/ / / / ___// / / / __ <  /  / ___// / / / ____/ ____/ ____/ ___/ ___/
  / /_/ / / / /\\__ \\/ /_/ / / / / /   \\__ \\/ / / / /   / /   / __/  \\__ \\\\__  \\
 / _, _/ /_/ /___/ / __  / /_/ / /   ___/ / /_/ / /___/ /___/ /___ ___/ /__/ /
/_/ |_|\\____//____/_/ /_/\\____/_/   /____/\\____/\\____/\\____/_____//____/____/
${CLEAR_COLOR}"
		echo ""
	fi
}

function evaluation {
	local input
	mkdir -p output

	for i in `seq 0 10`
	do
		input=$(<input/${i})
		./rush01 "$input" > ./output/${i}
		diff -u ./output/${i} ./maps/${i} >> result
		isSuccess "Input ${input}, File: ${i}"
	done
	echo "exception handling"
	for i in `seq 11 ${RUSH_GENERAL_TESTCASE}`
	do
		input=$(<input/${i})
		command "./rush01 '$input' > ./output/${i}"
		timeout 3.5s "$command"
		diff -u ./output/${i} ./maps/error >> result
		isSuccess "Input $input, File: ${i}"
		# echo $?
		# if [ $? = 0 ]
		# then
		# 	diff -u ./output/${i} ./maps/error >> result
		# 	isSuccess "Input $input, File: ${i}"
		# else
		# 	isSuccess "Input $input, File: ${i}"
    	# fi
	done
}

getRush01
rm -rf result
prompt
fortytwoPrompt
evaluation
resultPrompt