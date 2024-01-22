package com.example.ss9.dto;

public class StudentDTO {
    private int code;
    private String nameStudent;
    private Double point;
    private String idCard;

    private String nameClass;

    public StudentDTO() {
    }

    public StudentDTO(int code, String nameStudent, Double point, String idCard, String nameClass) {
        this.code = code;
        this.nameStudent = nameStudent;
        this.point = point;
        this.idCard = idCard;
        this.nameClass = nameClass;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent;
    }

    public Double getPoint() {
        return point;
    }

    public void setPoint(Double point) {
        this.point = point;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getNameClass() {
        return nameClass;
    }

    public void setNameClass(String nameClass) {
        this.nameClass = nameClass;
    }
}
