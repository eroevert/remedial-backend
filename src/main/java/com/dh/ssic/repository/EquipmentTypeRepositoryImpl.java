package com.dh.ssic.repository;

import com.dh.ssic.model.EquipmentType;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class EquipmentTypeRepositoryImpl implements EquipmentTypeRepository {

    public EquipmentTypeRepositoryImpl() {
    }

    @Override
    public List<EquipmentType> getAllEquipmentType(EntityService entityService) {
        List<Object[]> result = entityService.executeProcedure("SPA_GetEquipmentsType", new HashMap<>(), new HashMap<>());
        List<EquipmentType> EquipmentTypeList = new ArrayList<>();
        if(result.size() > 0 ? result.get(0).length > 0 : false) {

            for(Object[] res : result) {
                EquipmentType EquipmentType = new EquipmentType();
                EquipmentType.setEquipmentTypeKey((int)res[0]);
                EquipmentType.setName((String) res[1]);
                EquipmentType.setDescription((String) res[2]);
                EquipmentTypeList.add(EquipmentType);
            }
        }
        return EquipmentTypeList;
    }

    @Override
    public EquipmentType getEquipmentTypeById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentTypeKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentTypeKey", Integer.class);
        EquipmentType EquipmentType = new EquipmentType();
        List<Object[]> result = entityService.executeProcedure("GetEquipmentType", parameters, classParameter);
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                EquipmentType.setEquipmentTypeKey((int)res[0]);
                EquipmentType.setName((String) res[1]);
                EquipmentType.setDescription((String) res[2]);
            }
        }
        return EquipmentType;
    }

    @Override
    public ReturnSPModel saveEquipmentType(EquipmentType EquipmentType, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("Name" , EquipmentType.getName());
        parameters.put("Description" , EquipmentType.getDescription());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("Name" , String.class);
        classParameter.put("Description" , String.class);

        List<Object[]> result = entityService.executeProcedure("InsertEquipmentType", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel deleteEquipmentType(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EquipmentTypeKey", id);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EquipmentTypeKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("deleteEquipmentType", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public <S extends EquipmentType> S save(S entity) {
        return null;
    }

    @Override
    public <S extends EquipmentType> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<EquipmentType> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Optional<List<EquipmentType>> findByName(String code) {
        return Optional.empty();
    }

    @Override
    public List<EquipmentType> findAll() {
        return null;
    }

    @Override
    public EquipmentType getSingleEquipmentTypeByName(String name) {
        return null;
    }

    @Override
    public ReturnModel<EquipmentType> getEquipmentTypeByName(String name) {
        return null;
    }

    @Override
    public Iterable<EquipmentType> findAllById(Iterable<Integer> integers) {
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
    public void delete(EquipmentType entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends EquipmentType> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
