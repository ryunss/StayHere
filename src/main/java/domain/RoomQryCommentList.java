package domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RoomQryCommentList extends RoomQryResult{
	
	@JsonProperty("data")
	List<RoomCommentDTO> list; // 목록데이터
}
