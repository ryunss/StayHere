package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomDTO {
	private int num;
	private String name;
	private String address;
	private String category;
	private String info;
	private String region;
	private int personnel;
	private int price;
	private int viewcnt;
}
