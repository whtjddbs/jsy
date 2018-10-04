package customerService.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class MantomanDTO {
	private int seq;
	private String type;
	private String serial;
	private String id;
	private String title;
	private String content;
	private String img;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date logtime; 
}
