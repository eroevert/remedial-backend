package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.EquipmentRepository;
import com.dh.ssic.repository.EquipmentRepositoryImpl;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;


@Service
public class EquipmentServiceImpl extends GenericServiceImplementation<Equipment> implements EquipmentService {
    private EquipmentRepositoryImpl equipmentRepository;

    public EquipmentServiceImpl(EquipmentRepositoryImpl EquipmentRepository) {
        this.equipmentRepository = EquipmentRepository;
    }

    @Override
    protected CrudRepository<Equipment, Integer> getRepository() {
        return equipmentRepository;
    }

    @Override
    public List<Equipment> getAllEquipment(EntityService entityService) {
        return equipmentRepository.getAllEquipment(entityService);
    }

    @Override
    public ReturnModel<Equipment> getEquipmentById(Integer id, EntityService entityService) {
        ReturnModel<Equipment> result = new ReturnModel<>();
        try {
            Equipment results = new Equipment();
            results = this.equipmentRepository.getEquipmentById(id, entityService);
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
    public ReturnModel<ReturnSPModel> saveEquipment(Equipment equipment, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentRepository.saveEquipment(equipment, entityService);
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
    public ReturnModel<ReturnSPModel> updateEquipment(Equipment equipment, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentRepository.updateEquipment(equipment, entityService);
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
    public ReturnModel<ReturnSPModel> deleteEquipment(Integer id, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentRepository.deleteEquipment(id, entityService);
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


