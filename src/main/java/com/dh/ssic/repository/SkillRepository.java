package com.dh.ssic.repository;

import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.model.Skill;
import org.springframework.data.repository.CrudRepository;

public interface SkillRepository extends CrudRepository<Skill, Integer> {
}
