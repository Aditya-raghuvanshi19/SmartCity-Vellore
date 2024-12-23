package com.entity;

public class ServiceDtls {

    private int serviceId;
    private String serviceName;
    private String location;
    private String price;
    private String category;
    private String status;
    private String photoName;
    private String email;
    private String phone;

    public ServiceDtls() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ServiceDtls(String serviceName, String location, String price, String category, String status, String photoName,
            String email, String phone) {
        super();
        this.serviceName = serviceName;
        this.location = location;
        this.price = price;
        this.category = category;
        this.status = status;
        this.photoName = photoName;
        this.email = email;
        this.phone = phone;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    

    @Override
    public String toString() {
        return "ServiceDtls [serviceId=" + serviceId + ", serviceName=" + serviceName + ", location=" + location + ", price=" + price
                + ", category=" + category + ", status=" + status + ", photoName=" + photoName + ", email="
                + email + "]";
    }

}
