/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ThinkPro
 */
public class Account {
    private String userName;
    private String password;
    private String displayName;
    private String address;
    private String email;
    private String phone;
    private int roleId;
    private int status;
    private String createDate;
    private String activeCode;

    public Account() {
    }

    public Account(String userName, String password, String displayName, String address, String email, String phone, int roleId, int status, String createDate, String activeCode) {
        this.userName = userName;
        this.password = password;
        this.displayName = displayName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.roleId = roleId;
        this.status = status;
        this.createDate = createDate;
        this.activeCode = activeCode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    @Override
    public String toString() {
        return "Account{" + "userName=" + userName + ", password=" + password + ", displayName=" + displayName + ", address=" + address + ", email=" + email + ", phone=" + phone + ", roleId=" + roleId + ", status=" + status + ", createDate=" + createDate + ", activeCode=" + activeCode + '}';
    }
    
    
}
