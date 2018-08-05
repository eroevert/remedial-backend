package com.dh.ssic.repository;

import com.dh.ssic.model.Item;
import com.dh.ssic.model.Profession;
import org.springframework.data.repository.CrudRepository;

public interface ProfessionRepository extends CrudRepository<Profession, Integer> {
}
