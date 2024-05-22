/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcohen <jcohen@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/19 17:46:35 by jcohen            #+#    #+#             */
/*   Updated: 2024/05/22 12:20:25 by jcohen           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_calloc(size_t num, size_t size)
{
	void	*bloc;
	size_t	i;

	i = 0;
	bloc = malloc(num * size);
	if (!bloc)
		return (NULL);
	while (((char *)bloc)[i])
	{
		((char *)bloc)[i] = 0;
		i++;
	}
	return (bloc);
}
