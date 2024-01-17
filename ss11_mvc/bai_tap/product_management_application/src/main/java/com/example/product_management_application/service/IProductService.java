package com.example.product_management_application.service;

import com.example.product_management_application.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    int getLastId();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}
