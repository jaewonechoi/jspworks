package board;

import java.io.Serializable;
import java.sql.Timestamp;

public class Board implements Serializable{

	private static final long serialVersionUID = 124L;
	private int bno;
	private String btitle;
	private String bcontent;
	private Timestamp createdate;
	private Timestamp bupdate;
	private String uid;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Timestamp getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}
	public Timestamp getBupdate() {
		return bupdate;
	}
	public void setBupdate(Timestamp bupdate) {
		this.bupdate = bupdate;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
}
