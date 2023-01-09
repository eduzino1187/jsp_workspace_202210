package gallery.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import gallery.domain.Gallery;
import gallery.pool.PoolManager;

//Gallery 테이블에 대한 CRUD만을 수행 
public class GalleryDAO {
	PoolManager pool=PoolManager.getInstance();
	
	public int insert(Gallery gallery) {
		int result=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		con=pool.getConnection(); //대여
		
		String sql="insert into gallery(gallery_idx, title, writer,content, filename)";
		sql+=" values(seq_gallery.nextval, ?,?,?,?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, gallery.getTitle());
			pstmt.setString(2, gallery.getWriter());
			pstmt.setString(3, gallery.getContent());
			pstmt.setString(4, gallery.getFilename());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			pool.release(con, pstmt);
		}
		return result;
	}
}




