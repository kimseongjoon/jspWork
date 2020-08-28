package com.member.dao;

import com.member.dto.MemberDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class MemberDAOimpl implements MemberDAO {

    private static MemberDAOimpl instance = new MemberDAOimpl();

    public static MemberDAOimpl getInstance() {
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env"); // 톰캣의 기본 폴더
        DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); // 내가 정하는 이름
        return ds.getConnection();
    }

    @Override
    public void memberInsert(MemberDTO member) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;

        try {
            con = getConnection();

            String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql); // 쿼리 실행하는 객체(문자열을 처리할때 statment객체 보다 조금더 편리)
            ps.setString(1, member.getName());
            ps.setString(2, member.getUserid());
            ps.setString(3, member.getPwd());
            ps.setString(4, member.getEmail());
            ps.setString(5, member.getPhone());
            ps.setInt(6, member.getAdmin());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, null, null);
        }
    }

    @Override
    public ArrayList<MemberDTO> memberList() {
        return memberList("", "");
    }

    public ArrayList<MemberDTO> memberList(String field, String word) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ArrayList<MemberDTO> arr = new ArrayList<>();
        String sql = "";

        try {
            con = getConnection();

            if (word.equals("")) {
                sql = "SELECT * FROM MEMBER";
            } else {
                sql = "SELECT * FROM MEMBER WHERE " + field + " LIKE '%" + word + "%'";
            }
            System.out.println("memberList -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                MemberDTO md = new MemberDTO();

                md.setName(rs.getString("NAME"));
                md.setUserid(rs.getString("USERID"));
                md.setPwd(rs.getString("PWD"));
                md.setEmail(rs.getString("EMAIL"));
                md.setPhone(rs.getString("PHONE"));
                md.setAdmin(rs.getInt("ADMIN"));

                arr.add(md);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return arr;
    }

    @Override
    public int memeberUpdate(MemberDTO member) {
        Connection con = null; // 디비 연결하는 객체
        PreparedStatement ps = null;
        try {
            con = getConnection();

            String sql = "UPDATE MEMBER SET NAME=?, PWD=?, EMAIL=?, PHONE=?, ADMIN=? WHERE USERID=?";
            System.out.println("memeberUpdate -> " + sql);

            ps = con.prepareStatement(sql); // 쿼리 실행하는 객체(문자열을 처리할때 statment객체 보다 조금더 편리)
            ps.setString(1, member.getName());
            ps.setString(2, member.getPwd());
            ps.setString(3, member.getEmail());
            ps.setString(4, member.getPhone());
            ps.setInt(5, member.getAdmin());
            ps.setString(5, member.getUserid());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, null, null);
        }

        return 0;
    }

    @Override
    public MemberDTO findById(String userid) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        MemberDTO md = null;

        try {
            con = getConnection();

            String sql = "SELECT * FROM MEMBER WHERE USERID = " + userid;
            System.out.println("findById -> " + sql);

            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                md = new MemberDTO();

                md.setName(rs.getString("NAME"));
                md.setUserid(rs.getString("USERID"));
                md.setPwd(rs.getString("PWD"));
                md.setEmail(rs.getString("EMAIL"));
                md.setPhone(rs.getString("PHONE"));
                md.setAdmin(rs.getInt("ADMIN"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, rs);
        }

        return md;
    }

    @Override
    public void memberDelete(String userid) {
        Connection con = null;
        Statement st = null;

        try {
            con = getConnection();

            String sql = "DELETE FROM MEMBER WHERE USERID='" + userid + "'";
            System.out.println("memberDelete -> " + sql);

            st = con.createStatement();
            st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con, null, st, null);
        }
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
}
