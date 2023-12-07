package com.extrawest.bdd_cpo_ocpi.repository;

import com.extrawest.ocpi.model.dto.CredentialsDto;

public interface CredentialsRepository {
    CredentialsDto getCpoCredentials();

    void setCpoCredentials(CredentialsDto cpoCredentials);
}
