package buyList.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SerialMapperDTO {
	private String serial;
	private int seq;
	private String color;
	private String size1;
	private String size2;
	private int price;
	private int count;
}
