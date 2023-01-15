package com.example.BikeShop.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;
import java.util.Date;
import java.util.List;

//Акт заказа
@Entity
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long idCBooking;

    @NotNull(message = "Дата начала работ не должна быть пустой")
    @PastOrPresent(message = "Дата начала работ не может быть будущей")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date dateBegin;

    @FutureOrPresent(message = "Дата конца работ не может быть прошедшей")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date dateEnd;

    @ManyToOne
    @JoinColumn(name = "productId", referencedColumnName = "idProduct")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "statusId", referencedColumnName = "idStatus")
    private Status status;

    @ManyToOne
    @JoinColumn(name = "clientId", referencedColumnName = "idClient")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "employeeId", referencedColumnName = "idEmployee")
    private Employee employee;

    @ManyToMany
    @JoinTable(name = "BookingMalfunction", joinColumns = @JoinColumn(name = "bookingId"), inverseJoinColumns = @JoinColumn(name = "malfunctionId"))
    public List<Malfunction> malfunctionList;

    public Booking() {
    }

    public Booking(Date dateBegin, Date dateEnd, Product product, Status status, Client client, Employee employee) {
        this.dateBegin = dateBegin;
        this.dateEnd = dateEnd;
        this.product = product;
        this.status = status;
        this.client = client;
        this.employee = employee;
    }

    public Long getIdCBooking() {
        return idCBooking;
    }

    public void setIdCBooking(Long idCBooking) {
        this.idCBooking = idCBooking;
    }

    public Date getDateBegin() {
        return dateBegin;
    }

    public void setDateBegin(Date dateBegin) {
        this.dateBegin = dateBegin;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public List<Malfunction> getMalfunctionList() {
        return malfunctionList;
    }

    public void setMalfunctionList(List<Malfunction> malfunctionList) {
        this.malfunctionList = malfunctionList;
    }
}