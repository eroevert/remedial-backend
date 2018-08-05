package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "itemKey")
public class Item {
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int itemKey;
    private int organizationKey;
    private int typeContractKey;
    private String itemNumber;
    private int positionKey;
    private int salaryScaleKey;
    private String code;
    private String status;
    private Integer cityKey;
    private Organization organizationByOrganizationKey;
    private TypeContract typeContractByTypeContractKey;
    private Position positionByPositionKey;
    private SalaryScale salaryScaleBySalaryScaleKey;
    private Collection<PositionHistorical> positionHistoricalsByItemKey;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ItemKey", nullable = false)
    public int getItemKey() {
        return itemKey;
    }

    public void setItemKey(int itemKey) {
        this.itemKey = itemKey;
    }

    @Basic
    @Column(name = "OrganizationKey", nullable = false)
    public int getOrganizationKey() {
        return organizationKey;
    }

    public void setOrganizationKey(int organizationKey) {
        this.organizationKey = organizationKey;
    }

    @Basic
    @Column(name = "TypeContractKey", nullable = false)
    public int getTypeContractKey() {
        return typeContractKey;
    }

    public void setTypeContractKey(int typeContractKey) {
        this.typeContractKey = typeContractKey;
    }

    @Basic
    @Column(name = "ItemNumber", nullable = false, length = 20)
    public String getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(String itemNumber) {
        this.itemNumber = itemNumber;
    }

    @Basic
    @Column(name = "PositionKey", nullable = false)
    public int getPositionKey() {
        return positionKey;
    }

    public void setPositionKey(int positionKey) {
        this.positionKey = positionKey;
    }

    @Basic
    @Column(name = "SalaryScaleKey", nullable = false)
    public int getSalaryScaleKey() {
        return salaryScaleKey;
    }

    public void setSalaryScaleKey(int salaryScaleKey) {
        this.salaryScaleKey = salaryScaleKey;
    }

    @Basic
    @Column(name = "Code", nullable = false, length = 20)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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
    @Column(name = "CityKey", nullable = true)
    public Integer getCityKey() {
        return cityKey;
    }

    public void setCityKey(Integer cityKey) {
        this.cityKey = cityKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Item item = (Item) o;
        return itemKey == item.itemKey &&
                organizationKey == item.organizationKey &&
                typeContractKey == item.typeContractKey &&
                positionKey == item.positionKey &&
                salaryScaleKey == item.salaryScaleKey &&
                Objects.equals(itemNumber, item.itemNumber) &&
                Objects.equals(code, item.code) &&
                Objects.equals(status, item.status) &&
                Objects.equals(cityKey, item.cityKey);
    }

    @Override
    public int hashCode() {

        return Objects.hash(itemKey, organizationKey, typeContractKey, itemNumber, positionKey, salaryScaleKey, code, status, cityKey);
    }

    @ManyToOne
    @JoinColumn(name = "OrganizationKey", referencedColumnName = "OrganizationKey", nullable = false, insertable=false, updatable=false)
    public Organization getOrganizationByOrganizationKey() {
        return organizationByOrganizationKey;
    }

    public void setOrganizationByOrganizationKey(Organization organizationByOrganizationKey) {
        this.organizationByOrganizationKey = organizationByOrganizationKey;
    }

    @ManyToOne
    @JoinColumn(name = "TypeContractKey", referencedColumnName = "TypeContractKey", nullable = false, insertable=false, updatable=false)
    public TypeContract getTypeContractByTypeContractKey() {
        return typeContractByTypeContractKey;
    }

    public void setTypeContractByTypeContractKey(TypeContract typeContractByTypeContractKey) {
        this.typeContractByTypeContractKey = typeContractByTypeContractKey;
    }

    @ManyToOne
    @JoinColumn(name = "PositionKey", referencedColumnName = "PositionKey", nullable = false, insertable=false, updatable=false)
    public Position getPositionByPositionKey() {
        return positionByPositionKey;
    }

    public void setPositionByPositionKey(Position positionByPositionKey) {
        this.positionByPositionKey = positionByPositionKey;
    }

    @ManyToOne
    @JoinColumn(name = "SalaryScaleKey", referencedColumnName = "SalaryScaleKey", nullable = false, insertable=false, updatable=false)
    public SalaryScale getSalaryScaleBySalaryScaleKey() {
        return salaryScaleBySalaryScaleKey;
    }

    public void setSalaryScaleBySalaryScaleKey(SalaryScale salaryScaleBySalaryScaleKey) {
        this.salaryScaleBySalaryScaleKey = salaryScaleBySalaryScaleKey;
    }

    @OneToMany(mappedBy = "itemByItemKey",fetch = FetchType.EAGER)
    @JsonIgnore
    public Collection<PositionHistorical> getPositionHistoricalsByItemKey() {
        return positionHistoricalsByItemKey;
    }

    public void setPositionHistoricalsByItemKey(Collection<PositionHistorical> positionHistoricalsByItemKey) {
        this.positionHistoricalsByItemKey = positionHistoricalsByItemKey;
    }
}
