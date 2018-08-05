package com.dh.ssic.repository;

import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface EquipmentRepository extends CrudRepository<Equipment, Integer> {
    Optional<List<Equipment>> findByCode(String code);

    List<Equipment> getAllEquipment(EntityService entityService);
    Equipment getEquipmentById(Integer id, EntityService entityService);
    ReturnSPModel saveEquipment(Equipment equipment, EntityService entityService);
    ReturnSPModel updateEquipment(Equipment equipment, EntityService entityService);
    ReturnSPModel deleteEquipment(Integer id, EntityService entityService);
}

