package domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QnAQryResult {
	
	int count;	//결과값
	String status;	//결과 메세지
	
	@JsonIgnore
	String memo;
}
