package com.address;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class AddressDAO {
    private static AddressDAO instance = new AddressDAO();

    public static AddressDAO getInstance() {
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env"); // 톰캣의 기본 폴더
        DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); // 내가 정하는 이름
        return ds.getConnection();
    }

    //추가
    public void addrInsert(Address ad) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;
        try {
            con = getConnection();


            String sql = "insert into address values(address_seq.nextval, ?, ?, ?, ?)";
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

    // 전체보기
    public ArrayList<Address> addrList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<Address> arr = new ArrayList<>();

        try {
            con = getConnection();
            String sql = "select * from address";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Address ad = new Address();
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

    // 닫기 메소드
    private void closeConnection(Connection con, PreparedStatement ps, Statement st, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
//    수정

//    삭제

//    상세보기
}
