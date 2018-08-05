package com.dh.ssic.services;

import com.dh.ssic.model.EquipmentType;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface EquipmentTypeService extends GenericService<EquipmentType> {
    public ReturnModel<List<EquipmentType>> GetAll(EntityService entityService);
    public ReturnModel<EquipmentType> FindEquipmentTypeById(int id, EntityService entityService);
    public ReturnModel<ReturnSPModel> SaveEquipmentType(EquipmentType model, EntityService entityService);
    public ReturnModel<ReturnSPModel> DeleteEquipmentType(Integer EquipmentTypeKey, EntityService entityService);
}
