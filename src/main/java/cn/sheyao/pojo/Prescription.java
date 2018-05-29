package cn.sheyao.pojo;

public class Prescription {
	private int Prescription_ID;	//药方id
	private String Prescription_particulars;//方子的详细内容
	private String Doctor_ID;//医生id
	private String Prescription_source;//药方来源
	private String Prescription_DeleteReason;//删除原因
	private String Illness_ID;//病症id
	private String Prescription_State;//药方状态：1，存在；0，不存在
	public int getPrescription_ID() {
		return Prescription_ID;
	}
	public void setPrescription_ID(int prescription_ID) {
		Prescription_ID = prescription_ID;
	}
	public String getPrescription_particulars() {
		return Prescription_particulars;
	}
	public void setPrescription_particulars(String prescription_particulars) {
		Prescription_particulars = prescription_particulars;
	}
	public String getDoctor_ID() {
		return Doctor_ID;
	}
	public void setDoctor_ID(String doctor_ID) {
		Doctor_ID = doctor_ID;
	}
	public String getPrescription_source() {
		return Prescription_source;
	}
	public void setPrescription_source(String prescription_source) {
		Prescription_source = prescription_source;
	}
	public String getPrescription_DeleteReason() {
		return Prescription_DeleteReason;
	}
	public void setPrescription_DeleteReason(String prescription_DeleteReason) {
		Prescription_DeleteReason = prescription_DeleteReason;
	}
	public String getIllness_ID() {
		return Illness_ID;
	}
	public void setIllness_ID(String illness_ID) {
		Illness_ID = illness_ID;
	}
	public String getPrescription_State() {
		return Prescription_State;
	}
	public void setPrescription_State(String prescription_State) {
		Prescription_State = prescription_State;
	}
	public Prescription() {
	
		// TODO Auto-generated constructor stub
	}
	public Prescription(int prescription_ID, String prescription_particulars, String doctor_ID,
			String prescription_source, String prescription_DeleteReason, String illness_ID,
			String prescription_State) {
		super();
		Prescription_ID = prescription_ID;
		Prescription_particulars = prescription_particulars;
		Doctor_ID = doctor_ID;
		Prescription_source = prescription_source;
		Prescription_DeleteReason = prescription_DeleteReason;
		Illness_ID = illness_ID;
		Prescription_State = prescription_State;
	}
	@Override
	public String toString() {
		return "Prescription [Prescription_ID=" + Prescription_ID + ", Prescription_particulars="
				+ Prescription_particulars + ", Doctor_ID=" + Doctor_ID + ", Prescription_source=" + Prescription_source
				+ ", Prescription_DeleteReason=" + Prescription_DeleteReason + ", Illness_ID=" + Illness_ID
				+ ", Prescription_State=" + Prescription_State + "]";
	}
	
	
	
	
	

}
