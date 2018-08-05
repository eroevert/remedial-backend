package com.dh.ssic.model;
import org.hibernate.annotations.Subselect;

import javax.persistence.*;
import java.math.BigInteger;
import java.sql.Date;
import java.util.Objects;

@Entity
@Subselect("select ii.inventory_input_key, et.name as type,e.Name, e.Code,e.Status,p.Name as provider, ii.date, ii.quantity, ii.unit_price from inventory_input ii inner join Equipment e  on(ii.equipment_key=e.Equipment_Key) inner join equipment_type et on(e.Equipment_Type_Key=et.equipment_type_key) inner join Provider p on(ii.provider_key=p.Provider_Key)")
// @Immutable
//@NamedNativeQuery(name = "InventoryView", query = "select ii.inventory_input_key, et.name as type,e.Name, e.Code,e.Status,p.Name as provider, ii.date, ii.quantity, ii.unit_price from inventory_input ii inner join Equipment e  on(ii.equipment_key=e.Equipment_Key) inner join equipment_type et on(e.Equipment_Type_Key=et.equipment_type_key) inner join Provider p on(ii.provider_key=p.Provider_Key)", resultClass = InventoryView.class)
public class InventoryView {
    private String type;
    private String name;
    private String code;
    private String status;
    private String provider;
    private Date date;
    private int quantity;
    private BigInteger unitPrice;
    private int inventoryInputKey;

    @Id
    @Column(name = "inventory_input_key", nullable = false)
    public int getInventoryInputKey() {
        return inventoryInputKey;
    }

    public void setInventoryInputKey(int inventory_input_key) {
        this.inventoryInputKey = inventory_input_key;
    }

    @Basic
    @Column(name = "type", nullable = false, length = 50)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
    @Column(name = "Status", nullable = false, length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "provider", nullable = false, length = 150)
    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "quantity", nullable = false)
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "unit_price", nullable = false, precision = 0)
    public BigInteger getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigInteger unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InventoryView that = (InventoryView) o;
        return quantity == that.quantity &&
                Objects.equals(type, that.type) &&
                Objects.equals(name, that.name) &&
                Objects.equals(code, that.code) &&
                Objects.equals(status, that.status) &&
                Objects.equals(provider, that.provider) &&
                Objects.equals(date, that.date) &&
                Objects.equals(unitPrice, that.unitPrice);
    }

    @Override
    public int hashCode() {

        return Objects.hash(type, name, code, status, provider, date, quantity, unitPrice);
    }
}
