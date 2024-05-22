/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcohen <jcohen@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/22 15:22:24 by jcohen            #+#    #+#             */
/*   Updated: 2024/05/22 16:25:24 by jcohen           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	calculate_length(int n)
{
	int	length;

	length = 0;
	if (n < 0)
	{
		length++;
		n = -n;
	}
	if (n == 0)
		return (1);
	while (n > 0)
	{
		length++;
		n /= 10;
	}
	return (length);
}

char	*ft_itoa(int n)
{
	int		len_n;
	int		i;
	int		sign;
	long	num;
	char	*itoa;

	len_n = calculate_length(n);
	itoa = (char *)malloc(len_n + 1);
	num = n;
	if (!itoa)
		return (NULL);
	sign = 1;
	if (num < 0)
	{
		sign = -1;
		itoa[0] = '-';
		num = -num;
	}
	i = 0;
	while (num > 0)
	{
		itoa[i++] = (num % 10) + '0';
		num /= 10;
	}
	itoa[i] = '\0';
	return (itoa);
}
