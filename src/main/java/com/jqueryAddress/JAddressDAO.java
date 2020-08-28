package com.jqueryAddress;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class JAddressDAO {
    private static JAddressDAO instance = new JAddressDAO();

    public static JAddressDAO getInstance() {
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env"); // 톰캣의 기본 폴더
        DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); // 내가 정하는 이름
        return ds.getConnection();
    }

    public ArrayList<ZipCodeVO> getZipcode(String dong) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<ZipCodeVO> zipArr = new ArrayList<>();

        try {
            con = getConnection();

            String sql = "SELECT * FROM ZIPCODE WHERE DONG LIKE '%" + dong + "%'";

            System.out.println("JAddressDAO -> getZipcode -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                ZipCodeVO zip = new ZipCodeVO();

                zip.setBunji(rs.getString("bunji"));
                zip.setDong(rs.getString("dong"));
                zip.setGugun(rs.getString("gugun"));
                zip.setSeq(rs.getInt("seq"));
                zip.setSido(rs.getString("sido"));
                zip.setZipcode(rs.getString("zipcode"));

                zipArr.add(zip);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return zipArr;
    }

    public ArrayList<AddressVO> getSearchList(String field, String word) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<AddressVO> arr = new ArrayList<>();
        String sql = "";

        try {
            con = getConnection();

            sql = "SELECT * FROM ADDRESS WHERE " + field + " LIKE '%" + word + "%' ORDER BY NUM";

            System.out.println("JAddressDAO -> getSearchList -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                AddressVO ad = new AddressVO();

                ad.setAddr(rs.getString("addr"));
                ad.setName(rs.getString("name"));
                ad.setNum(rs.getInt("num"));
                ad.setTel(rs.getString("tel"));
                ad.setZipcode(rs.getString("zipcode"));

                arr.add(ad);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return arr;
    }


    public int getSearchCount(String field, String word) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "";
        int count = 0;

        try {
            con = getConnection();

            sql = "SELECT count(*) FROM ADDRESS WHERE " + field + " LIKE '%" + word + "%' ORDER BY NUM";

            System.out.println("JAddressDAO -> getSearchCount -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return count;
    }

    public ArrayList<AddressVO> addrList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<AddressVO> arr = new ArrayList<>();
        String sql = "";

        try {
            con = getConnection();

            sql = "SELECT * FROM ADDRESS ORDER BY NUM";

            System.out.println("JAddressDAO -> addrList -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                AddressVO ad = new AddressVO();

                ad.setAddr(rs.getString("addr"));
                ad.setName(rs.getString("name"));
                ad.setNum(rs.getInt("num"));
                ad.setTel(rs.getString("tel"));
                ad.setZipcode(rs.getString("zipcode"));

                arr.add(ad);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return arr;
    }

    public int addrCount() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "";
        int count = 0;

        try {
            con = getConnection();

            sql = "SELECT count(*) FROM ADDRESS ORDER BY NUM";

            System.out.println("JAddressDAO -> addrCount -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return count;
    }

    private void closeConnection(Connection con, Statement ps, Statement st, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public AddressVO adressDetail(int num) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        AddressVO ad = null;

        try {
            con = getConnection();
            String sql = "SELECT * FROM ADDRESS WHERE NUM = " + num;
            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                ad = new AddressVO();

                ad.setAddr(rs.getString("addr"));
                ad.setName(rs.getString("name"));
                ad.setNum(rs.getInt("num"));
                ad.setTel(rs.getString("tel"));
                ad.setZipcode(rs.getString("zipcode"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return ad;
    }

    public void addressInsert(AddressVO ad) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;

        try {
            con = getConnection();

            String sql = "INSERT INTO ADDRESS VALUES(ADDRESS_SEQ.NEXTVAL, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql); // 쿼리 실행하는 객체(문자열을 처리할때 statment객체 보다 조금더 편리)
            ps.setString(1, ad.getName());
            ps.setString(2, ad.getTel());
            ps.setString(3, ad.getZipcode());
            ps.setString(4, ad.getAddr());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, null, null);
        }
    }
}
