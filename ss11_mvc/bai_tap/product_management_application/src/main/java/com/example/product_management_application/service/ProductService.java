package com.example.product_management_application.service;

import com.example.product_management_application.model.Product;
import com.example.product_management_application.repository.IProductRepository;
import com.example.product_management_application.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private static final IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return iProductRepository.findAll();
    }

    @Override
    public int getLastId() {
        return iProductRepository.getLastId();
    }

    @Override
    public void save(Product product) {
        iProductRepository.save(product);
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id,product);
    }

    @Override
    public void remove(int id) {
        iProductRepository.remove(id);
    }
}
