package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "providerKey")

public class Provider {
    private int providerKey;
    private String name;
    private String address;
    private String phone;
    private String contact;
    private Collection<InventoryInput> inventoryInputsByProviderKey;

    @Id
    @Column(name = "ProviderKey", nullable = false)
    public int getProviderKey() {
        return providerKey;
    }

    public void setProviderKey(int providerKey) {
        this.providerKey = providerKey;
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
    @Column(name = "Address", nullable = false, length = 150)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "Phone", nullable = false, length = 50)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "Contact", nullable = false, length = 150)
    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Provider provider = (Provider) o;
        return providerKey == provider.providerKey &&
                Objects.equals(name, provider.name) &&
                Objects.equals(address, provider.address) &&
                Objects.equals(phone, provider.phone) &&
                Objects.equals(contact, provider.contact);
    }

    @Override
    public int hashCode() {

        return Objects.hash(providerKey, name, address, phone, contact);
    }

    @OneToMany(mappedBy = "providerByProviderKey")
    @JsonIgnore
    public Collection<InventoryInput> getInventoryInputsByProviderKey() {
        return inventoryInputsByProviderKey;
    }

    public void setInventoryInputsByProviderKey(Collection<InventoryInput> inventoryInputsByProviderKey) {
        this.inventoryInputsByProviderKey = inventoryInputsByProviderKey;
    }
}
