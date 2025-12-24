package com.socialmediamanagement.api.service;

import com.socialmediamanagement.api.dto.GoogleLoginRequest;

public interface AuthService {

	public String loginWithGoogle(GoogleLoginRequest loginRequest);
}
