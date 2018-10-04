package customerService.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FaQDTO {
	private String type;
	private String title;
	private String content;
}
