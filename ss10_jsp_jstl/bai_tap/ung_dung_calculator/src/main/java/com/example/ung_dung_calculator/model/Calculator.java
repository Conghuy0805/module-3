package com.example.ung_dung_calculator.model;

public class Calculator {
    public static double calculate(double num1, double num2, String operator) throws ArithmeticException {
        double result;

        switch (operator) {
            case "+":
                result = num1 + num2;
                break;
            case "-":
                result = num1 - num2;
                break;
            case "*":
                result = num1 * num2;
                break;
            case "/":
                if (num2 == 0) {
                    throw new ArithmeticException("Divisor cannot be zero");
                }
                result = num1 / num2;
                break;
            default:
                throw new IllegalArgumentException("Invalid operator");
        }

        return result;
    }
}
