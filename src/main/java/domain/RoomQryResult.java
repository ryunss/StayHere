package domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RoomQryResult {
	int count;	//결과값 (정수)
	String status;	//결과 메세지
	
	@JsonIgnore
	String memo;
}
