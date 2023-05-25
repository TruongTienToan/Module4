package com.example.banking_transaction.model;

import java.text.DecimalFormat;

public class Customer {
    private String full_name;
    private double balance;

    public Customer() {

    }

    public Customer(String full_name) {
        this.full_name = full_name;
        this.balance = 0;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public void deposit(double amount) {
        balance += amount;
    }

    public boolean withdraw(double amount) {
        if (balance >= amount) {
            balance -= amount;
            return true;
        }
        return false;
    }

    public boolean transfer(Customer recipient, double amount) {
        if (withdraw(amount)) {
            recipient.deposit(amount);
            return true;
        }
        return false;
    }
}
