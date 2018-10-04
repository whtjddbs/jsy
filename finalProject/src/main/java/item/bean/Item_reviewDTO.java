package item.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class Item_reviewDTO {
	private String serial;
	private int seq;
	private String id;
	private int star;
	private String comments;
	private String item_image;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date logtime;
}
