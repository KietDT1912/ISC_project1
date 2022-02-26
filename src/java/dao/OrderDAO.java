/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import dto.Order;
import dto.Shipping;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author AdMins
 */
public class OrderDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public int addOrderReturnId(Order order) {
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "           ([Customer]\n"
                    + "           ,[shipping_id]\n"
                    + "           ,[total_price]\n"
                    + "           ,[note]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, order.getCustomer());
            ps.setInt(2, order.getShippingId());
            ps.setDouble(3, order.getTotalPrice());
            ps.setString(4, order.getNote());
            ps.setInt(5, order.getStatus());

            if (ps.executeUpdate() != 0) {
                rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
}
