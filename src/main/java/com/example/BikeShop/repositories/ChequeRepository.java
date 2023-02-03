package com.example.BikeShop.repositories;

import com.example.BikeShop.models.Cheque;
import com.example.BikeShop.models.ChequeInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;

public interface ChequeRepository extends JpaRepository<Cheque, Long> {

    Iterable<Cheque> findByChequeInfoClientUserUsername(String username);

    Iterable<Cheque> findByChequeInfoDatePrintLessThanAndChequeInfoDatePrintGreaterThan(Date datePrint1, Date datePrint2);
}