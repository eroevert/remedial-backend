package com.dh.ssic.repository;

import com.dh.ssic.model.City;
import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class HierarchicalLevelRepositoryImpl implements HierarchicalLevelRepository {

    public HierarchicalLevelRepositoryImpl() {
    }

    @Override
    public HierarchicalLevel save(HierarchicalLevel entity) {
        return null;
    }

    @Override
    public <S extends HierarchicalLevel> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<HierarchicalLevel> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<HierarchicalLevel> findAll() {
        return null;
    }

    @Override
    public Iterable<HierarchicalLevel> findAllById(Iterable<Integer> integers) {
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
    public void delete(HierarchicalLevel entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends HierarchicalLevel> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<HierarchicalLevel> GetHierarchicalLevels(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetHierarchicalLevels", parameters, classParameter);
        List<HierarchicalLevel> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            HierarchicalLevel hierarchicalLevel = new HierarchicalLevel();
            hierarchicalLevel.setHierarchicalLevelKey((Integer) itemRes[0]);
            hierarchicalLevel.setName((String) itemRes[1]);
            hierarchicalLevel.setStatus((String) itemRes[2]);
            hierarchicalLevel.setLevel((String) itemRes[3]);
            result.add(hierarchicalLevel);
        }
        return result;
    }

    @Override
    public HierarchicalLevel GetHierarchicalLevel(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("hierarchicalLevelKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("hierarchicalLevelKey", Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetHierarchicalLevelById", parameters, classParameter);
        HierarchicalLevel result = new HierarchicalLevel();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            HierarchicalLevel hierarchicalLevel = new HierarchicalLevel();
            hierarchicalLevel.setHierarchicalLevelKey((Integer) results.get(0)[0]);
            hierarchicalLevel.setName((String) results.get(0)[1]);
            hierarchicalLevel.setStatus((String) results.get(0)[2]);
            hierarchicalLevel.setLevel((String) results.get(0)[3]);
            return hierarchicalLevel;
        }
        return result;
    }
}
