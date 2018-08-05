package com.dh.ssic.repository;

import com.dh.ssic.model.TypeContract;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TypeContractRepository extends CrudRepository<TypeContract, Integer> {
    public List<TypeContract> GetTypesContract(EntityService entityService);
    TypeContract GetTypeContractById(Integer id, EntityService entityService);
}
