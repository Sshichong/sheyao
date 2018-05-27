package cn.sheyao.pojo;

public class Doctorcount {
	
	private int DoctorId;
	private int viewstime;
	public int getDoctorId() {
		return DoctorId;
	}
	public void setDoctorId(int doctorId) {
		DoctorId = doctorId;
	}
	public int getViewstime() {
		return viewstime;
	}
	public void setViewstime(int viewstime) {
		this.viewstime = viewstime;
	}
	public Doctorcount() {
		
		// TODO Auto-generated constructor stub
	}
	public Doctorcount(int doctorId, int viewstime) {
		super();
		DoctorId = doctorId;
		this.viewstime = viewstime;
	}
	@Override
	public String toString() {
		return "Doctorcount [DoctorId=" + DoctorId + ", viewstime=" + viewstime + "]";
	}
	
	
	

}
