
WARNING = -Wall -Wshadow --pedantic
ERROR = -Wvla -Werror
GCC = gcc -std=c99 -g $(WARNING) $(ERROR) 

TESTFALGS = -DTEST_BUILDTREE_OFF -DTEST_POSTFIX_OFF -DTEST_EXPRESSIONTREE_H

VALGRIND = valgrind --tool=memcheck --verbose --log-file=memcheck.txt --leak-check=full

SRCS = hw14.c 
OBJS = $(SRCS:%.c=%.o)



pa15: $(OBJS)
	$(GCC) $(TESTFALGS) $(OBJS) -o pa15

.c.o:
	$(GCC) $(TESTFALGS) -c $*.c

all: test1 test2 test3 test4 test5

test1: pa15
	./pa15 inputs/basic basic_sorted basic_huffman basic_header

test2: pa15
	./pa15 inputs/gophers gophers_sorted gophers_huffman gophers_header

test3: pa15
	./pa15 inputs/para para_sorted para_huffman para_header

test4: pa15
	./pa15 inputs/prideandprejudice prideandprejudice_sorted prideandprejudice_huffman prideandprejudice_header
	
test5: pa15
	./pa15 inputs/woods woods_sorted woods_huffman woods_header

clean: # remove all machine generated files
	rm -f hw14 *.o output?


