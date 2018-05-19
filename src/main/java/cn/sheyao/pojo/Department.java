package cn.sheyao.pojo;

public class Department {

	private int department_id;
	private String department_info;
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_info() {
		return department_info;
	}
	public void setDepartment_info(String department_info) {
		this.department_info = department_info;
	}
	public Department() {
		
		// TODO Auto-generated constructor stub
	}
	public Department(int department_id, String department_info) {
		super();
		this.department_id = department_id;
		this.department_info = department_info;
	}
	
	
	
	
}
