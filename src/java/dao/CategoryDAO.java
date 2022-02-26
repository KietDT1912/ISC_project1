/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import dto.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author AdMins
 */
public class CategoryDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public ArrayList<Category> getAll() {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[category]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[category]";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            ArrayList<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
