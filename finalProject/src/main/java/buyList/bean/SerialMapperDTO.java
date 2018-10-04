package buyList.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SerialMapperDTO {
	private String serial;
	private int seq;
	private int price;
	private int count;
}
