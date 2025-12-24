package com.socialmediamanagement.api.utility;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CustomErrorResponse {

	private String message;
	private int status;
	private LocalDateTime timestamp;
}
