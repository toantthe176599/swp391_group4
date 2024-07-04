/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author LENOVO
 */
public class InformationUser {

    private String accId, fullName, phone, address, dateOfBirth, accountImg;

    public InformationUser() {
    }

    public InformationUser(String accId, String fullName, String phone, String address, String dateOfBirth, String accountImg) {
        this.accId = accId;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.accountImg = accountImg;
    }

    public String getAccId() {
        return accId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public String getAccountImg() {
        return accountImg;
    }

}
