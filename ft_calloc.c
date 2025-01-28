/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcohen <jcohen@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/19 17:46:35 by jcohen            #+#    #+#             */
/*   Updated: 2025/01/28 12:13:24 by jcohen           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_calloc(size_t num, size_t size)
{
	void	*bloc;
	size_t	total_size;

	if (size > 0 && num > SIZE_MAX / size)
		return (NULL);
	total_size = num * size;
	bloc = malloc(total_size);
	if (!bloc)
		return (NULL);
	ft_bzero(bloc, total_size);
	return (bloc);
}
