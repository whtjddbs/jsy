package buyList.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class BuyListDTO {
	private String serial;
	private String id;
	private String name;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String parcel;
	private String parcel_code;
	private String comments;
	private int point;
	private String status;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date logtime;
}
