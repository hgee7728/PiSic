package kh.spring.pisic.membership.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class MembershipInfo {

	private String ms_i_no;
	private String m_id;
	private int ms_no;
	private String ms_i_pg;
	private String ms_i_card;
	private Timestamp ms_p_date;
	private Timestamp ms_s_date;
	private Timestamp ms_d_date;
	private int ms_period;
	private String ms_customer_uid;
	private String ms_merchant_uid;
	
	//
	private String ms_name;
	private int ms_price;
	
	@Override
	public String toString() {
		return "MembershipInfo [ms_i_no=" + ms_i_no + ", m_id=" + m_id + ", ms_no=" + ms_no + ", ms_i_pg=" + ms_i_pg
				+ ", ms_i_card=" + ms_i_card + ", ms_p_date=" + ms_p_date + ", ms_s_date=" + ms_s_date + ", ms_d_date="
				+ ms_d_date + ", ms_period=" + ms_period + ", ms_customer_uid=" + ms_customer_uid + ", ms_merchant_uid="
				+ ms_merchant_uid + "]";
	}
	
	public String getMs_i_no() {
		return ms_i_no;
	}
	public void setMs_i_no(String ms_i_no) {
		this.ms_i_no = ms_i_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}
	public String getMs_i_pg() {
		return ms_i_pg;
	}
	public void setMs_i_pg(String ms_i_pg) {
		this.ms_i_pg = ms_i_pg;
	}
	public String getMs_i_card() {
		return ms_i_card;
	}
	public void setMs_i_card(String ms_i_card) {
		this.ms_i_card = ms_i_card;
	}
	public Timestamp getMs_p_date() {
		return ms_p_date;
	}
	public void setMs_p_date(Timestamp ms_p_date) {
		this.ms_p_date = ms_p_date;
	}
	public Timestamp getMs_s_date() {
		return ms_s_date;
	}
	public void setMs_s_date(Timestamp ms_s_date) {
		this.ms_s_date = ms_s_date;
	}
	public Timestamp getMs_d_date() {
		return ms_d_date;
	}
	public void setMs_d_date(Timestamp ms_d_date) {
		this.ms_d_date = ms_d_date;
	}
	public int getMs_period() {
		return ms_period;
	}
	public void setMs_period(int ms_period) {
		this.ms_period = ms_period;
	}
	public String getMs_customer_uid() {
		return ms_customer_uid;
	}
	public void setMs_customer_uid(String ms_customer_uid) {
		this.ms_customer_uid = ms_customer_uid;
	}
	public String getMs_merchant_uid() {
		return ms_merchant_uid;
	}
	public void setMs_merchant_uid(String ms_merchant_uid) {
		this.ms_merchant_uid = ms_merchant_uid;
	}

	// 
	public String getMs_name() {
		return ms_name;
	}
	public void setMs_name(String ms_name) {
		this.ms_name = ms_name;
	}
	public int getMs_price() {
		return ms_price;
	}
	public void setMs_price(int ms_price) {
		this.ms_price = ms_price;
	}
	
	
	
}
