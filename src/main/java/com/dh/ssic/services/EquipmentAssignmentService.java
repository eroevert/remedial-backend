package com.dh.ssic.services;


import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.EquipmentAssignment;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;
import java.util.Set;


public interface EquipmentAssignmentService extends GenericService<EquipmentAssignment> {
    public List<EquipmentAssignment> findByEmployeeKey(int employeeKey);
    public List<EquipmentAssignment> findByEmployeeKey(int employeeKey, EntityService entityService);
    public List<EquipmentAssignment> getAllEquipmentAssignment(EntityService entityService);
    public ReturnModel<EquipmentAssignment> getEquipmentAssignmentById(Integer id, EntityService entityService);
    public ReturnModel<ReturnSPModel> saveEquipmentAssingment(EquipmentAssignment equipmentAssignment, EntityService entityService);
    public ReturnModel<ReturnSPModel> updateEquipmentAssignment(EquipmentAssignment equipmentAssignment, EntityService entityService);
    public ReturnModel<ReturnSPModel> deleteEquipmentAssignment(Integer id, EntityService entityService);
}
