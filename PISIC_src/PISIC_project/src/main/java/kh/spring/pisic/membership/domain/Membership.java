package kh.spring.pisic.membership.domain;

import org.springframework.stereotype.Component;

@Component
public class Membership {
	
	private int ms_no;
	private String ms_name;
	private int ms_price;
	private int ms_period;
	
	@Override
	public String toString() {
		return "Membership [ms_no=" + ms_no + ", ms_name=" + ms_name + ", ms_price=" + ms_price + ", ms_period="
				+ ms_period + "]";
	}

	public int getMs_no() {
		return ms_no;
	}

	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}

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

	public int getMs_period() {
		return ms_period;
	}

	public void setMs_period(int ms_period) {
		this.ms_period = ms_period;
	}
	
}
