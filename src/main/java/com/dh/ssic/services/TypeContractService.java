package com.dh.ssic.services;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContract;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface TypeContractService extends GenericService<TypeContract> {
    public ReturnModel<List<TypeContract>> GetTypesContract(EntityService entityService);
    public ReturnModel<TypeContract> GetTypeContractById(int id, EntityService entityService);
}
