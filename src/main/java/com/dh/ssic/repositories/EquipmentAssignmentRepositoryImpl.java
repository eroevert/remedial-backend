package com.dh.ssic.repositories;

import com.dh.ssic.model.EquipmentAssignment;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repository.EquipmentRepository;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.*;

public class EquipmentAssignmentRepositoryImpl implements EquipmentAssignmentRepository  {
    EmployeeRepository employeeRepository;

    public EquipmentAssignmentRepositoryImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    public Optional<List<EquipmentAssignment>> findByEmployeeKey(int employeeKey) {
        return Optional.empty();
    }

    @Override
    public List<EquipmentAssignment> findEmployeeKey(int employeeKey, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EmployeeKey", employeeKey);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EmployeeKey", Integer.class);
        List<Object[]> result = entityService.executeProcedure("getEquipmentAssignmentByEmployee", parameters, classParameter);
        List<EquipmentAssignment> equipmentList = new ArrayList<>();
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                EquipmentAssignment equipmentAssignment = new EquipmentAssignment();
                equipmentAssignment.setEquipmentAssignmentKey((int)res[0]);
                equipmentAssignment.setEquipmentKey((int) res[1]);
                equipmentAssignment.setUserKey((int) res[2]);
                equipmentAssignment.setEmployeeKey((int) res[3]);
                equipmentAssignment.setDate((Date) res[4]);
                equipmentAssignment.setDateRegistration((Timestamp) res[5]);
                equipmentAssignment.setStatus((String) res[6]);
                equipmentAssignment.setObservations((String) res[7]);
                equipmentAssignment.setEmployeeByEmployeeKey(this.employeeRepository.getEmployeeById((int) res[3], entityService));
                //equipmentAssignment.setEquipmentByEquipmentKey(this.equipmentrepository.getEquipmentById((int) res[1], entityService));
                equipmentList.add(equipmentAssignment);
            }
        }
        return equipmentList;
    }

    @Override
    public List<EquipmentAssignment> getAllEquipmentAssignment(EntityService entityService) {
        List<Object[]> result = entityService.executeProcedure("getAllEquipmentAssignment", new HashMap<>(), new HashMap<>());
        List<EquipmentAssignment> equipmentList = new ArrayList<>();
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                EquipmentAssignment equipmentAssignment = new EquipmentAssignment();
                equipmentAssignment.setEquipmentAssignmentKey((int)res[0]);
                equipmentAssignment.setEquipmentKey((int) res[1]);
                equipmentAssignment.setUserKey((int) res[2]);
                equipmentAssignment.setEmployeeKey((int) res[3]);
                equipmentAssignment.setDate((Date) res[4]);
                equipmentAssignment.setDateRegistration((Timestamp) res[5]);
                equipmentAssignment.setStatus((String) res[6]);
                equipmentAssignment.setObservations((String) res[7]);
                equipmentAssignment.setEmployeeByEmployeeKey(this.employeeRepository.getEmployeeById((int) res[3], entityService));
                //equipmentAssignment.setEquipmentByEquipmentKey(this.equipmentrepository.getEquipmentById((int) res[1], entityService));
                equipmentList.add(equipmentAssignment);
            }
        }
        return equipmentList;
    }

    @Override
    public EquipmentAssignment getEquipmentAssignmentById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentAssignmentKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentAssignmentKey", Integer.class);
        EquipmentAssignment equipmentAssignment = null;
        List<Object[]> result = entityService.executeProcedure("GetEquipmentAssignment", parameters, classParameter);
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                equipmentAssignment.setEquipmentAssignmentKey((int)res[0]);
                equipmentAssignment.setEquipmentKey((int) res[1]);
                equipmentAssignment.setUserKey((int) res[2]);
                equipmentAssignment.setEmployeeKey((int) res[3]);
                equipmentAssignment.setDate((Date) res[4]);
                equipmentAssignment.setDateRegistration((Timestamp) res[5]);
                equipmentAssignment.setStatus((String) res[6]);
                equipmentAssignment.setObservations((String) res[7]);
            }
        }

        return equipmentAssignment;
    }

    @Override
    public ReturnSPModel saveEquipmentAssignment(EquipmentAssignment equipmentAssignment, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentKey" , equipmentAssignment.getEquipmentKey());
        parameters.put("UserKey" , equipmentAssignment.getUserKey());
        parameters.put("EmployeeKey" , equipmentAssignment.getEmployeeKey());
        parameters.put("Date" , equipmentAssignment.getDate());
        parameters.put("DateRegistration" , equipmentAssignment.getDateRegistration());
        parameters.put("Status" , equipmentAssignment.getStatus());
        parameters.put("Observations" , equipmentAssignment.getObservations());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentKey" , Integer.class);
        classParameter.put("UserKey" , Integer.class);
        classParameter.put("EmployeeKey" , Integer.class);
        classParameter.put("Date" , Date.class);
        classParameter.put("DateRegistration" , Timestamp.class);
        classParameter.put("Status" , String.class);
        classParameter.put("Observations" , String.class);

        List<Object[]> result = entityService.executeProcedure("InsertEquipmentAssignment", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel updateEquipmentAssignment(EquipmentAssignment equipmentAssignment, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentAssignmentKey" , equipmentAssignment.getEquipmentAssignmentKey());
        parameters.put("EquipmentKey" , equipmentAssignment.getEquipmentKey());
        parameters.put("UserKey" , equipmentAssignment.getUserKey());
        parameters.put("EmployeeKey" , equipmentAssignment.getEmployeeKey());
        parameters.put("Date" , equipmentAssignment.getDate());
        parameters.put("DateRegistration" , equipmentAssignment.getDateRegistration());
        parameters.put("Status" , equipmentAssignment.getStatus());
        parameters.put("Observations" , equipmentAssignment.getObservations());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentAssignmentKey" , Integer.class);
        classParameter.put("EquipmentKey" , Integer.class);
        classParameter.put("UserKey" , Integer.class);
        classParameter.put("EmployeeKey" , Integer.class);
        classParameter.put("Date" , Date.class);
        classParameter.put("DateRegistration" , Timestamp.class);
        classParameter.put("Status" , String.class);
        classParameter.put("Observations" , String.class);

        List<Object[]> result = entityService.executeProcedure("UpdateEquipmentAssignment", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel deleteEquipmentAssignment(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentAssignmentKey", id);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentAssignmentKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("deleteEquipmentAssignment", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public <S extends EquipmentAssignment> S save(S entity) {
        return null;
    }

    @Override
    public <S extends EquipmentAssignment> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<EquipmentAssignment> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<EquipmentAssignment> findAll() {
        return null;
    }

    @Override
    public Iterable<EquipmentAssignment> findAllById(Iterable<Integer> integers) {
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
    public void delete(EquipmentAssignment entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends EquipmentAssignment> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
