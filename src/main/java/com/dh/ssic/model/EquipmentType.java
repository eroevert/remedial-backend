package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "equipmentTypeKey")
public class EquipmentType {
    private int equipmentTypeKey;
    private String name;
    private String description;
    private Collection<Equipment> equipmentByEquipmentTypeKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "EquipmentTypeKey", nullable = false)
    public int getEquipmentTypeKey() {
        return equipmentTypeKey;
    }

    public void setEquipmentTypeKey(int equipmentTypeKey) {
        this.equipmentTypeKey = equipmentTypeKey;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Description", nullable = false, length = 150)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EquipmentType that = (EquipmentType) o;
        return equipmentTypeKey == that.equipmentTypeKey &&
                Objects.equals(name, that.name) &&
                Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(equipmentTypeKey, name, description);
    }

    @OneToMany(mappedBy = "equipmentTypeByEquipmentTypeKey")
    @JsonIgnore
    public Collection<Equipment> getEquipmentByEquipmentTypeKey() {
        return equipmentByEquipmentTypeKey;
    }

    public void setEquipmentByEquipmentTypeKey(Collection<Equipment> equipmentByEquipmentTypeKey) {
        this.equipmentByEquipmentTypeKey = equipmentByEquipmentTypeKey;
    }
}
