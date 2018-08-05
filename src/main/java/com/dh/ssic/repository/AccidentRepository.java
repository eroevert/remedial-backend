package com.dh.ssic.repository;

import com.dh.ssic.model.Accident;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.math.BigDecimal;
import java.util.List;


public interface AccidentRepository extends CrudRepository<Accident, Integer> {
    List<Accident> getAllAccident(EntityService entityService);
    Accident getAccidentById(Integer id, EntityService entityService);
    BigDecimal saveAccident(Accident equipment, EntityService entityService);
    ReturnSPModel updateAccident(Accident equipment, EntityService entityService);
    Integer deleteAccident(Integer id, EntityService entityService);
}
