package com.dh.ssic.repositories;

import com.dh.ssic.model.*;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface EquipmentAssignmentRepository extends CrudRepository<EquipmentAssignment, Integer> {
    Optional<List<EquipmentAssignment>> findByEmployeeKey(int employeeKey);
    List<EquipmentAssignment> findEmployeeKey(int employeeKey, EntityService entityService);
    List<EquipmentAssignment> getAllEquipmentAssignment(EntityService entityService);
    EquipmentAssignment getEquipmentAssignmentById(Integer id, EntityService entityService);
    ReturnSPModel saveEquipmentAssignment(EquipmentAssignment equipment, EntityService entityService);
    ReturnSPModel updateEquipmentAssignment(EquipmentAssignment equipment, EntityService entityService);
    ReturnSPModel deleteEquipmentAssignment(Integer id, EntityService entityService);
}
