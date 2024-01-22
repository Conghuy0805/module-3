package com.example.ss9.model;

public class Classroom {

    private Integer codeClass;
    private String nameClass;

    public Classroom() {
    }

    public Classroom(Integer codeClass, String nameClass) {
        this.codeClass = codeClass;
        this.nameClass = nameClass;
    }

    public Integer getCodeClass() {
        return codeClass;
    }

    public void setCodeClass(Integer codeClass) {
        this.codeClass = codeClass;
    }

    public String getNameClass() {
        return nameClass;
    }

    public void setNameClass(String nameClass) {
        this.nameClass = nameClass;
    }
}
