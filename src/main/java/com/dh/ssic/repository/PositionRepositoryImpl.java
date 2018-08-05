package com.dh.ssic.repository;

import com.dh.ssic.model.Position;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class PositionRepositoryImpl implements PositionRepository {

    public PositionRepositoryImpl() {
    }

    @Override
    public Position save(Position entity) {
        return null;
    }

    @Override
    public <S extends Position> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Position> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Position> findAll() {
        return null;
    }

    @Override
    public Iterable<Position> findAllById(Iterable<Integer> integers) {
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
    public void delete(Position entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Position> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Position> GetPositions(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetPositions", parameters, classParameter);
        List<Position> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            Position position = new Position();
            position.setPositionKey((Integer) itemRes[0]);
            position.setOrganizationalHierarchyKey((Integer) itemRes[1]);
            position.setName((String) itemRes[2]);
            position.setEducation((String) itemRes[3]);
            position.setStatus((String) itemRes[4]);
            position.setDescription((String) itemRes[5]);
            result.add(position);
        }
        return result;
    }
    @Override
    public Position GetPositionById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("PositionKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("PositionKey", Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetPosition", parameters, classParameter);
        Position result = new Position();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            Position position = new Position();
            position.setPositionKey((Integer) results.get(0)[0]);
            position.setOrganizationalHierarchyKey((Integer) results.get(0)[1]);
            position.setName((String) results.get(0)[2]);
            position.setEducation((String) results.get(0)[3]);
            position.setStatus((String) results.get(0)[4]);
            position.setDescription((String) results.get(0)[5]);
            return position;
        }
        return null;
    }
}
