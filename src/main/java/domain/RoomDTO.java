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
	private int num; // room_num - PK
	private String name; // room_name - 숙소 이름
	private String address; // room_address - 숙소 주소
	private String category; // room_category - 카테고리(호텔, 펜션 ... )
	private String info; // room_info - 숙소 정보(내용)
	private String region; // room_region - 지역
	private int personnel; // room_personnel - 인원
	private int price; // room_price - 가격
	private int viewcnt; // room_viewcnt - 조회수
	private String image; // room_image - 숙소 이미지
}
