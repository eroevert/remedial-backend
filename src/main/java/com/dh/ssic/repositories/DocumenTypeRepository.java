package com.dh.ssic.repositories;

import com.dh.ssic.model.DocumentType;
import org.springframework.data.repository.CrudRepository;

public interface DocumenTypeRepository extends CrudRepository<DocumentType, Integer> {
    public DocumentType findByName(String name);
}
