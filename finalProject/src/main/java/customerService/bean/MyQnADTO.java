package customerService.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MyQnADTO {
	private String type;
	private int serial;
	private String id;
	private String title;
	private Date logtime;
}
