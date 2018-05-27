package cn.sheyao.pojo;

public class Medicinecount {
	private int MedicineId;
	private int viewstime;
	public int getMedicineId() {
		return MedicineId;
	}
	public void setMedicineId(int medicineId) {
		MedicineId = medicineId;
	}
	public int getViewstime() {
		return viewstime;
	}
	public void setViewstime(int viewstime) {
		this.viewstime = viewstime;
	}
	public Medicinecount() {
		// TODO Auto-generated constructor stub
	}
	public Medicinecount(int medicineId, int viewstime) {
		super();
		MedicineId = medicineId;
		this.viewstime = viewstime;
	}
	@Override
	public String toString() {
		return "Medicinecount [MedicineId=" + MedicineId + ", viewstime=" + viewstime + "]";
	}
	
	

}
