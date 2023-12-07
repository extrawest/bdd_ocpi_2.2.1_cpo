package com.extrawest.bdd_cpo_ocpi.repository.impl;

import com.extrawest.bdd_cpo_ocpi.repository.CredentialsRepository;
import com.extrawest.ocpi.model.dto.CredentialsDto;
import org.springframework.stereotype.Component;

@Component
public class CredentialsRepositoryImpl implements CredentialsRepository {
    private CredentialsDto cpoCredentials;

    public CredentialsDto getCpoCredentials() {
        return this.cpoCredentials;
    }

    public void setCpoCredentials(CredentialsDto cpoCredentials) {
        this.cpoCredentials = cpoCredentials;
    }
}
