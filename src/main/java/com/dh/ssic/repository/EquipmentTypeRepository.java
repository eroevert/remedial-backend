package com.dh.ssic.repository;

import com.dh.ssic.model.EquipmentType;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;
import org.springframework.util.Assert;

import javax.persistence.LockModeType;
import java.util.List;
import java.util.Map;
import java.util.Optional;


public interface EquipmentTypeRepository extends CrudRepository<EquipmentType, Integer> {
    Optional<List<EquipmentType>>findByName (String code);

    @Override
    List<EquipmentType> findAll();
    public EquipmentType getSingleEquipmentTypeByName(String name);

    public ReturnModel<EquipmentType> getEquipmentTypeByName(String name);
    public List<EquipmentType> getAllEquipmentType(EntityService entityService);
    public EquipmentType getEquipmentTypeById(Integer id, EntityService entityService);
    public ReturnSPModel saveEquipmentType(EquipmentType EquipmentType, EntityService entityService);
    public ReturnSPModel deleteEquipmentType(Integer id, EntityService entityService);
}

