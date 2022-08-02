package kh.spring.pisic.member.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class Member {
	
	private String m_id;
	private String m_platform;
	private String m_platform_id;
	private String m_password;
	private String m_name;
	private String m_nickname;
	private String m_phone;
	private String m_address;
	private String m_address_detail;
	private Timestamp m_date;
	private int m_birth;
	private String m_gender;
	private String m_profile;
	private String m_delete_yn;
	private String m_email;
	private String m_membership_yn;
	private String m_grade;
	private int m_fail_cnt;
	private boolean m_enabled;

	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_platform=" + m_platform + ", m_platform_id=" + m_platform_id
				+ ", m_password=" + m_password + ", m_name=" + m_name + ", m_nickname=" + m_nickname + ", m_phone="
				+ m_phone + ", m_address=" + m_address + ", m_address_detail=" + m_address_detail + ", m_date=" + m_date
				+ ", m_birth=" + m_birth + ", m_gender=" + m_gender + ", m_profile=" + m_profile + ", m_delete_yn="
				+ m_delete_yn + ", m_email=" + m_email + ", m_membership_yn=" + m_membership_yn + ", m_grade=" + m_grade
				+ ", m_fail_cnt=" + m_fail_cnt + ", m_enabled=" + m_enabled + "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_platform() {
		return m_platform;
	}

	public void setM_platform(String m_platform) {
		this.m_platform = m_platform;
	}

	public String getM_platform_id() {
		return m_platform_id;
	}

	public void setM_platform_id(String m_platform_id) {
		this.m_platform_id = m_platform_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_address_detail() {
		return m_address_detail;
	}

	public void setM_address_detail(String m_address_detail) {
		this.m_address_detail = m_address_detail;
	}

	public Timestamp getM_date() {
		return m_date;
	}

	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}

	public int getM_birth() {
		return m_birth;
	}

	public void setM_birth(int m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	public String getM_delete_yn() {
		return m_delete_yn;
	}

	public void setM_delete_yn(String m_delete_yn) {
		this.m_delete_yn = m_delete_yn;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_membership_yn() {
		return m_membership_yn;
	}

	public void setM_membership_yn(String m_membership_yn) {
		this.m_membership_yn = m_membership_yn;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public int getM_fail_cnt() {
		return m_fail_cnt;
	}

	public void setM_fail_cnt(int m_fail_cnt) {
		this.m_fail_cnt = m_fail_cnt;
	}

	public boolean isM_enabled() {
		return m_enabled;
	}

	public void setM_enabled(boolean m_enabled) {
		this.m_enabled = m_enabled;
	}
}
