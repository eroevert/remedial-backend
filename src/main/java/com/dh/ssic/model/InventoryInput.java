package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "inventoryInputKey")

public class InventoryInput {
    private int inventoryInputKey;
    private int equipmentKey;
    private int userKey;
    private int providerKey;
    private Date date;
    private int quantity;
    private BigDecimal unitPrice;
    private Timestamp dateRegistration;
    private Equipment equipmentByEquipmentKey;
    private User userByUserKey;
    private Provider providerByProviderKey;

    @Id
    @Column(name = "InventoryInputKey", nullable = false)
    public int getInventoryInputKey() {
        return inventoryInputKey;
    }

    public void setInventoryInputKey(int inventoryInputKey) {
        this.inventoryInputKey = inventoryInputKey;
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
    @Column(name = "ProviderKey", nullable = false)
    public int getProviderKey() {
        return providerKey;
    }

    public void setProviderKey(int providerKey) {
        this.providerKey = providerKey;
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
    @Column(name = "Quantity", nullable = false)
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "UnitPrice", nullable = false, precision = 10, scale = 2)
    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Basic
    @Column(name = "DateRegistration", nullable = false)
    public Timestamp getDateRegistration() {
        return dateRegistration;
    }

    public void setDateRegistration(Timestamp dateRegistration) {
        this.dateRegistration = dateRegistration;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InventoryInput that = (InventoryInput) o;
        return inventoryInputKey == that.inventoryInputKey &&
                equipmentKey == that.equipmentKey &&
                userKey == that.userKey &&
                providerKey == that.providerKey &&
                quantity == that.quantity &&
                Objects.equals(date, that.date) &&
                Objects.equals(unitPrice, that.unitPrice) &&
                Objects.equals(dateRegistration, that.dateRegistration);
    }

    @Override
    public int hashCode() {

        return Objects.hash(inventoryInputKey, equipmentKey, userKey, providerKey, date, quantity, unitPrice, dateRegistration);
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
    @JoinColumn(name = "ProviderKey", referencedColumnName = "ProviderKey", nullable = false, insertable=false, updatable=false)
    public Provider getProviderByProviderKey() {
        return providerByProviderKey;
    }

    public void setProviderByProviderKey(Provider providerByProviderKey) {
        this.providerByProviderKey = providerByProviderKey;
    }
}
