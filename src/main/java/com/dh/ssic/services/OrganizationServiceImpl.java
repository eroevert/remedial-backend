package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.HierarchicalLevelRepository;
import com.dh.ssic.repository.OrganizationRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OrganizationServiceImpl extends GenericServiceImplementation<Organization> implements OrganizationService {
    private OrganizationRepository organizationRepository;
    private HierarchicalLevelRepository hierarchicalLevelRepository;

    public OrganizationServiceImpl(OrganizationRepository organizationRepository,
                                   HierarchicalLevelRepository hierarchicalLevelRepository) {
        this.organizationRepository = organizationRepository;
        this.hierarchicalLevelRepository = hierarchicalLevelRepository;
    }

    public ReturnModel<List<Organization>> FindByIdPadre(int id, EntityService entityService) {
        ReturnModel<List<Organization>> result = new ReturnModel<>();
        try {
            List<Organization> results = new ArrayList<>();
            this.organizationRepository.GetOrganizationsFromOrganization(id, entityService).forEach(results::add);
            if (results.isEmpty()) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " with id " + id + " do not have elements.");
                result.setCode(0);
            } else {
                result.setObject(results);
                result.setCode(1);
                for (Organization orgRes:results) {
                    HierarchicalLevel hLRes = this.hierarchicalLevelRepository.GetHierarchicalLevel(orgRes.getHierarchicalLevelKey(), entityService);
                    orgRes.setHierarchicalLevelByHierarchicalLevelKey(hLRes!=null?hLRes:new HierarchicalLevel());
                }
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

    public ReturnModel<Organization> FindOrganizationById(int id, EntityService entityService) {
        ReturnModel<Organization> result = new ReturnModel<>();
        try {
            Organization results = new Organization();
            results = this.organizationRepository.GetOrganizationId(id, entityService);
            if (results == null) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " with id " + id + " do not exist.");
                result.setCode(0);
            } else {
                HierarchicalLevel hLRes = this.hierarchicalLevelRepository.GetHierarchicalLevel(results.getHierarchicalLevelKey(), entityService);
                results.setHierarchicalLevelByHierarchicalLevelKey(hLRes!=null?hLRes:new HierarchicalLevel());
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
    protected CrudRepository<Organization, Integer> getRepository() {
        return organizationRepository;
    }

    @Override
    public ReturnModel<ReturnSPModel> SaveOrganization(Organization model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {

            ReturnSPModel saveResult = this.organizationRepository.SaveOrganization(model, entityService);
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
    public ReturnModel<ReturnSPModel> DeleteOrganization(Integer organizationKey, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.organizationRepository.DeleteOrganization(organizationKey, entityService);
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
    public ReturnModel<ReturnSPModel> UpdateOrganization(Organization model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.organizationRepository.UpdateOrganization(model, entityService);
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
    public ReturnModel<List<Organization>> getAllOrganization(EntityService entityService) {
        ReturnModel<List<Organization>> result = new ReturnModel<>();
        try {
            List<Organization> organizations = this.organizationRepository.getAllOrganization(entityService);
            result.setObject(organizations);
            result.setCode(1);
        } catch (Exception e) {
            result.setCode(-1);
            result.setMessage(e.getMessage());
        }
        return result;
    }
}
