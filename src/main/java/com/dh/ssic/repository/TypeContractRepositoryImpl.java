package com.dh.ssic.repository;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.Item;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContract;
import com.dh.ssic.repositories.EntityService;

import java.lang.reflect.ParameterizedType;
import java.util.*;

public class TypeContractRepositoryImpl implements TypeContractRepository {

    public TypeContractRepositoryImpl() {
    }

    @Override
    public TypeContract save(TypeContract entity) {
        return null;
    }

    @Override
    public <S extends TypeContract> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<TypeContract> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<TypeContract> findAll() {
        return null;
    }

    @Override
    public Iterable<TypeContract> findAllById(Iterable<Integer> integers) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Integer integer) {

    }

    @Override
    public void delete(TypeContract entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends TypeContract> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<TypeContract> GetTypesContract(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetTypeContracts", parameters, classParameter);
        List<TypeContract> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            TypeContract typeContract = new TypeContract();
            typeContract.setTypeContractKey((Integer) itemRes[0]);
            typeContract.setName((String) itemRes[1]);
            typeContract.setCode((String) itemRes[2]);
            typeContract.setStatus((String) itemRes[3]);
            result.add(typeContract);
        }
        return result;
    }
    @Override
    public TypeContract GetTypeContractById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("TypeContractKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("TypeContractKey", Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetTypeContractById", parameters, classParameter);
        TypeContract result = new TypeContract();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            TypeContract typeContract = new TypeContract();
            typeContract.setTypeContractKey((Integer) results.get(0)[0]);
            typeContract.setName((String) results.get(0)[1]);
            typeContract.setStatus((String) results.get(0)[2]);
            typeContract.setCode((String) results.get(0)[3]);
            return typeContract;
        }
        return null;
    }
}
