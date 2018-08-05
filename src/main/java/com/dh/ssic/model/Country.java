package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "countryKey")
public class Country {

    @Column(name = "Code", nullable = false, length = 3)
    private String code;

    @Column(name = "Name", nullable = true, length = 50)
    private String name;

    @Column(name = "CountryKey", nullable = false)
    private int countryKey;

    private Collection<City> citiesByCountryKey;
    private Collection<Currency> currenciesByCountryKey;

    @Basic
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Id
    public int getCountryKey() {
        return countryKey;
    }

    public void setCountryKey(int countryKey) {
        this.countryKey = countryKey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Country country = (Country) o;
        return countryKey == country.countryKey &&
                Objects.equals(code, country.code) &&
                Objects.equals(name, country.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(code, name, countryKey);
    }

    @OneToMany(mappedBy = "countryByCountryKey")
    @JsonIgnore
    public Collection<City> getCitiesByCountryKey() {
        return citiesByCountryKey;
    }

    public void setCitiesByCountryKey(Collection<City> citiesByCountryKey) {
        this.citiesByCountryKey = citiesByCountryKey;
    }

    @OneToMany(mappedBy = "countryByCountryKey")
    @JsonIgnore
    public Collection<Currency> getCurrenciesByCountryKey() {
        return currenciesByCountryKey;
    }

    public void setCurrenciesByCountryKey(Collection<Currency> currenciesByCountryKey) {
        this.currenciesByCountryKey = currenciesByCountryKey;
    }
}
