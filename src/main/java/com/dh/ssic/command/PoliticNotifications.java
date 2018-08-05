package com.dh.ssic.command;

import com.dh.ssic.model.Politics;

import java.util.List;

public class PoliticNotifications {
    private Politics politic;
    private List<Integer> organizations;
    private Integer createById;

    public Politics getPolitic() {
        return politic;
    }

    public void setPolitic(Politics politic) {
        this.politic = politic;
    }

    public List<Integer> getOrganizations() {
        return organizations;
    }

    public void setOrganizations(List<Integer> organizations) {
        this.organizations = organizations;
    }

    public Integer getCreateById() {
        return createById;
    }

    public void setCreateById(Integer createById) {
        this.createById = createById;
    }
}
