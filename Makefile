DASH_OBJS=dash/src/histedit.o dash/src/init.o dash/src/output.o dash/src/options.o dash/src/error.o dash/src/mail.o dash/src/miscbltin.o dash/src/parser.o dash/src/alias.o dash/src/cd.o dash/src/builtins.o dash/src/bltin/test.o dash/src/bltin/times.o dash/src/bltin/printf.o dash/src/expand.o dash/src/system.o dash/src/syntax.o dash/src/input.o dash/src/memalloc.o dash/src/signames.o dash/src/trap.o dash/src/jobs.o dash/src/var.o dash/src/exec.o dash/src/arith_yylex.o dash/src/nodes.o dash/src/arith_yacc.o dash/src/show.o dash/src/eval.o dash/src/mystring.o dash/src/redir.o

doDash: main.o dashlib.a
	gcc main.o dashlib.a -o $@

dashlib.a: dash/Makefile
	make -C dash -f Makefile
	ar r dashlib.a ${DASH_OBJS}

main.o: main.c 
	gcc -g -c $< -o $@

dash/Makefile: dash/configure
	cd dash; ./configure

dash/configure: dash/autogen.sh
	cd dash; sh ./autogen.sh

dash/autogen.sh:
	git clone https://git.kernel.org/pub/scm/utils/dash/dash.git

clean:
	-rm main.o dashlib.a

