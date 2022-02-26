/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import dto.Cart;
import dto.Order;
import dto.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author AdMins
 */
public class OrderDetailDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public int add(ArrayList<Cart> listCart, int orderId) {
        try {
            String sql = "INSERT INTO [dbo].[order_detail]\n"
                    + "           ([order_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[product_name]\n"
                    + "           ,[product_price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[product_image])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);

            int arr[] ={};
            
            for (Cart cart : listCart) {
                ps.setInt(1, orderId);
                ps.setInt(2, cart.getProductId());
                ps.setString(3, cart.getProductName());
                ps.setDouble(4, cart.getProductPrice());
                ps.setInt(5, cart.getQuantity());
                ps.setString(6, cart.getProductImg());
                ps.addBatch();
            }
            arr = ps.executeBatch();

            return arr.length;
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
}
