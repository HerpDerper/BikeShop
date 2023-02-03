package com.example.BikeShop.controllers;

import com.example.BikeShop.models.Cheque;
import com.example.BikeShop.models.Product;
import com.example.BikeShop.repositories.ChequeRepository;
import com.example.BikeShop.repositories.ProductRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@PreAuthorize("hasAnyAuthority('SALES_DEP') or hasAnyAuthority('DIRECTOR')")
@RequestMapping("/report")
@Controller
public class ReportController {

    private final ChequeRepository chequeRepository;

    private final ProductRepository productRepository;

    public ReportController(ChequeRepository chequeRepository, ProductRepository productRepository) {
        this.chequeRepository = chequeRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/index")
    public String reportIndex(Model model) {
        model.addAttribute("products",
                getProductList(productRepository.findAll(), chequeRepository.findAll()));
        model.addAttribute("cheques", getChequeList(chequeRepository.findAll()));
        return "report/Index";
    }

    private static List<String> getChequeList(List<Cheque> cheques) {
        List<String> productNames = new ArrayList<>();
        for (var cheque : cheques) {
            productNames.add(cheque.getProduct().getName());
        }
        return productNames;
    }

    private static List<Double> getProductList(List<Product> products, List<Cheque> cheques) {
        List<Double> soldProducts = new ArrayList<>();
        for (var product : products) {
            double allSales = 0;
            for (var cheque : cheques) {
                if (product == cheque.getProduct())
                    allSales += (double) cheque.getCount() * product.getPrice();
            }
            soldProducts.add(allSales);
        }
        return soldProducts;
    }
}
