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

    // 전체보기
    public ArrayList<Address> addrList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<Address> arr = new ArrayList<>();

        try {
            con = getConnection();
            String sql = "SELECT * FROM ADDRESS ORDER BY NUM";
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

    // 회원수
    public int addrCount() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        int count = 0;

        try {
            con = getConnection();
            String sql = "SELECT count(*) FROM ADDRESS ORDER BY NUM";
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

    // 상세보기
    public Address addrView(int num) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        Address ad = null;

        try {
            con = getConnection();
            String sql = "SELECT * FROM ADDRESS WHERE NUM = " + num;
            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                ad = new Address();

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

    // 수정
    public void addrUpdate(Address ad) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;
        try {
            con = getConnection();

            String sql = "UPDATE ADDRESS SET NAME=?, TEL=?, ZIPCODE=?, ADDR=? WHERE NUM=?";
            ps = con.prepareStatement(sql); // 쿼리 실행하는 객체(문자열을 처리할때 statment객체 보다 조금더 편리)
            ps.setString(1, ad.getName());
            ps.setString(2, ad.getTel());
            ps.setString(3, ad.getZipcode());
            ps.setString(4, ad.getAddr());
            ps.setInt(5, ad.getNum());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, null, null);
        }
    }

    // 삭제
    public void addrDelete(int num) {
        Connection con = null;
        Statement st = null;

        try {
            con = getConnection();
            String sql = "DELETE FROM ADDRESS WHERE NUM=" + num;
            st = con.createStatement();
            st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, null);
        }

    }

    // 우편번호 검색
    public ArrayList<ZipCodeDTO> zipcodeRead(String dong) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        Address ad = null;
        ArrayList<ZipCodeDTO> zipArr = new ArrayList<>();

        try {
            con = getConnection();
            String sql = "SELECT * FROM ZIPCODE WHERE DONG LIKE '%" + dong + "%'";
            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                ZipCodeDTO zip = new ZipCodeDTO();

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
}
