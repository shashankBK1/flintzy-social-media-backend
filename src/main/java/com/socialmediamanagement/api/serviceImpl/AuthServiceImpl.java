package com.socialmediamanagement.api.serviceImpl;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import com.socialmediamanagement.api.dto.GoogleLoginRequest;
import com.socialmediamanagement.api.entity.User;
import com.socialmediamanagement.api.repository.UserRepository;
import com.socialmediamanagement.api.security.JwtUtil;
import com.socialmediamanagement.api.service.AuthService;
import com.socialmediamanagement.api.utility.AuthProvider;

@Service
public class AuthServiceImpl implements AuthService {

	private final UserRepository userRepository;
	private final JwtUtil jwtUtil;

	public AuthServiceImpl(UserRepository userRepository, JwtUtil jwtUtil) {
		super();
		this.userRepository = userRepository;
		this.jwtUtil = jwtUtil;
	}

	public String loginWithGoogle(GoogleLoginRequest loginRequest) {
		User user = userRepository.findByEmail(loginRequest.getEmail().trim().toLowerCase()).orElseGet(() -> {
			User newUser = new User();
			newUser.setEmail(loginRequest.getEmail());
			newUser.setName(loginRequest.getName());
			newUser.setProvider(AuthProvider.GOOGLE);
			newUser.setCreatedAt(LocalDateTime.now());
			return userRepository.save(newUser);
		});

		return jwtUtil.generateToken(user.getEmail());
	}
}
