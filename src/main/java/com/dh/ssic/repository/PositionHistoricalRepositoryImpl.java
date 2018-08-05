package com.dh.ssic.repository;

import com.dh.ssic.model.Organization;
import com.dh.ssic.model.PositionHistorical;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.sql.Timestamp;
import java.util.*;

public class PositionHistoricalRepositoryImpl implements PositionHistoricalRepository {

    public PositionHistoricalRepositoryImpl() {
    }

    @Override
    public PositionHistorical save(PositionHistorical entity) {
        return null;
    }

    @Override
    public <S extends PositionHistorical> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<PositionHistorical> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<PositionHistorical> findAll() {
        return null;
    }

    @Override
    public Iterable<PositionHistorical> findAllById(Iterable<Integer> integers) {
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
    public void delete(PositionHistorical entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends PositionHistorical> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<PositionHistorical> GetAllPositionsHistorical(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetAllPositionHistorical", parameters, classParameter);
        List<PositionHistorical> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            PositionHistorical PositionHistorical = new PositionHistorical();
            PositionHistorical.setHistorialCargoId((Integer) itemRes[0]);
            PositionHistorical.setEmployeeKey((Integer) itemRes[1]);
            PositionHistorical.setItemKey((Integer) itemRes[2]);
            PositionHistorical.setMemoNumber((String) itemRes[3]);
            PositionHistorical.setStart((Timestamp) itemRes[4]);
            PositionHistorical.setEnd((Timestamp) itemRes[5]);
            PositionHistorical.setStatus((String) itemRes[6]);
            PositionHistorical.setResponsibleKey((Integer) itemRes[7]);
            PositionHistorical.setApprovalDate((Timestamp) itemRes[8]);
            result.add(PositionHistorical);
        }
        return result;
    }
    @Override
    public PositionHistorical GetPositionHistoricalById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("historialCargoID", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("historialCargoID", Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetPositionHistorical", parameters, classParameter);
        PositionHistorical result = new PositionHistorical();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            PositionHistorical PositionHistorical = new PositionHistorical();
            PositionHistorical.setHistorialCargoId((Integer) results.get(0)[0]);
            PositionHistorical.setEmployeeKey((Integer) results.get(0)[1]);
            PositionHistorical.setItemKey((Integer) results.get(0)[2]);
            PositionHistorical.setMemoNumber((String) results.get(0)[3]);
            PositionHistorical.setStart((Timestamp) results.get(0)[4]);
            PositionHistorical.setEnd((Timestamp) results.get(0)[5]);
            PositionHistorical.setStatus((String) results.get(0)[6]);
            PositionHistorical.setResponsibleKey((Integer) results.get(0)[7]);
            PositionHistorical.setApprovalDate((Timestamp) results.get(0)[8]);
            return PositionHistorical;
        }
        return null;
    }
//SPA_InsertPositionHistorical
    @Override
    public List<PositionHistorical> GetPositionHistoricalByEmployee(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("employeeKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("employeeKey", Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GettPositionHistoricalByEmployee", parameters, classParameter);
        List<PositionHistorical> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            PositionHistorical PositionHistorical = new PositionHistorical();
            PositionHistorical.setHistorialCargoId((Integer) itemRes[0]);
            PositionHistorical.setEmployeeKey((Integer) itemRes[1]);
            PositionHistorical.setItemKey((Integer) itemRes[2]);
            PositionHistorical.setMemoNumber((String) itemRes[3]);
            PositionHistorical.setStart((Timestamp) itemRes[4]);
            PositionHistorical.setEnd((Timestamp) itemRes[5]);
            PositionHistorical.setStatus((String.valueOf((Character)itemRes[6])));
            PositionHistorical.setResponsibleKey((Integer) itemRes[7]);
            PositionHistorical.setApprovalDate((Timestamp) itemRes[8]);
            result.add(PositionHistorical);
        }
        return result;
    }
    @Override
    public ReturnSPModel SavePositionHistorical(PositionHistorical positionHistorical, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("employeeKey" , positionHistorical.getEmployeeKey());
        parameters.put("itemKey" , positionHistorical.getItemKey());
        parameters.put("memoNumer" , positionHistorical.getMemoNumber());
        parameters.put("start" , positionHistorical.getStart());
        parameters.put("end" , positionHistorical.getEnd());
        parameters.put("status" , positionHistorical.getStatus());
        parameters.put("responsibleKey" , positionHistorical.getResponsibleKey());
        parameters.put("approbalDate" , positionHistorical.getApprovalDate());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("employeeKey" , Integer.class);
        classParameter.put("itemKey" , Integer.class);
        classParameter.put("memoNumer" , String.class);
        classParameter.put("start" , Timestamp.class);
        classParameter.put("end" , Timestamp.class);
        classParameter.put("status" , String.class);
        classParameter.put("responsibleKey" , Integer.class);
        classParameter.put("approbalDate" , Timestamp.class);

        List<Object[]> result = entityService.executeProcedure("SPA_InsertPositionHistorical", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

}
