package com.dh.ssic.services;

import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.math.BigDecimal;
import java.util.List;


public interface OrganizationService extends GenericService<Organization> {
    public ReturnModel<List<Organization>> FindByIdPadre(int id , EntityService entityService);
    public ReturnModel<Organization> FindOrganizationById(int id , EntityService entityService);
    public ReturnModel<ReturnSPModel> SaveOrganization(Organization model, EntityService entityService);
    public ReturnModel<ReturnSPModel> DeleteOrganization(Integer organizationKey, EntityService entityService);
    public ReturnModel<ReturnSPModel> UpdateOrganization(Organization model, EntityService entityService);
    public ReturnModel<List<Organization>> getAllOrganization(EntityService entityService);
}
