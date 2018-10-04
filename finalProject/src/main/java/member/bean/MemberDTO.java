package member.bean;

import java.util.Date;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	private String name;
	private String id;
	private String pwd;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int code;
	private int lev;
	private int point;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date logtime;
}
