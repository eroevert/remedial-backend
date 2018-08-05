package com.dh.ssic.repository;

import com.dh.ssic.model.AccidentType;
import com.dh.ssic.repositories.EntityService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public class AccidentTypeRepositoryImpl implements AccidentTypeRepository {
    @Override
    public List<AccidentType> getAllAccidentType(EntityService entityService) {
        List<Object[]> result = entityService.executeProcedure("getAllAccidentType", new HashMap<>(), new HashMap<>());
        List<AccidentType> accidentTypes = new ArrayList<>();

        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                AccidentType accidentType = new AccidentType();
                accidentType.setAccidentTypeKey((int)res[0]);
                accidentType.setParentKey((Integer) res[1]);
                accidentType.setName((String) res[2]);
                accidentType.setDescription((String) res[3]);
                accidentType.setState((String) res[4]);
                accidentType.setHaveSubType((boolean) res[5]);
                accidentTypes.add(accidentType);
            }
        }
        return accidentTypes;
    }

    @Override
    public <S extends AccidentType> S save(S entity) {
        return null;
    }

    @Override
    public <S extends AccidentType> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<AccidentType> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<AccidentType> findAll() {
        return null;
    }

    @Override
    public Iterable<AccidentType> findAllById(Iterable<Integer> integers) {
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
    public void delete(AccidentType entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends AccidentType> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
