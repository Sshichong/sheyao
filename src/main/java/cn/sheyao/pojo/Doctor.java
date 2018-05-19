package cn.sheyao.pojo;

public class Doctor {
	
	private int Doctor_ID;
	private String Doctor_name;
	private String Doctor_introduce;
	private String department_info;
	private String Doctor_forSelect;
	private String Doctor_title;
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
	public String getDoctor_introduce() {
		return Doctor_introduce;
	}
	public void setDoctor_introduce(String doctor_introduce) {
		Doctor_introduce = doctor_introduce;
	}
	public String getDepartment_info() {
		return department_info;
	}
	public void setDepartment_info(String department_info) {
		this.department_info = department_info;
	}
	public String getDoctor_forSelect() {
		return Doctor_forSelect;
	}
	public void setDoctor_forSelect(String doctor_forSelect) {
		Doctor_forSelect = doctor_forSelect;
	}
	public String getDoctor_title() {
		return Doctor_title;
	}
	public void setDoctor_title(String doctor_title) {
		Doctor_title = doctor_title;
	}
	public Doctor() {
	
		// TODO Auto-generated constructor stub
	}
	public Doctor(int doctor_ID, String doctor_name, String doctor_introduce, String department_info,
			String doctor_forSelect, String doctor_title) {
		super();
		Doctor_ID = doctor_ID;
		Doctor_name = doctor_name;
		Doctor_introduce = doctor_introduce;
		this.department_info = department_info;
		Doctor_forSelect = doctor_forSelect;
		Doctor_title = doctor_title;
	}
	@Override
	public String toString() {
		return "Doctor [Doctor_ID=" + Doctor_ID + ", Doctor_name=" + Doctor_name + ", Doctor_introduce="
				+ Doctor_introduce + ", department_info=" + department_info + ", Doctor_forSelect=" + Doctor_forSelect
				+ ", Doctor_title=" + Doctor_title + "]";
	}
	
	

}
