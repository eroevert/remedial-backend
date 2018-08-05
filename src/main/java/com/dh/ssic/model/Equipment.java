package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "equipmentKey")

public class Equipment {
    private int equipmentKey;
    private int equipmentTypeKey;
    private String name;
    private String code;
    private String description;
    private String status;
    private EquipmentType equipmentTypeByEquipmentTypeKey;
    private Collection<EquipmentAssignment> equipmentAssignmentsByEquipmentKey;
    private Collection<EquipmentReturn> equipmentReturnsByEquipmentKey;
    private Collection<InventoryInput> inventoryInputsByEquipmentKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "EquipmentKey", nullable = false)
    public int getEquipmentKey() {
        return equipmentKey;
    }

    public void setEquipmentKey(int equipmentKey) {
        this.equipmentKey = equipmentKey;
    }

    @Basic
    @Column(name = "EquipmentTypeKey", nullable = false)
    public int getEquipmentTypeKey() {
        return equipmentTypeKey;
    }

    public void setEquipmentTypeKey(int equipmentTypeKey) {
        this.equipmentTypeKey = equipmentTypeKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 150)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Code", nullable = false, length = 50)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 500)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Equipment equipment = (Equipment) o;
        return equipmentKey == equipment.equipmentKey &&
                equipmentTypeKey == equipment.equipmentTypeKey &&
                Objects.equals(name, equipment.name) &&
                Objects.equals(code, equipment.code) &&
                Objects.equals(description, equipment.description) &&
                Objects.equals(status, equipment.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(equipmentKey, equipmentTypeKey, name, code, description, status);
    }

    @ManyToOne
    @JoinColumn(name = "EquipmentTypeKey", referencedColumnName = "EquipmentTypeKey", nullable = false, insertable=false, updatable=false)
    public EquipmentType getEquipmentTypeByEquipmentTypeKey() {
        return equipmentTypeByEquipmentTypeKey;
    }

    public void setEquipmentTypeByEquipmentTypeKey(EquipmentType equipmentTypeByEquipmentTypeKey) {
        this.equipmentTypeByEquipmentTypeKey = equipmentTypeByEquipmentTypeKey;
    }

    @OneToMany(mappedBy = "equipmentByEquipmentKey")
    @JsonIgnore
    public Collection<EquipmentAssignment> getEquipmentAssignmentsByEquipmentKey() {
        return equipmentAssignmentsByEquipmentKey;
    }

    public void setEquipmentAssignmentsByEquipmentKey(Collection<EquipmentAssignment> equipmentAssignmentsByEquipmentKey) {
        this.equipmentAssignmentsByEquipmentKey = equipmentAssignmentsByEquipmentKey;
    }

    @OneToMany(mappedBy = "equipmentByEquipmentKey")
    @JsonIgnore
    public Collection<EquipmentReturn> getEquipmentReturnsByEquipmentKey() {
        return equipmentReturnsByEquipmentKey;
    }

    public void setEquipmentReturnsByEquipmentKey(Collection<EquipmentReturn> equipmentReturnsByEquipmentKey) {
        this.equipmentReturnsByEquipmentKey = equipmentReturnsByEquipmentKey;
    }

    @OneToMany(mappedBy = "equipmentByEquipmentKey")
    @JsonIgnore
    public Collection<InventoryInput> getInventoryInputsByEquipmentKey() {
        return inventoryInputsByEquipmentKey;
    }

    public void setInventoryInputsByEquipmentKey(Collection<InventoryInput> inventoryInputsByEquipmentKey) {
        this.inventoryInputsByEquipmentKey = inventoryInputsByEquipmentKey;
    }
}
