package com.dh.ssic.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

@Entity
@JsonIdentityInfo( generator = ObjectIdGenerators.PropertyGenerator.class, property = "salaryScaleKey")
public class SalaryScale {
    private int salaryScaleKey;
    private int currencyKey;
    private String name;
    private Integer numberCases;
    private BigDecimal basicSalary;
    private String status;
    private String start;
    private String end;
    private Collection<Item> itemsBySalaryScaleKey;
    private Currency currencyByCurrencyKey;

    @Id
    @Column(name = "SalaryScaleKey", nullable = false)
    public int getSalaryScaleKey() {
        return salaryScaleKey;
    }

    public void setSalaryScaleKey(int salaryScaleKey) {
        this.salaryScaleKey = salaryScaleKey;
    }

    @Basic
    @Column(name = "CurrencyKey", nullable = false)
    public int getCurrencyKey() {
        return currencyKey;
    }

    public void setCurrencyKey(int currencyKey) {
        this.currencyKey = currencyKey;
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
    @Column(name = "NumberCases", nullable = true)
    public Integer getNumberCases() {
        return numberCases;
    }

    public void setNumberCases(Integer numberCases) {
        this.numberCases = numberCases;
    }

    @Basic
    @Column(name = "BasicSalary", nullable = false, precision = 2)
    public BigDecimal getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(BigDecimal basicSalary) {
        this.basicSalary = basicSalary;
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
    @Column(name = "Start", nullable = true, length = 25)
    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    @Basic
    @Column(name = "End", nullable = true, length = 25)
    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SalaryScale that = (SalaryScale) o;
        return salaryScaleKey == that.salaryScaleKey &&
                currencyKey == that.currencyKey &&
                Objects.equals(name, that.name) &&
                Objects.equals(numberCases, that.numberCases) &&
                Objects.equals(basicSalary, that.basicSalary) &&
                Objects.equals(status, that.status) &&
                Objects.equals(start, that.start) &&
                Objects.equals(end, that.end);
    }

    @Override
    public int hashCode() {

        return Objects.hash(salaryScaleKey, currencyKey, name, numberCases, basicSalary, status, start, end);
    }

    @OneToMany(mappedBy = "salaryScaleBySalaryScaleKey", fetch = FetchType.EAGER)
    @JsonIgnore
    public Collection<Item> getItemsBySalaryScaleKey() {
        return itemsBySalaryScaleKey;
    }

    public void setItemsBySalaryScaleKey(Collection<Item> itemsBySalaryScaleKey) {
        this.itemsBySalaryScaleKey = itemsBySalaryScaleKey;
    }

    @ManyToOne
    @JoinColumn(name = "CurrencyKey", referencedColumnName = "CurrencyKey", nullable = false, insertable=false, updatable=false)
    public Currency getCurrencyByCurrencyKey() {
        return currencyByCurrencyKey;
    }

    public void setCurrencyByCurrencyKey(Currency currencyByCurrencyKey) {
        this.currencyByCurrencyKey = currencyByCurrencyKey;
    }
}
