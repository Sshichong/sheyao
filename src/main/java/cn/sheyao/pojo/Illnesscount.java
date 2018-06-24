package cn.sheyao.pojo;

public class Illnesscount {
	private int IllnessId;
	private int viewstime;
	public int getIllnessId() {
		return IllnessId;
	}
	public void setIllnessId(int illnessId) {
		IllnessId = illnessId;
	}
	public int getViewstime() {
		return viewstime;
	}
	public void setViewstime(int viewstime) {
		this.viewstime = viewstime;
	}
	public Illnesscount() {
		
		// TODO Auto-generated constructor stub
	}
	public Illnesscount(int illnessId, int viewstime) {
		super();
		IllnessId = illnessId;
		this.viewstime = viewstime;
	}
	@Override
	public String toString() {
		return "Illnesscount [IllnessId=" + IllnessId + ", viewstime=" + viewstime + "]";
	}
	
	

}
