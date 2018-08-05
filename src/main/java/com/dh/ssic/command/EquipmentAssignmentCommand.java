package com.dh.ssic.command;

import com.dh.ssic.controller.EmployeeController;
import com.dh.ssic.model.BaseModel;
import com.dh.ssic.model.Employee;
import com.dh.ssic.model.EquipmentAssignment;

import java.sql.Timestamp;
import java.util.Date;

public class EquipmentAssignmentCommand {

    private int equipmentAssignmentKey;
    private int equipmentKey;
    private int userKey;
    private int employeeKey;
    private String employeeName;
    private String userName;
    private String equipmentName;
    private String employeeCode;
    private String equipmentCode;
    private String observations;

    public EquipmentAssignmentCommand(EquipmentAssignment equipmentAssignment) {
        this.equipmentAssignmentKey = equipmentAssignment.getEquipmentAssignmentKey();
        this.equipmentKey = equipmentAssignment.getEquipmentKey();
        this.employeeKey = equipmentAssignment.getEmployeeKey();
        this.userKey = equipmentAssignment.getUserKey();
        this.observations = equipmentAssignment.getObservations();
        this.employeeName = equipmentAssignment.getEmployeeByEmployeeKey().getFirstName() + " "
                + equipmentAssignment.getEmployeeByEmployeeKey().getLastName();
        this.employeeCode = equipmentAssignment.getEmployeeByEmployeeKey().getEmployeeCode();
        //this.equipmentName = equipmentAssignment.getEquipmentByEquipmentKey().getName();
        //this.equipmentCode = equipmentAssignment.getEquipmentByEquipmentKey().getCode();
    }

    public int getEquipmentKey() {
        return equipmentKey;
    }

    public void setEquipmentKey(int equipmentKey) {
        this.equipmentKey = equipmentKey;
    }

    public int getUserKey() {
        return userKey;
    }

    public void setUserKey(int userKey) {
        this.userKey = userKey;
    }

    public int getEmployeeKey() {
        return employeeKey;
    }

    public void setEmployeeKey(int employeeKey) {
        this.employeeKey = employeeKey;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public String getEquipmentCode() {
        return equipmentCode;
    }

    public void setEquipmentCode(String equipmentCode) {
        this.equipmentCode = equipmentCode;
    }

    public int getEquipmentAssignmentKey() {
        return equipmentAssignmentKey;
    }

    public void setEquipmentAssignmentKey(int equipmentAssignmentKey) {
        this.equipmentAssignmentKey = equipmentAssignmentKey;
    }

    public EquipmentAssignment toEquipmentAssignment() {
        EquipmentAssignment equipmentAssignment = new EquipmentAssignment();
        equipmentAssignment.setEmployeeKey(employeeKey);
        equipmentAssignment.setEquipmentKey(equipmentKey);
        equipmentAssignment.setObservations(observations);
        equipmentAssignment.setUserKey(userKey);
        return equipmentAssignment;
    }
}
