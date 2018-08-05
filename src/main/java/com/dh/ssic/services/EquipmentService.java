package com.dh.ssic.services;

import com.dh.ssic.model.Equipment;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface EquipmentService extends GenericService<Equipment>{
    public List<Equipment> getAllEquipment(EntityService entityService);
    public ReturnModel<Equipment> getEquipmentById(Integer id, EntityService entityService);
    public ReturnModel<ReturnSPModel> saveEquipment(Equipment equipment, EntityService entityService);
    public ReturnModel<ReturnSPModel> updateEquipment(Equipment equipment, EntityService entityService);
    public ReturnModel<ReturnSPModel> deleteEquipment(Integer id, EntityService entityService);
}
