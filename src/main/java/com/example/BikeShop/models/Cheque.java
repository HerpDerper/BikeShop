package com.example.BikeShop.models;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

//Чек
@Entity
public class Cheque {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idCheque;

    @Min(value = 0, message = "Количество товара должно быть больше или равно 0")
    @NotNull(message = "Количество товара не должно быть пустым")
    private int productCount;

    @ManyToOne
    @JoinColumn(name = "productId", referencedColumnName = "idProduct")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "chequeInfoId", referencedColumnName = "idChequeInfo")
    private ChequeInfo chequeInfo;

    public Cheque() {
    }

    public Cheque(int productCount, Product product, ChequeInfo chequeInfo) {
        this.productCount = productCount;
        this.product = product;
        this.chequeInfo = chequeInfo;
    }

    public Long getIdCheque() {
        return idCheque;
    }

    public void setIdCheque(Long idCheque) {
        this.idCheque = idCheque;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ChequeInfo getChequeInfo() {
        return chequeInfo;
    }

    public void setChequeInfo(ChequeInfo chequeInfo) {
        this.chequeInfo = chequeInfo;
    }
}