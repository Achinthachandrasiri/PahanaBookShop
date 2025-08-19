package com.bookshop.model;

public class Product {
    private String name;
    private String code;
    private String brand;
    private double cost;
    private double price;
    private double discount;
    private int quantity;
    private String category;
    private String image; // URL or file path of the product image

    public Product() {
    }

    public Product(String name, String code, String brand, double cost, double price, double discount,
                   int quantity, String category, String image) {
        this.name = name;
        this.code = code;
        this.brand = brand;
        this.cost = cost;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.category = category;
        this.image = image;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // Optional: toString method
    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", brand='" + brand + '\'' +
                ", cost=" + cost +
                ", price=" + price +
                ", discount=" + discount +
                ", quantity=" + quantity +
                ", category='" + category + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
