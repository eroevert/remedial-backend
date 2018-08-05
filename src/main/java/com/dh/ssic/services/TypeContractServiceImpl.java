package com.dh.ssic.services;
import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContract;

import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.TypeContractRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Service
public class TypeContractServiceImpl extends GenericServiceImplementation<TypeContract> implements TypeContractService {
    private TypeContractRepository typeContractRepository;

    public TypeContractServiceImpl(TypeContractRepository typeContractRepository) {
        this.typeContractRepository = typeContractRepository;
    }
    @Override
    public ReturnModel<List<TypeContract>> GetTypesContract(EntityService entityService) {
        ReturnModel<List<TypeContract>> result = new ReturnModel<>();
        try {
            List<TypeContract> results =typeContractRepository.GetTypesContract(entityService);
            if (results == null || results.size()== 0) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " is empty.");
                result.setCode(0);
            } else {
                result.setObject(results);
                result.setCode(1);
            }
        } catch (NotFoundException NFoundException) {
            result.setMessage(NFoundException.getMessage());
            result.setCode(0);
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    public ReturnModel<TypeContract> GetTypeContractById(int id, EntityService entityService) {
        ReturnModel<TypeContract> result = new ReturnModel<>();
        try {
            TypeContract results = new TypeContract();
            results = this.typeContractRepository.GetTypeContractById(id, entityService);
            if (results == null) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " with id " + id + " do not exist.");
                result.setCode(0);
            } else {
                result.setObject(results);
                result.setCode(1);
            }
        } catch (NotFoundException NFoundException) {
            result.setMessage(NFoundException.getMessage());
            result.setCode(0);
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    protected CrudRepository<TypeContract, Integer> getRepository() {
        return typeContractRepository;
    }

}
