package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.*;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.EquipmentTypeRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
public class EquipmentTypeServiceImpl extends GenericServiceImplementation<EquipmentType> implements EquipmentTypeService {
    private EquipmentTypeRepository equipmentTypeRepository;

    public EquipmentTypeServiceImpl(EquipmentTypeRepository equipmentTypeRepository) {
        this.equipmentTypeRepository = equipmentTypeRepository;
    }

    public ReturnModel<List<EquipmentType>> GetAll( EntityService entityService) {
        ReturnModel<List<EquipmentType>> result = new ReturnModel<>();
        try {
            List<EquipmentType> results = new ArrayList<>();
            this.equipmentTypeRepository.getAllEquipmentType(entityService).forEach(results::add);
            if (results.isEmpty()) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " with is empty.");
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

    public ReturnModel<EquipmentType> FindEquipmentTypeById(int id, EntityService entityService) {
        ReturnModel<EquipmentType> result = new ReturnModel<>();
        try {
            EquipmentType results = new EquipmentType();
            results = this.equipmentTypeRepository.getEquipmentTypeById(id, entityService);
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
    protected CrudRepository<EquipmentType, Integer> getRepository() {
        return equipmentTypeRepository;
    }

    @Override
    public ReturnModel<ReturnSPModel> SaveEquipmentType(EquipmentType model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {

            ReturnSPModel saveResult = this.equipmentTypeRepository.saveEquipmentType(model, entityService);
            result.setObject(saveResult);
            result.setMessage(saveResult.getMessage());
            result.setCode(saveResult.getCode());
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    public ReturnModel<ReturnSPModel> DeleteEquipmentType(Integer EquipmentTypeKey, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentTypeRepository.deleteEquipmentType(EquipmentTypeKey, entityService);
            result.setObject(saveResult);
            result.setMessage(saveResult.getMessage());
            result.setCode(saveResult.getCode());
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
}


