package com.dh.ssic.repositories;

import com.dh.ssic.model.ContactInformation;
import org.springframework.data.repository.CrudRepository;

public interface ContactInformationRepository extends CrudRepository<ContactInformation, Integer> {
}