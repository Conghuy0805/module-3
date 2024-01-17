package com.example.product_management_application.repository;

import com.example.product_management_application.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Bánh ChocoPie", 55000, "Một loại bánh ngọt bao gồm hai lớp vỏ bánh có phủ sô cô la cùng với nhân marshmallow được kẹp ở giữa", "Orion"));
        products.add(new Product(2, "Kẹo socola Mỹ", 100000, "Hương vị thơm ngon, vừa ăn, không quá ngọt và không khiến người dùng thấy ngấy", "Mars Wrigley"));
        products.add(new Product(3, "Mứt rong biển", 189000, "Thuộc loại siêu thực phẩm cao cấp rất giàu dinh dưỡng", "Biển Nha Trang - Khánh Hòa"));
        products.add(new Product(4, "Sữa chua Vinamilk", 50000, "Sản phẩm được lên men hoàn toàn tự nhiên từ dòng sữa tươi nguyên chất, thơm ngon và không sử dụng chất bảo quản", "Nhà máy sữa Trường Thọ"));
        products.add(new Product(5, "Hạt dẻ", 200000, "Khá to và tròn, vỏ hạt hơi mỏng và có màu nâu bóng", "Nhà máy sản xuất của Huỳnh Gia"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public int getLastId() {
        return products.get(products.size() - 1).getId();
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public Product findById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                products.set(i, product);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i <products.size() ; i++) {
            if (products.get(i).getId()==id){
                products.remove(products.get(i));
            }
        }
    }
}
