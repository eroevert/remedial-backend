package com.dh.ssic.services;

import com.dh.ssic.model.Skill;
import com.dh.ssic.repository.SkillRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class SkillServiceImpl extends GenericServiceImplementation<Skill> implements SkillService {
    private SkillRepository skillRepository;

    public SkillServiceImpl(SkillRepository skillRepository) {
        this.skillRepository = skillRepository;
    }

    @Override
    protected CrudRepository<Skill, Integer> getRepository() {
        return skillRepository;
    }

}
