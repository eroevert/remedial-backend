package com.dh.ssic.services;

import com.dh.ssic.model.SkillsPosition;
import com.dh.ssic.repository.SkillsPositionRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class SkillsPositionServiceImpl extends GenericServiceImplementation<SkillsPosition> implements SkillsPositionService {
    private SkillsPositionRepository skillsPositionRepository;

    public SkillsPositionServiceImpl(SkillsPositionRepository skillsPositionRepository) {
        this.skillsPositionRepository = skillsPositionRepository;
    }

    @Override
    protected CrudRepository<SkillsPosition, Integer> getRepository() {
        return skillsPositionRepository;
    }

}
