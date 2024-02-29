package bbs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.db.DBUtil;
//게시판 관련 crud 수행 => data layer
public class BbsDAO {
	private DataSource ds; // DBUtil.getCon()대신하기 위해 dbcp 호출
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BbsDAO() {
		System.out.println("BbsDAO()생성...");
		try {
			Context ctx =new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//게시글 쓰기 (시퀀스 - BBS_NO_SEQ)
	public int insertBbs(BbsVO vo) throws SQLException{
		try {
			//con = DBUtil.getCon();
			con = ds.getConnection();
			//oracle
			String sql = "INSERT INTO BBS(NO, TITLE, WRITER, CONTENT, WDATE)";
				   sql +=" VALUES(BBS_NO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
				   
			//mysql => 글번호(no) auto_increment
			String sql2 = "INSERT INTO bbs(title, writer, content, wdate)";
				   sql2 +=" VALUES(?,?,?,curdate())";
				   
				   
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getWriter());
			ps.setString(3, vo.getContent());
			
			int n = ps.executeUpdate();
			return n;
		}finally {
			close();
		}
	}
	//게시판 번호 가져오기
	public int callBbsNo() throws SQLException{
		try {
//			con = DBUtil.getCon();
			con=ds.getConnection();
			String sql = "SELECT LAST_NUMBER FROM user_sequences";
				   sql+= " WHERE SEQUENCE_NAME = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "BBS_NO_SEQ");
			rs =ps.executeQuery();
			rs.next();
			int n = rs.getInt("LAST_NUMBER");
			return n;
		}finally {
			close();
		}
	}
	/**게시판 목록 가져오기 - R (SELECT) => 다중행을 반환하는 경우*/
	public ArrayList<BbsVO> selectAll() throws SQLException{
		try {
//			con=DBUtil.getCon();
			con = ds.getConnection();
			//oracle, mysql
			String sql = "SELECT * FROM bbs ORDER BY no desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			return makeList(rs);
		}finally {
			close();
		}
	}//---------------------------
	/**게시판 글 검색 - column값이 [text를 포함 / text인 글] 찾기*/
	public ArrayList<BbsVO> findByText(String col, String text) throws SQLException{
		try {
//			con=DBUtil.getCon();
			con=ds.getConnection();
			String sql;
	        if ("title".equals(col)) {
	            sql = "SELECT * FROM bbs WHERE title LIKE ? ORDER BY no desc";
	            text = '%'+text+'%';
	        } else if ("writer".equals(col)) {
	            sql = "SELECT * FROM bbs WHERE writer LIKE ? ORDER BY no desc";
	        } else {
	            // 예외 처리: 유효하지 않은 컬럼명
	            throw new IllegalArgumentException("유효하지 않은 컬럼명입니다: " + col);
	        }
			ps=con.prepareStatement(sql);			
			ps.setString(1, text);
			rs=ps.executeQuery();
			
			return makeList(rs);
		}finally {
			close();
		}
	}//---------------------------
	/**게시판 글 삭제 - D (Delete)*/
	public int deleteBbs(String num) throws SQLException{
		try {
//			con = DBUtil.getCon();
			con=ds.getConnection();
			String sql = "DELETE FROM BBS WHERE no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			
			int n = ps.executeUpdate();
			return n;
		}finally {
			close();
		}
		
		
	}
	
	private ArrayList<BbsVO> makeList(ResultSet rs) throws SQLException {
		ArrayList<BbsVO> arr = new ArrayList<>();
		while(rs.next()) {
			int no = rs.getInt("no");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String content = rs.getString("content");
			java.sql.Date wdate = rs.getDate("wdate");
			BbsVO record = new BbsVO(no,title,writer,content,wdate);
			arr.add(record);
		}//---while
		
		return arr;
	}
	
	public void close() {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();
			if(rs!=null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
