package com.dh.ssic.repository;

import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

public class OrganizationRepositoryImpl implements OrganizationRepository  {
    @Override
    public List<Organization> GetOrganizationsFromOrganization(Integer id, EntityService entityService) {

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("idOrgnanizationFather", id);
            Map<String, Class> classParameter = new HashMap<>();
            classParameter.put("idOrgnanizationFather", Integer.class);
            List<Object[]> results = entityService.executeProcedure("SPA_GetOrganizationsFromOrganization", parameters, classParameter);
            List<Organization> list = new ArrayList<>();
            for (Object[] item:results) {
                Organization organization = new Organization();
                organization.setOrganizationKey((Integer) item[0]);
                organization.setHierarchicalLevelKey((Integer) item[1]);
                organization.setIdPadre((Integer) item[2]);
                organization.setName((String) item[3]);
                organization.setDescription((String) item[4]);
                organization.setCode((String) item[5]);
                organization.setStart((Timestamp) item[6]);
                organization.setEnd((Timestamp) item[7]);
                organization.setStatus(item[8].toString());
                organization.setGestion(item[9].toString());
                list.add(organization);
            }
            return list;
    }

    @Override
    public Organization GetOrganizationId(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("OrganizationKey" , id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("OrganizationKey" , Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetOrganization", parameters, classParameter);
        Organization organization = new Organization();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            organization.setOrganizationKey((Integer) results.get(0)[0]);
            organization.setHierarchicalLevelKey((Integer) results.get(0)[1]);
            organization.setIdPadre((Integer) results.get(0)[2]);
            organization.setName((String) results.get(0)[3]);
            organization.setDescription((String) results.get(0)[4]);
            organization.setCode((String) results.get(0)[5]);
            organization.setStart((Timestamp) results.get(0)[6]);
            organization.setEnd((Timestamp) results.get(0)[7]);
            organization.setStatus(results.get(0)[8].toString());
            organization.setGestion(results.get(0)[9].toString());
            return organization;
        }
        return null;
    }

    @Override
    public ReturnSPModel SaveOrganization(Organization organization, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("hierarchicalLevelKey" , organization.getHierarchicalLevelKey());
        parameters.put("fatherId" , organization.getIdPadre());
        parameters.put("name" , organization.getName());
        parameters.put("description" , organization.getDescription());
        parameters.put("code" , organization.getCode());
        parameters.put("start" , organization.getStart());
        parameters.put("end" , organization.getEnd());
        parameters.put("status" , organization.getStatus());
        parameters.put("gestion" , organization.getGestion());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("hierarchicalLevelKey" , Integer.class);
        classParameter.put("fatherId" , Integer.class);
        classParameter.put("name" , String.class);
        classParameter.put("description" , String.class);
        classParameter.put("code" , String.class);
        classParameter.put("start" , Timestamp.class);
        classParameter.put("end" , Timestamp.class);
        classParameter.put("status" , String.class);
        classParameter.put("gestion" , String.class);

        List<Object[]> result = entityService.executeProcedure("SPA_InsertOrganization", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel DeleteOrganization(Integer organizationKey, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("OrganizationKey" ,organizationKey);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("OrganizationKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("SPA_DeleteOrganization", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel UpdateOrganization(Organization organization, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("OrganizationKey" , organization.getHierarchicalLevelKey());
        parameters.put("hierarchicalLevelKey" , organization.getHierarchicalLevelKey());
        parameters.put("fatherId" , organization.getIdPadre());
        parameters.put("name" , organization.getName());
        parameters.put("description" , organization.getDescription());
        parameters.put("code" , organization.getCode());
        parameters.put("start" , organization.getStart());
        parameters.put("end" , organization.getEnd());
        parameters.put("status" , organization.getStatus());
        parameters.put("gestion" , organization.getGestion());

        Map<String, Class> classParameter = new HashMap<>();
        parameters.put("OrganizationKey" , Integer.class);
        classParameter.put("hierarchicalLevelKey" , Integer.class);
        classParameter.put("fatherId" , Integer.class);
        classParameter.put("name" , String.class);
        classParameter.put("description" , String.class);
        classParameter.put("code" , String.class);
        classParameter.put("start" , Timestamp.class);
        classParameter.put("end" , Timestamp.class);
        classParameter.put("status" , String.class);
        classParameter.put("gestion" , String.class);

        List<Object[]> result = entityService.executeProcedure("SPA_UpdateOrganization", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<Organization> getAllOrganization(EntityService entityService) {
        List<Object[]> result = entityService.executeProcedure("SPA_GetAllOrganization", new HashMap<>(), new HashMap<>());
        List<Organization> list = new ArrayList<>();
        if(result.size() > 0 ? result.get(0).length > 0 : false) {
            for(Object[] item: result) {
                Organization organization = new Organization();
                organization.setOrganizationKey((int)item[0]);
                organization.setHierarchicalLevelKey((int) item[1]);
                organization.setIdPadre((int) item[2]);
                organization.setName((String) item[3]);
                organization.setDescription((String) item[4]);
                organization.setCode((String) item[5]);
                organization.setStart((Timestamp) item[6]);
                organization.setEnd((Timestamp) item[7]);
                organization.setStatus(String.valueOf((Character) item[8]));
                organization.setGestion((String) item[9]);
                list.add(organization);
            }
        }

        return list;
    }

    @Override
    public <S extends Organization> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Organization> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Organization> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Organization> findAll() {
        return null;
    }

    @Override
    public Iterable<Organization> findAllById(Iterable<Integer> integers) {
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
    public void delete(Organization entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Organization> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
