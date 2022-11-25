package com.mentorship.eurkeadiscovery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EurkeaDiscoveryApplication {

	public static void main(String[] args) {
		SpringApplication.run(EurkeaDiscoveryApplication.class, args);
	}

}
