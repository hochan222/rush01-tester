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
LIGHT_SUCCESS_COLOR="\033[32m\033[01m"
FAIL_COLOR="\033[91m"
# Background color
SUCCESS_BG="\033[42;1;37m"
FAIL_BG="\033[41;5;11m"
CLEAR_COLOR="\033[0m"

# RUSH_GENERAL_TESTCASE is exception handling from number 11.
RUSH_GENERAL_TESTCASE=65
RUSH_ARGUMENT_TESTCASE=7
BLANK_EXCEPTION_HANDLING=25
FORMAT_EXCEPTION_HANDLING=25
N_X_N_EXCEPTION_HANDLING=5
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

	if [ ${SUCCESS} -eq $((${RUSH_GENERAL_TESTCASE} + ${RUSH_ARGUMENT_TESTCASE} + ${BLANK_EXCEPTION_HANDLING} + ${FORMAT_EXCEPTION_HANDLING} + ${N_X_N_EXCEPTION_HANDLING} + 5)) ]
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

function sectionPrompt {
	echo "\n${LIGHT_SUCCESS_COLOR}================================="
	echo "${LIGHT_BLUE_COLOR}$1"
	echo "${LIGHT_SUCCESS_COLOR}=================================${CLEAR_COLOR}\n"
}

function argumentEvaluation {
	local input

	sectionPrompt "ARGUMENT EVALUATION"

	# Temporarily First Intermittent Error Handling
	./rush01 "a" > ./output/argument/0
	
	for i in `seq 0 ${RUSH_ARGUMENT_TESTCASE}`
	do
		input=$(<input/argument/${i})
		(./rush01 '$input' > ./output/argument/${i})  & sleep 0.3; kill $! 2> /dev/null || :
		diff -u ./output/argument/${i} ./maps/error >> result
		isSuccess "File: ${i}, Input \"$input\""
	done
}

function evaluation {
	local input
	mkdir -p output
	mkdir -p output/blank
	mkdir -p output/format
	mkdir -p output/argument
	mkdir -p output/n_x_n

	argumentEvaluation
	sectionPrompt "GENERAL TESTCASES"

	for i in `seq 0 10`
	do
		input=$(<input/${i})
		./rush01 "$input" > ./output/${i}
		diff -u ./output/${i} ./maps/${i} >> result
		isSuccess "File: ${i}, Input \"${input}\""
	done

	sectionPrompt "BLANK EXCEPTION HANDLING"

	for i in `seq 0 ${BLANK_EXCEPTION_HANDLING}`
	do
		input=$(<input/blank/${i})
		(./rush01 "$input" > ./output/blank/${i})  & sleep 0.2; kill $! 2> /dev/null || :
		diff -u ./output/blank/${i} ./maps/blank/${i} >> result
		isSuccess "File: ${i}, Input \"$input\""
	done

	sectionPrompt "FORMAT EXCEPTION HANDLING"

	for i in `seq 0 ${FORMAT_EXCEPTION_HANDLING}`
	do
		input=$(<input/format/${i})
		(./rush01 "$input" > ./output/format/${i})  & sleep 0.2; kill $! 2> /dev/null || :
		diff -u ./output/format/${i} ./maps/format/${i} >> result
		isSuccess "File: ${i}, Input \"$input\""
	done

	sectionPrompt "NxN EXCEPTION HANDLING"

	for i in `seq 0 ${N_X_N_EXCEPTION_HANDLING}`
	do
		input=$(<input/n_x_n/${i})
		(./rush01 "$input" > ./output/n_x_n/${i})  & sleep 0.2; kill $! 2> /dev/null || :
		diff -u ./output/n_x_n/${i} ./maps/n_x_n/${i} >> result
		isSuccess "File: ${i}, Input \"$input\""
	done
}

getRush01
rm -rf result
prompt
fortytwoPrompt
evaluation
resultPrompt