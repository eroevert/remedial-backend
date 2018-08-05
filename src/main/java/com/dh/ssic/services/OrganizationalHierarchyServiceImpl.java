package com.dh.ssic.services;

import com.dh.ssic.model.OrganizationalHierarchy;
import com.dh.ssic.repository.OrganizationalHierarchyRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class OrganizationalHierarchyServiceImpl extends GenericServiceImplementation<OrganizationalHierarchy> implements OrganizationalHierarchyService {
    private OrganizationalHierarchyRepository organizationalHierarchyRepository;

    public OrganizationalHierarchyServiceImpl(OrganizationalHierarchyRepository organizationalHierarchyRepository) {
        this.organizationalHierarchyRepository = organizationalHierarchyRepository;
    }

    @Override
    protected CrudRepository<OrganizationalHierarchy, Integer> getRepository() {
        return organizationalHierarchyRepository;
    }

}
