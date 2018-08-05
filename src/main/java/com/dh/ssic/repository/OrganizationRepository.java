package com.dh.ssic.repository;

import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public interface OrganizationRepository extends CrudRepository<Organization, Integer> {
    /*public Organization findByName(String name);
    public List<Organization> findByIdPadre(int id);
    public Organization findByCode(String code);*/
    public List<Organization> GetOrganizationsFromOrganization(Integer id, EntityService entityService);
    public Organization GetOrganizationId(Integer id, EntityService entityService);
    public ReturnSPModel SaveOrganization(Organization organization, EntityService entityService);
    public ReturnSPModel DeleteOrganization(Integer organizationKey, EntityService entityService);
    public ReturnSPModel UpdateOrganization(Organization organization, EntityService entityService);
    public List<Organization> getAllOrganization(EntityService entityService);
}
