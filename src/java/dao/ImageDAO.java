/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import dto.Category;
import dto.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author AdMins
 */
public class ImageDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public ArrayList<Image> getImagesByProductId(int id) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[productId]\n"
                    + "      ,[image_url]\n"
                    + "  FROM [dbo].[image]\n"
                    + "  WHERE productId = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            ArrayList<Image> list = new ArrayList<>();
            while (rs.next()) {
                Image i = new Image(rs.getInt(1), rs.getInt(2), rs.getString(3));
                list.add(i);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
