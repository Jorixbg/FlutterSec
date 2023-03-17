package com.mentorship.userservice;

import com.mentorship.userservice.entities.Role;
import com.mentorship.userservice.entities.User;
import com.mentorship.userservice.services.UserService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.ArrayList;

@SpringBootApplication
public class UserServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(UserServiceApplication.class, args);
	}

	@Bean
	CommandLineRunner run(UserService userService) {
		return args -> {
			// @Demo populate DB for demo purposes
			populateUsers(userService);
		};
	}

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		// @Demo password encoder implementation. Can be moved to a config class
		return new BCryptPasswordEncoder();
	}

	public void populateUsers(UserService userService) {
		userService.saveRole(new Role(null, "ROLE_USER"));
		userService.saveRole(new Role(null, "ROLE_ADMIN"));

		userService.saveUser(new User(null, "Flutter User", "user", "1234", new ArrayList<>()));
		userService.saveUser(new User(null, "Flutter Admin", "admin", "1234", new ArrayList<>()));

		userService.addRoleToUser("user", "ROLE_USER");
		userService.addRoleToUser("admin", "ROLE_ADMIN");
	}
}
