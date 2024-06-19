# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcohen <jcohen@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/21 12:08:36 by jcohen            #+#    #+#              #
#    Updated: 2024/06/19 12:40:16 by jcohen           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a

SRC = ft_strlen.c ft_toupper.c ft_tolower.c ft_strrchr.c ft_strnstr.c ft_strncmp.c \
	  ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_memset.c ft_memmove.c ft_memcpy.c \
	  ft_memcmp.c ft_memchr.c ft_isprint.c ft_isdigit.c ft_isascii.c ft_isalpha.c \
	  ft_isalnum.c ft_bzero.c ft_atoi.c ft_calloc.c ft_strdup.c ft_strjoin.c \
	  ft_substr.c ft_itoa.c ft_split.c ft_strtrim.c ft_strmapi.c ft_striteri.c \
	  ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

SRC_PRINTF = printf/additional_conversions.c printf/conversion_logic.c \
			 printf/basic_conversions.c printf/ft_printf.c \
			 printf/hexadecimal_operations.c printf/numeric_operations.c \
			 printf/output_operations.c

SRC_GNL = gnl/get_next_line.c gnl/get_next_line_utils.c

BONUS = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
		ft_lstlast_bonus.c ft_lstadd_back_bonus.c \
		ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c \
		ft_lstmap_bonus.c

OBJS_DIR = objs
OBJS = $(SRC:%.c=$(OBJS_DIR)/%.o)
PRINTF_OBJS = $(SRC_PRINTF:%.c=$(OBJS_DIR)/%.o)
GNL_OBJS = $(SRC_GNL:%.c=$(OBJS_DIR)/%.o)
BONUS_OBJS = $(BONUS:%.c=$(OBJS_DIR)/%.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror

RM = rm -f

all: $(NAME)

$(OBJS_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $< -o $@

$(NAME): $(OBJS) $(PRINTF_OBJS) $(GNL_OBJS)
	ar rcs $(NAME) $(OBJS) $(PRINTF_OBJS) $(GNL_OBJS)

bonus: $(OBJS) $(PRINTF_OBJS) $(GNL_OBJS) $(BONUS_OBJS)
	ar rcs $(NAME) $(OBJS) $(PRINTF_OBJS) $(GNL_OBJS) $(BONUS_OBJS)

clean:
	$(RM) -r $(OBJS_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus