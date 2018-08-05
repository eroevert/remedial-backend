package com.dh.ssic.services;

import com.dh.ssic.model.DocumentType;
import com.dh.ssic.repositories.DocumenTypeRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class DocumentTypeServiceImp extends GenericServiceImplementation<DocumentType> implements DocumentTypeService {
    DocumenTypeRepository documenTypeRepository;

    public DocumentTypeServiceImp(DocumenTypeRepository documenTypeRepository) {
        this.documenTypeRepository = documenTypeRepository;
    }

    @Override
    protected CrudRepository<DocumentType, Integer> getRepository() {
        return documenTypeRepository;
    }
}
