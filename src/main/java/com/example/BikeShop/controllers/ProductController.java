package com.example.BikeShop.controllers;

import com.example.BikeShop.models.Product;
import com.example.BikeShop.repositories.*;
import com.example.BikeShop.services.ProductImageService;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@PreAuthorize("hasAnyAuthority('MERCHANDISER') or hasAnyAuthority('DIRCTOR')")
@RequestMapping("/product")
@Controller
public class ProductController {

    private final ProductRepository productRepository;

    private final ImageRepository imageRepository;

    private final CategoryRepository categoryRepository;

    private final ColorRepository colorRepository;

    private final StorageRepository storageRepository;

    private final SupplierRepository supplierRepository;

    private final ProductImageService productImageService;

    public ProductController(ProductRepository productRepository, ImageRepository imageRepository,
                             CategoryRepository categoryRepository, ColorRepository colorRepository,
                             StorageRepository storageRepository, SupplierRepository supplierRepository,
                             ProductImageService productImageService) {
        this.productRepository = productRepository;
        this.imageRepository = imageRepository;
        this.categoryRepository = categoryRepository;
        this.colorRepository = colorRepository;
        this.storageRepository = storageRepository;
        this.supplierRepository = supplierRepository;
        this.productImageService = productImageService;
    }

    @GetMapping("index")
    public String productIndex(Model model) {
        model.addAttribute("products", productRepository.findAll());
        return "product/Index";
    }

    @GetMapping("search")
    public String productSearch(@RequestParam(required = false) String name, Model model) {
        Iterable<Product> products;
        if (name != null && !name.equals(""))
            products = productRepository.findByNameContains(name);
        else
            products = productRepository.findAll();
        model.addAttribute("products", products);
        return "product/Index";
    }

    @GetMapping("sort")
    public String productSort(@RequestParam String sortProperty, @RequestParam boolean sortType, Model model) {
        Iterable<Product> products;
        if (sortType)
            products = productRepository.findAll(Sort.by(sortProperty).ascending());
        else
            products = productRepository.findAll(Sort.by(sortProperty).descending());
        model.addAttribute("products", products);
        return "product/Index";
    }

}
