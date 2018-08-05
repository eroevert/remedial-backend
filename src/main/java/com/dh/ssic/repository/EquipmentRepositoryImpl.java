package com.dh.ssic.repository;

import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class EquipmentRepositoryImpl implements EquipmentRepository {

    public EquipmentRepositoryImpl() {
    }

    @Override
    public Optional<List<Equipment>> findByCode(String code) {
        return Optional.empty();
    }

    @Override
    public List<Equipment> getAllEquipment(EntityService entityService) {
        List<Object[]> result = entityService.executeProcedure("SPA_GetAllEquipments", new HashMap<>(), new HashMap<>());
        List<Equipment> equipmentList = new ArrayList<>();
        if(result.size() > 0 ? result.get(0).length > 0 : false) {

            for(Object[] res : result) {
                Equipment equipment = new Equipment();
                equipment.setEquipmentKey((int)res[0]);
                equipment.setName((String) res[1]);
                equipment.setCode((String) res[2]);
                equipment.setDescription((String) res[3]);
                equipment.setStatus((String) res[4]);
                equipment.setEquipmentTypeKey((int) res[5]);
                equipmentList.add(equipment);
            }
        }
        return equipmentList;
    }

    @Override
    public Equipment getEquipmentById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentKey", Integer.class);
        Equipment equipment = new Equipment();
        List<Object[]> result = entityService.executeProcedure("GetEquipment", parameters, classParameter);
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                equipment.setEquipmentKey((int)res[0]);
                equipment.setName((String) res[1]);
                equipment.setCode((String) res[2]);
                equipment.setDescription((String) res[3]);
                equipment.setStatus((String) res[4]);
                equipment.setEquipmentTypeKey((int)res[5]);
            }
        }

        return equipment;
    }

    @Override
    public ReturnSPModel saveEquipment(Equipment equipment, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("Name" , equipment.getName());
        parameters.put("Code" , equipment.getCode());
        parameters.put("Description" , equipment.getDescription());
        parameters.put("Status" , equipment.getStatus());
        parameters.put("EquipmentTypeKey" , equipment.getEquipmentTypeKey());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("Name" , String.class);
        classParameter.put("Code" , String.class);
        classParameter.put("Description" , String.class);
        classParameter.put("Status" , String.class);
        classParameter.put("EquipmentTypeKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("InsertEquipment", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel updateEquipment(Equipment equipment, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentKey" , equipment.getEquipmentKey());
        parameters.put("Name" , equipment.getName());
        parameters.put("Code" , equipment.getCode());
        parameters.put("Description" , equipment.getDescription());
        parameters.put("Status" , equipment.getStatus());
        parameters.put("EquipmentTypeKey" , equipment.getEquipmentKey());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentKey" , Integer.class);
        classParameter.put("Name" , String.class);
        classParameter.put("Code" , String.class);
        classParameter.put("Description" , String.class);
        classParameter.put("Status" , String.class);
        classParameter.put("EquipmentTypeKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("UpdateEquipment", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel deleteEquipment(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentKey", id);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("deleteEquipment", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public <S extends Equipment> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Equipment> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Equipment> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public List<Equipment> findAll() {
        return null;
    }

    @Override
    public Iterable<Equipment> findAllById(Iterable<Integer> integers) {
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
    public void delete(Equipment entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Equipment> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
