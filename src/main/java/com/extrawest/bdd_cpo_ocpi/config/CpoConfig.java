package com.extrawest.bdd_cpo_ocpi.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Getter
@Setter
@Configuration
public class CpoConfig {
    @Value("${cpo.token.a}")
    private String tokenA;
    @Value("${cpo.version.url}")
    private String versionUrl;
}