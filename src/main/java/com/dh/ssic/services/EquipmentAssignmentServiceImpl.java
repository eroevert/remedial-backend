package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.EquipmentAssignment;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.EquipmentAssignmentRepository;
import com.dh.ssic.repository.EquipmentRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;


@Service
public class EquipmentAssignmentServiceImpl extends GenericServiceImplementation<EquipmentAssignment>
        implements EquipmentAssignmentService {
    private EquipmentAssignmentRepository equipmentAssignmentRepository;
    private EquipmentRepository equipmentRepository;

    public EquipmentAssignmentServiceImpl(EquipmentAssignmentRepository equipmentAssignmentRepository,
                                          EquipmentRepository equipmentRepository) {
        this.equipmentAssignmentRepository = equipmentAssignmentRepository;
        this.equipmentRepository = equipmentRepository;
    }

    @Override
    protected CrudRepository<EquipmentAssignment, Integer> getRepository() {
        return equipmentAssignmentRepository;
    }

    @Override
    public List<EquipmentAssignment> findByEmployeeKey(int employeeKey) {
        return equipmentAssignmentRepository.findByEmployeeKey(employeeKey).get();
    }

    @Override
    public List<EquipmentAssignment> findByEmployeeKey(int employeeKey, EntityService entityService) {
        List<EquipmentAssignment> result=equipmentAssignmentRepository.findEmployeeKey(employeeKey, entityService);
        for(EquipmentAssignment res: result) {
            res.setEquipmentByEquipmentKey(this.equipmentRepository.getEquipmentById(res.getEquipmentKey(),entityService));
        }
        return result;
    }

    @Override
    public List<EquipmentAssignment> getAllEquipmentAssignment(EntityService entityService) {
        List<EquipmentAssignment> result=equipmentAssignmentRepository.getAllEquipmentAssignment(entityService);
        for(EquipmentAssignment res: result) {
            res.setEquipmentByEquipmentKey(this.equipmentRepository.getEquipmentById(res.getEquipmentKey(),entityService));
        }
        return result;
    }

    @Override
    public ReturnModel<EquipmentAssignment> getEquipmentAssignmentById(Integer id, EntityService entityService) {
        ReturnModel<EquipmentAssignment> result = new ReturnModel<>();
        try {
            EquipmentAssignment results = new EquipmentAssignment();
            results = this.equipmentAssignmentRepository.getEquipmentAssignmentById(id, entityService);
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
    public ReturnModel<ReturnSPModel> saveEquipmentAssingment(EquipmentAssignment equipmentAssignment, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentAssignmentRepository.saveEquipmentAssignment(equipmentAssignment, entityService);
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
    public ReturnModel<ReturnSPModel> updateEquipmentAssignment(EquipmentAssignment equipmentAssignment, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentAssignmentRepository.updateEquipmentAssignment(equipmentAssignment, entityService);
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
    public ReturnModel<ReturnSPModel> deleteEquipmentAssignment(Integer id, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.equipmentAssignmentRepository.deleteEquipmentAssignment(id, entityService);
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
