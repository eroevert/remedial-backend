package com.dh.ssic.repositories;

import com.dh.ssic.model.Institution;
import org.springframework.data.repository.CrudRepository;

public interface InstitutionRepository extends CrudRepository<Institution, Integer> {
}