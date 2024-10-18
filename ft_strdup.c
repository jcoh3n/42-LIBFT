/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcohen <jcohen@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/17 20:21:05 by jcohen            #+#    #+#             */
/*   Updated: 2024/10/18 18:14:32 by jcohen           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *s)
{
	size_t	len;
	char	*duplicate;

	if (!s)
		return (NULL);
	len = ft_strlen(s);
	duplicate = (char *)malloc(sizeof(char) * (len + 1));
	if (!duplicate)
		return (NULL);
	ft_memcpy(duplicate, s, len + 1);
	return (duplicate);
}
