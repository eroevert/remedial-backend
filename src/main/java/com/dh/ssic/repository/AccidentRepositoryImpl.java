package com.dh.ssic.repository;

import com.dh.ssic.model.Accident;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import javax.persistence.criteria.CriteriaBuilder;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

public class AccidentRepositoryImpl implements AccidentRepository  {

    @Override
    public <S extends Accident> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Accident> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Accident> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Accident> findAll() {
        return null;
    }

    @Override
    public Iterable<Accident> findAllById(Iterable<Integer> integers) {
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
    public void delete(Accident entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Accident> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Accident> getAllAccident(EntityService entityService) {
        List<Object[]> result = entityService.executeProcedure("getAllAccident", new HashMap<>(), new HashMap<>());
        List<Accident> accidents = new ArrayList<>();
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                Accident accident = new Accident();
                accident.setAccidentKey((int)res[0]);
                accident.setDateEvent((Timestamp) res[1]);
                accident.setDateRegister((Timestamp) res[2]);
                accident.setTitle((String) res[3]);
                accident.setDescribeIssue((String) res[4]);
                accident.setSuggestion((String) res[5]);
                accident.setLevelRiskId((int) res[6]);
                accident.setAccidentTypeKey((int) res[7]);
                accident.setEmployeeKey((int) res[8]);
                accident.setAnonymous((boolean) res[9]);
                accident.setResponsibleEmployeeKey((Integer) res[10]);
                accident.setStatus((String) res[11]);
                accident.setCloseDate((Timestamp) res[12]);
                accident.setCode((String) res[13]);
                accident.setMandatory((Boolean) res[14]);
                accident.setVoluntary((Boolean) res[15]);
                accident.setEndDate((Timestamp) res[16]);
                accident.setCreatedReportFromAdmin((Integer) res[17]);
                accident.setStatusReport((Integer) res[18]);
                accidents.add(accident);
            }
        }
        return accidents;
    }

    @Override
    public Accident getAccidentById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("AccidentKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("AccidentKey", Integer.class);
        Accident accident = null;
        List<Object[]> result = entityService.executeProcedure("GetAccident", parameters, classParameter);
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] res: result) {
                accident.setAccidentKey((int)res[0]);
                accident.setDateEvent((Timestamp) res[1]);
                accident.setDateRegister((Timestamp) res[2]);
                accident.setTitle((String) res[3]);
                accident.setDescribeIssue((String) res[4]);
                accident.setSuggestion((String) res[5]);
                accident.setLevelRiskId((int) res[6]);
                accident.setAccidentTypeKey((int) res[7]);
                accident.setEmployeeKey((int) res[8]);
                accident.setAnonymous((boolean) res[9]);
                accident.setResponsibleEmployeeKey((Integer) res[10]);
                accident.setStatus((String) res[11]);
                accident.setCloseDate((Timestamp) res[12]);
                accident.setCode((String) res[13]);
                accident.setMandatory((Boolean) res[14]);
                accident.setVoluntary((Boolean) res[15]);
                accident.setEndDate((Timestamp) res[16]);
                accident.setCreatedReportFromAdmin((Integer) res[17]);
                accident.setStatusReport((Integer) res[18]);
            }
        }

        return accident;
    }

    @Override
    public BigDecimal saveAccident(Accident accident, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("DateEvent", accident.getDateEvent());
        parameters.put("DateRegister", new Timestamp((new Date()).getTime()));
        parameters.put("Title", accident.getTitle());
        parameters.put("DescribeIssue" , accident.getDescribeIssue());
        parameters.put("Suggestion" , accident.getSuggestion());
        parameters.put("levelRiskId" , accident.getLevelRiskId());
        parameters.put("AccidentTypeKey", accident.getAccidentTypeKey());
        parameters.put("EmployeeKey" , accident.getEmployeeKey());
        parameters.put("IsAnonymous" , 0);
        parameters.put("ResponsibleEmployeeKey" , 1);
        parameters.put("Status" , accident.getStatus());
        parameters.put("CloseDate" , new Timestamp((new Date()).getTime()));
        parameters.put("Code" , accident.getCode());
        parameters.put("IsMandatory" , 0);
        parameters.put("isVoluntary" , 0);
        parameters.put("EndDate" , new Timestamp((new Date()).getTime()));
        parameters.put("createdReportFromAdmin" , 1);
        parameters.put("StatusReport" , accident.getStatus());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("DateEvent", Timestamp.class);
        classParameter.put("DateRegister", Timestamp.class);
        classParameter.put("Title", String.class);
        classParameter.put("DescribeIssue" , String.class);
        classParameter.put("Suggestion" , String.class);
        classParameter.put("levelRiskId" , int.class);
        classParameter.put("AccidentTypeKey", int.class);
        classParameter.put("EmployeeKey" , Integer.class);
        classParameter.put("IsAnonymous" , int.class);
        classParameter.put("ResponsibleEmployeeKey", Integer.class);
        classParameter.put("Status" , String.class);
        classParameter.put("CloseDate" , Timestamp.class);
        classParameter.put("Code" , String.class);
        classParameter.put("IsMandatory" , int.class);
        classParameter.put("isVoluntary" , int.class);
        classParameter.put("EndDate" , Timestamp.class);
        classParameter.put("createdReportFromAdmin" , Integer.class);
        classParameter.put("StatusReport" , String.class);

        List<BigDecimal> result = entityService.executeProcedure("InsertAccident", parameters, classParameter);

        return result.size() > 0 ? result.get(0) : null;
    }

    @Override
    public ReturnSPModel updateAccident(Accident accident, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("AccidentKey", accident.getDateEvent());
        parameters.put("DateEvent", accident.getDateEvent());
        parameters.put("DateRegister", accident.getDateRegister());
        parameters.put("Title", accident.getTitle());
        parameters.put("DescribeIssue" , accident.getDescribeIssue());
        parameters.put("Suggestion" , accident.getSuggestion());
        parameters.put("levelRiskId" , accident.getLevelRiskId());
        parameters.put("AccidentTypeKey", accident.getAccidentTypeKey());
        parameters.put("EmployeeKey" , accident.getEmployeeKey());
        parameters.put("IsAnonymous" , accident.isAnonymous());
        parameters.put("ResponsibleEmployeeKey" , accident.getResponsibleEmployeeKey());
        parameters.put("Status" , accident.getStatus());
        parameters.put("CloseDate" , accident.getCloseDate());
        parameters.put("Code" , accident.getCode());
        parameters.put("IsMandatory" , accident.getMandatory());
        parameters.put("isVoluntary" , accident.getVoluntary());
        parameters.put("EndDate" , accident.getEndDate());
        parameters.put("createdReportFromAdmin" , accident.getCreatedReportFromAdmin());
        parameters.put("StatusReport" , accident.getStatus());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("AccidentKey", Timestamp.class);
        classParameter.put("DateEvent", Timestamp.class);
        classParameter.put("DateRegister", Timestamp.class);
        classParameter.put("Title", String.class);
        classParameter.put("DescribeIssue" , String.class);
        classParameter.put("Suggestion" , String.class);
        classParameter.put("levelRiskId" , Integer.class);
        classParameter.put("AccidentTypeKey", Integer.class);
        classParameter.put("EmployeeKey" , Integer.class);
        classParameter.put("IsAnonymous" , Boolean.class);
        classParameter.put("ResponsibleEmployeeKey", Integer.class);
        classParameter.put("Status" , String.class);
        classParameter.put("CloseDate" , Timestamp.class);
        classParameter.put("Code" , String.class);
        classParameter.put("IsMandatory" , Boolean.class);
        classParameter.put("isVoluntary" , Boolean.class);
        classParameter.put("EndDate" , Timestamp.class);
        classParameter.put("createdReportFromAdmin" , Integer.class);
        classParameter.put("StatusReport" , String.class);

        List<Object[]> result = entityService.executeProcedure("GetAccident", parameters, classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public Integer deleteAccident(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("AccidentKey", id);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("AccidentKey" , Integer.class);

        List<Integer> result = entityService.executeProcedure("deleteAccident", parameters, classParameter);

        return result.size() > 0 ? result.get(0) : null;
    }
}
