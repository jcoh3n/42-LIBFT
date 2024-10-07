# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcohen <jcohen@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/21 12:08:36 by jcohen            #+#    #+#              #
#    Updated: 2024/10/07 12:41:15 by jcohen           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
RESET = \033[0m

NAME := libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror

SRCS = ft_strlen.c ft_toupper.c ft_tolower.c ft_strrchr.c ft_strnstr.c ft_strncmp.c \
       ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_memset.c ft_memmove.c ft_memcpy.c \
       ft_memcmp.c ft_memchr.c ft_isprint.c ft_isdigit.c ft_isascii.c ft_isalpha.c \
       ft_isalnum.c ft_bzero.c ft_atoi.c ft_calloc.c ft_strdup.c ft_strjoin.c \
       ft_substr.c ft_itoa.c ft_split.c ft_strtrim.c ft_strmapi.c ft_striteri.c \
       ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_atol.c \
       additional_conversions.c basic_conversions.c conversion_logic.c \
       ft_printf.c hexadecimal_operations.c numeric_operations.c \
       output_operations.c ft_isspace.c ft_strcmp.c \
       get_next_line.c get_next_line_utils.c

BONUS_SRCS = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
             ft_lstlast_bonus.c ft_lstadd_back_bonus.c \
             ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c \
             ft_lstmap_bonus.c

OBJS_DIR = objs
OBJS = $(SRCS:%.c=$(OBJS_DIR)/%.o)
BONUS_OBJS = $(BONUS_SRCS:%.c=$(OBJS_DIR)/%.o)

DEPS = $(OBJS:.o=.d)
BONUS_DEPS = $(BONUS_OBJS:.o=.d)

all: $(NAME)

$(NAME): $(OBJS)
	@echo -n "$(YELLOW)Creating library archive...$(RESET)"
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)Done!$(RESET)"

bonus: $(OBJS) $(BONUS_OBJS)
	@echo -n "$(YELLOW)Creating library archive with bonus...$(RESET)"
	@ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
	@echo "$(GREEN)Done!$(RESET)"

$(OBJS_DIR)/%.o: %.c
	@mkdir -p $(OBJS_DIR)
	@echo -n "$(YELLOW)Compiling $<...$(RESET)"
	@$(CC) $(CFLAGS) -MMD -MP -c $< -o $@
	@echo "$(GREEN)Done!$(RESET)"

clean:
	@echo -n "$(YELLOW)Cleaning up object files...$(RESET)"
	@rm -rf $(OBJS_DIR)
	@echo "$(GREEN)Done!$(RESET)"

fclean: clean
	@echo -n "$(YELLOW)Removing library archive...$(RESET)"
	@rm -f $(NAME)
	@echo "$(GREEN)Done!$(RESET)"

re: fclean all

-include $(DEPS)
-include $(BONUS_DEPS)

.PHONY: all bonus clean fclean re
.SILENT: all bonus $(OBJS) $(BONUS_OBJS) clean fclean re
