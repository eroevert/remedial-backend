package com.dh.ssic.services;


import com.dh.ssic.model.Profession;

import com.dh.ssic.repository.ProfessionRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class ProfessionServiceImpl extends GenericServiceImplementation<Profession> implements ProfessionService {
    private ProfessionRepository professionRepository;

    public ProfessionServiceImpl(ProfessionRepository professionRepository) {
        this.professionRepository = professionRepository;
    }

    @Override
    protected CrudRepository<Profession, Integer> getRepository() {
        return professionRepository;
    }
}
