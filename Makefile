##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile
##

NAME	=	libasm.so

FILES	=	memcpy.asm		\
			memmove.asm		\
			memset.asm		\
			strcmp.asm		\
			strchr.asm		\
			strlen.asm

SRC		= 	$(addprefix src/, $(FILES))

OBJ	=	$(SRC:.asm=.o)

%.o: %.asm
	nasm -o $@ $< -f elf64

all:	$(NAME)

$(NAME):	$(OBJ)
	ld -o $(NAME) $(OBJ) -shared

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all fclean clean re $(NAME)