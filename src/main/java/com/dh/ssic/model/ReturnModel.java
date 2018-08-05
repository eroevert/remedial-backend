package com.dh.ssic.model;

public class ReturnModel<T> {
    private int code;
    private String message;
    private T Object;

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

    public T getObject() {
        return Object;
    }

    public void setObject(T object) {
        Object = object;
    }
}
