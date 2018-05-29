package cn.sheyao.pojo;

public class Illness {
	private int 	Illness_ID;//病症分类ID
	private String Illness_name;//病症名字
	private String Illness_admin;//病症大类
	private String  Illness_remark;//病症备注
	private String Illness_State;//病症状态
	public int getIllness_ID() {
		return Illness_ID;
	}
	public void setIllness_ID(int illness_ID) {
		Illness_ID = illness_ID;
	}
	public String getIllness_name() {
		return Illness_name;
	}
	public void setIllness_name(String illness_name) {
		Illness_name = illness_name;
	}
	public String getIllness_admin() {
		return Illness_admin;
	}
	public void setIllness_admin(String illness_admin) {
		Illness_admin = illness_admin;
	}
	public String getIllness_remark() {
		return Illness_remark;
	}
	public void setIllness_remark(String illness_remark) {
		Illness_remark = illness_remark;
	}
	public String getIllness_State() {
		return Illness_State;
	}
	public void setIllness_State(String illness_State) {
		Illness_State = illness_State;
	}
	public Illness() {
		
		// TODO Auto-generated constructor stub
	}
	public Illness(int illness_ID, String illness_name, String illness_admin, String illness_remark,
			String illness_State) {
		super();
		Illness_ID = illness_ID;
		Illness_name = illness_name;
		Illness_admin = illness_admin;
		Illness_remark = illness_remark;
		Illness_State = illness_State;
	}
	
	

}
