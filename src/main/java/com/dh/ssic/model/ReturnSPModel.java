package com.dh.ssic.model;

import java.math.BigDecimal;

public class ReturnSPModel {
    private int code;
    private String message;

    public ReturnSPModel() {
    }
    public ReturnSPModel(Object[] item) {
        if(item.length>=3) {
            this.setCode((Integer) item[0]);
            this.setRowKey(item[1].toString());
            this.setMessage(item[2].toString());
        }else{
            this.setCode((Integer) item[0]);
        }
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRowKey() {
        return rowKey;
    }

    public void setRowKey(String rowKey) {
        this.rowKey = rowKey;
    }

    private String rowKey;
}
