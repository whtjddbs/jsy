package item.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Item_infoDTO {
	private int seq;
	private int item_seq;
	private String color;
	private String size1;
	private String size2;
	private int qty;
}
