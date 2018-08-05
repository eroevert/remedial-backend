package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "currencyKey")
public class Currency {
    private int currencyKey;
    private Integer countryKey;
    private String name;
    private String code;
    private String status;
    private Country countryByCountryKey;
    private Collection<SalaryScale> salaryScalesByCurrencyKey;

    @Id
    @Column(name = "CurrencyKey", nullable = false)
    public int getCurrencyKey() {
        return currencyKey;
    }

    public void setCurrencyKey(int currencyKey) {
        this.currencyKey = currencyKey;
    }

    @Basic
    @Column(name = "CountryKey", nullable = true)
    public Integer getCountryKey() {
        return countryKey;
    }

    public void setCountryKey(Integer countryKey) {
        this.countryKey = countryKey;
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
    @Column(name = "Code", nullable = false, length = 50)
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Currency currency = (Currency) o;
        return currencyKey == currency.currencyKey &&
                Objects.equals(countryKey, currency.countryKey) &&
                Objects.equals(name, currency.name) &&
                Objects.equals(code, currency.code) &&
                Objects.equals(status, currency.status);
    }

    @Override
    public int hashCode() {

        return Objects.hash(currencyKey, countryKey, name, code, status);
    }

    @ManyToOne
    @JoinColumn(name = "CountryKey", referencedColumnName = "CountryKey", insertable=false, updatable=false)
    public Country getCountryByCountryKey() {
        return countryByCountryKey;
    }

    public void setCountryByCountryKey(Country countryByCountryKey) {
        this.countryByCountryKey = countryByCountryKey;
    }

    @OneToMany(mappedBy = "currencyByCurrencyKey")
    @JsonIgnore
    public Collection<SalaryScale> getSalaryScalesByCurrencyKey() {
        return salaryScalesByCurrencyKey;
    }

    public void setSalaryScalesByCurrencyKey(Collection<SalaryScale> salaryScalesByCurrencyKey) {
        this.salaryScalesByCurrencyKey = salaryScalesByCurrencyKey;
    }
}
