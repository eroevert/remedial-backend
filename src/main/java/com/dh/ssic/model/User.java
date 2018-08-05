package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "userKey")

public class User {
    private int userKey;
    private int employeeKey;
    private int rolKey;
    private String userName;
    private String password;
    private String status;
    private Collection<EquipmentAssignment> equipmentAssignmentsByUserKey;
    private Collection<EquipmentReturn> equipmentReturnsByUserKey;
    private Collection<InventoryInput> inventoryInputsByUserKey;
    private Employee employeeByEmployeeKey;
    private Rol rolByRolKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    @Column(name = "RolKey", nullable = false)
    public int getRolKey() {
        return rolKey;
    }

    public void setRolKey(int rolKey) {
        this.rolKey = rolKey;
    }

    @Basic
    @Column(name = "UserName", nullable = false, length = 50)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "Password", nullable = false, length = 150)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 5)
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
        User user = (User) o;
        return userKey == user.userKey &&
                employeeKey == user.employeeKey &&
                rolKey == user.rolKey &&
                Objects.equals(userName, user.userName) &&
                Objects.equals(password, user.password) &&
                Objects.equals(status, user.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(userKey, employeeKey, rolKey, userName, password, status);
    }

    @OneToMany(mappedBy = "userByUserKey")
    @JsonIgnore
    public Collection<EquipmentAssignment> getEquipmentAssignmentsByUserKey() {
        return equipmentAssignmentsByUserKey;
    }

    public void setEquipmentAssignmentsByUserKey(Collection<EquipmentAssignment> equipmentAssignmentsByUserKey) {
        this.equipmentAssignmentsByUserKey = equipmentAssignmentsByUserKey;
    }

    @OneToMany(mappedBy = "userByUserKey")
    @JsonIgnore
    public Collection<EquipmentReturn> getEquipmentReturnsByUserKey() {
        return equipmentReturnsByUserKey;
    }

    public void setEquipmentReturnsByUserKey(Collection<EquipmentReturn> equipmentReturnsByUserKey) {
        this.equipmentReturnsByUserKey = equipmentReturnsByUserKey;
    }

    @OneToMany(mappedBy = "userByUserKey")
    @JsonIgnore
    public Collection<InventoryInput> getInventoryInputsByUserKey() {
        return inventoryInputsByUserKey;
    }

    public void setInventoryInputsByUserKey(Collection<InventoryInput> inventoryInputsByUserKey) {
        this.inventoryInputsByUserKey = inventoryInputsByUserKey;
    }

    @ManyToOne
    @JoinColumn(name = "EmployeeKey", referencedColumnName = "EmployeeKey", nullable = false, insertable=false, updatable=false)
    public Employee getEmployeeByEmployeeKey() {
        return employeeByEmployeeKey;
    }

    public void setEmployeeByEmployeeKey(Employee employeeByEmployeeKey) {
        this.employeeByEmployeeKey = employeeByEmployeeKey;
    }

    @ManyToOne
    @JoinColumn(name = "RolKey", referencedColumnName = "RolKey", nullable = false, insertable=false, updatable=false)
    public Rol getRolByRolKey() {
        return rolByRolKey;
    }

    public void setRolByRolKey(Rol rolByRolKey) {
        this.rolByRolKey = rolByRolKey;
    }
}
