package com.socialmediamanagement.api.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.socialmediamanagement.api.dto.FacebookLinkRequest;
import com.socialmediamanagement.api.dto.FacebookPageResponse;
import com.socialmediamanagement.api.entity.FacebookPage;
import com.socialmediamanagement.api.entity.User;
import com.socialmediamanagement.api.security.CustomUserDetails;
import com.socialmediamanagement.api.service.FacebookService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/facebook")
public class FacebookController {

	private final FacebookService facebookService;

	public FacebookController(FacebookService facebookService) {
		this.facebookService = facebookService;
	}

	@PostMapping("/link")
	public ResponseEntity<?> linkPages( @Valid @RequestBody FacebookLinkRequest linkRequest,Authentication authentication) {

		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		User user = userDetails.getUser();
		
		List<FacebookPage> pages = facebookService.linkFacebookPages(user, linkRequest.getUserAccessToken());
		
		List<FacebookPageResponse> responsePages = pages.stream().map(p -> new FacebookPageResponse(p.getPageId(), p.getPageName())).toList();

		return ResponseEntity.ok(responsePages);
	}
}

