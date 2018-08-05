package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "historialCargoId")

public class PositionHistorical {
    private int historialCargoId;
    private int employeeKey;
    private int itemKey;
    private String memoNumber;
    private Timestamp start;
    private Timestamp end;
    private String status;
    private int responsibleKey;
    private Timestamp approvalDate;
    private Employee employeeByEmployeeKey;
    private Item itemByItemKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "historialCargoID", nullable = false)
    public int getHistorialCargoId() {
        return historialCargoId;
    }

    public void setHistorialCargoId(int historialCargoId) {
        this.historialCargoId = historialCargoId;
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
    @Column(name = "ItemKey", nullable = false)
    public int getItemKey() {
        return itemKey;
    }

    public void setItemKey(int itemKey) {
        this.itemKey = itemKey;
    }

    @Basic
    @Column(name = "MemoNumber", nullable = false, length = 512)
    public String getMemoNumber() {
        return memoNumber;
    }

    public void setMemoNumber(String memoNumber) {
        this.memoNumber = memoNumber;
    }

    @Basic
    @Column(name = "Start", nullable = false)
    public Timestamp getStart() {
        return start;
    }

    public void setStart(Timestamp start) {
        this.start = start;
    }

    @Basic
    @Column(name = "End", nullable = false)
    public Timestamp getEnd() {
        return end;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 1)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "ResponsibleKey", nullable = false)
    public int getResponsibleKey() {
        return responsibleKey;
    }

    public void setResponsibleKey(int responsibleKey) {
        this.responsibleKey = responsibleKey;
    }

    @Basic
    @Column(name = "ApprovalDate", nullable = false)
    public Timestamp getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Timestamp approvalDate) {
        this.approvalDate = approvalDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PositionHistorical that = (PositionHistorical) o;
        return historialCargoId == that.historialCargoId &&
                employeeKey == that.employeeKey &&
                itemKey == that.itemKey &&
                responsibleKey == that.responsibleKey &&
                Objects.equals(memoNumber, that.memoNumber) &&
                Objects.equals(start, that.start) &&
                Objects.equals(end, that.end) &&
                Objects.equals(status, that.status) &&
                Objects.equals(approvalDate, that.approvalDate);
    }

    @Override
    public int hashCode() {

        return Objects.hash(historialCargoId, employeeKey, itemKey, memoNumber, start, end, status, responsibleKey, approvalDate);
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
    @JoinColumn(name = "ItemKey", referencedColumnName = "ItemKey", nullable = false, insertable=false, updatable=false)
    public Item getItemByItemKey() {
        return itemByItemKey;
    }

    public void setItemByItemKey(Item itemByItemKey) {
        this.itemByItemKey = itemByItemKey;
    }

}
