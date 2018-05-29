package cn.sheyao.pojo;

public class Doctor1 {
	
	private int Doctor_ID;
	private String Doctor_name;
	private String Doctor_Birth;
	private String Doctor_department;
	private String Doctor_introduce;
	private String Doctor_Pic;
	private String Doctor_Date;
	private String Doctor_DelectReason;
	private String Doctor_State;
	private String Doctor_forSelect;
	public int getDoctor_ID() {
		return Doctor_ID;
	}
	public void setDoctor_ID(int doctor_ID) {
		Doctor_ID = doctor_ID;
	}
	public String getDoctor_name() {
		return Doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		Doctor_name = doctor_name;
	}
	public String getDoctor_Birth() {
		return Doctor_Birth;
	}
	public void setDoctor_Birth(String doctor_Birth) {
		Doctor_Birth = doctor_Birth;
	}
	public String getDoctor_department() {
		return Doctor_department;
	}
	public void setDoctor_department(String doctor_department) {
		Doctor_department = doctor_department;
	}
	public String getDoctor_introduce() {
		return Doctor_introduce;
	}
	public void setDoctor_introduce(String doctor_introduce) {
		Doctor_introduce = doctor_introduce;
	}
	public String getDoctor_Pic() {
		return Doctor_Pic;
	}
	public void setDoctor_Pic(String doctor_Pic) {
		Doctor_Pic = doctor_Pic;
	}
	public String getDoctor_Date() {
		return Doctor_Date;
	}
	public void setDoctor_Date(String doctor_Date) {
		Doctor_Date = doctor_Date;
	}
	public String getDoctor_DelectReason() {
		return Doctor_DelectReason;
	}
	public void setDoctor_DelectReason(String doctor_DelectReason) {
		Doctor_DelectReason = doctor_DelectReason;
	}
	public String getDoctor_State() {
		return Doctor_State;
	}
	public void setDoctor_State(String doctor_State) {
		Doctor_State = doctor_State;
	}
	public String getDoctor_forSelect() {
		return Doctor_forSelect;
	}
	public void setDoctor_forSelect(String doctor_forSelect) {
		Doctor_forSelect = doctor_forSelect;
	}
	public Doctor1() {
		
		// TODO Auto-generated constructor stub
	}
	public Doctor1(int doctor_ID, String doctor_name, String doctor_Birth, String doctor_department,
			String doctor_introduce, String doctor_Pic, String doctor_Date, String doctor_DelectReason,
			String doctor_State, String doctor_forSelect) {
		super();
		Doctor_ID = doctor_ID;
		Doctor_name = doctor_name;
		Doctor_Birth = doctor_Birth;
		Doctor_department = doctor_department;
		Doctor_introduce = doctor_introduce;
		Doctor_Pic = doctor_Pic;
		Doctor_Date = doctor_Date;
		Doctor_DelectReason = doctor_DelectReason;
		Doctor_State = doctor_State;
		Doctor_forSelect = doctor_forSelect;
	}
	@Override
	public String toString() {
		return "doctor1 [Doctor_ID=" + Doctor_ID + ", Doctor_name=" + Doctor_name + ", Doctor_Birth=" + Doctor_Birth
				+ ", Doctor_department=" + Doctor_department + ", Doctor_introduce=" + Doctor_introduce
				+ ", Doctor_Pic=" + Doctor_Pic + ", Doctor_Date=" + Doctor_Date + ", Doctor_DelectReason="
				+ Doctor_DelectReason + ", Doctor_State=" + Doctor_State + ", Doctor_forSelect=" + Doctor_forSelect
				+ "]";
	}
	
	
	

}
