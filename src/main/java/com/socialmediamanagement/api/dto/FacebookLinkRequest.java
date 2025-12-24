package com.socialmediamanagement.api.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FacebookLinkRequest {
    
	@NotBlank(message = "Facebook access token is required")
	private String userAccessToken;
}

