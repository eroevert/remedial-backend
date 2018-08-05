package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "equipmentReturnKey")

public class EquipmentReturn {
    private int equipmentReturnKey;
    private int equipmentKey;
    private int userKey;
    private int employeeKey;
    private Date date;
    private Timestamp dateRegistration;
    private String status;
    private String observations;
    private Equipment equipmentByEquipmentKey;
    private User userByUserKey;
    private Employee employeeByEmployeeKey;

    @Id
    @Column(name = "EquipmentReturnKey", nullable = false)
    public int getEquipmentReturnKey() {
        return equipmentReturnKey;
    }

    public void setEquipmentReturnKey(int equipmentReturnKey) {
        this.equipmentReturnKey = equipmentReturnKey;
    }

    @Basic
    @Column(name = "EquipmentKey", nullable = false)
    public int getEquipmentKey() {
        return equipmentKey;
    }

    public void setEquipmentKey(int equipmentKey) {
        this.equipmentKey = equipmentKey;
    }

    @Basic
    @Column(name = "UserKey", nullable = false)
    public int getUserKey() {
        return userKey;
    }

    public void setUserKey(int userKey) {
        this.userKey = userKey;
    }

    @Basic
    @Column(name = "EmployeeKey", nullable = false)
    public int getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(int employeeKey) {
        this.employeeKey = employeeKey;
    }

    @Basic
    @Column(name = "Date", nullable = false)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "DateRegistration", nullable = false)
    public Timestamp getDateRegistration() {
        return dateRegistration;
    }

    public void setDateRegistration(Timestamp dateRegistration) {
        this.dateRegistration = dateRegistration;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "Observations", nullable = false, length = 500)
    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EquipmentReturn that = (EquipmentReturn) o;
        return equipmentReturnKey == that.equipmentReturnKey &&
                equipmentKey == that.equipmentKey &&
                userKey == that.userKey &&
                employeeKey == that.employeeKey &&
                Objects.equals(date, that.date) &&
                Objects.equals(dateRegistration, that.dateRegistration) &&
                Objects.equals(status, that.status) &&
                Objects.equals(observations, that.observations);
    }

    @Override
    public int hashCode() {

        return Objects.hash(equipmentReturnKey, equipmentKey, userKey, employeeKey, date, dateRegistration, status, observations);
    }

    @ManyToOne
    @JoinColumn(name = "EquipmentKey", referencedColumnName = "EquipmentKey", nullable = false, insertable=false, updatable=false)
    public Equipment getEquipmentByEquipmentKey() {
        return equipmentByEquipmentKey;
    }

    public void setEquipmentByEquipmentKey(Equipment equipmentByEquipmentKey) {
        this.equipmentByEquipmentKey = equipmentByEquipmentKey;
    }

    @ManyToOne
    @JoinColumn(name = "UserKey", referencedColumnName = "UserKey", nullable = false, insertable=false, updatable=false)
    public User getUserByUserKey() {
        return userByUserKey;
    }

    public void setUserByUserKey(User userByUserKey) {
        this.userByUserKey = userByUserKey;
    }

    @ManyToOne
    @JoinColumn(name = "EmployeeKey", referencedColumnName = "EmployeeKey", nullable = false, insertable=false, updatable=false)
    public Employee getEmployeeByEmployeeKey() {
        return employeeByEmployeeKey;
    }

    public void setEmployeeByEmployeeKey(Employee employeeByEmployeeKey) {
        this.employeeByEmployeeKey = employeeByEmployeeKey;
    }
}
