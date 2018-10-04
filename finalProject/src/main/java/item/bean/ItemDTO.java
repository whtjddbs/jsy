package item.bean;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ItemDTO {
	private int seq;
	private String name;
	
	@NumberFormat(pattern = "#,###,###")
	private int price;
	private int qty;
	private String main_codename;
	private String sub_codename;
	private String img;
	private double discount;
}
