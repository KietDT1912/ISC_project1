/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import dto.Category;
import dto.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author AdMins
 */
public class ProductDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public ArrayList<Product> getAllPaging(int pageIndex, int pageSize) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[category_id]\n"
                    + "      ,[code]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[image]\n"
                    + "      ,[create_date]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[product]\n"
                    + "  Order by id \n"
                    + "  OFFSET (?*?-?) \n"
                    + "  ROWS FETCH NEXT ? ROWS ONLY";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product pro = new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getInt(10));
                list.add(pro);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countPage(int pageSize) {
        try {
            String sql = "SELECT COUNT (*) FROM [dbo].[product]";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if ((count / pageSize) != 0) {
                numOfPage = numOfPage + 1;
            }
            return numOfPage;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public ArrayList<Product> getProductByCategoryId(int categoryId, int pageIndex, int pageSize) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[category_id]\n"
                    + "      ,[code]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[image]\n"
                    + "      ,[create_date]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[product] WHERE category_id = ? ORDER BY id\n"
                    + "  OFFSET (?*?-?) \n"
                    + "  ROWS FETCH NEXT ? ROWS ONLY";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product pro = new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getInt(10));
                list.add(pro);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int countPageWhenFilterCategory(int categoryId, int pageSize) {
        try {
            String sql = "SELECT COUNT (*) FROM [dbo].[product] where category_id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if ((count / pageSize) != 0) {
                numOfPage = numOfPage + 1;
            }
            return numOfPage;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public Product getProducById(int productId) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[category_id]\n"
                    + "      ,[code]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[image]\n"
                    + "      ,[create_date]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[product]\n"
                    + "  Where id = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product pro = new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getInt(10));
                return pro;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
