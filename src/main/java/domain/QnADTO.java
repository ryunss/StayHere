package domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class QnADTO {
	
	private int qna_num;
	private UserDTO user_num;
	private String qna_subject;
	private String qna_content;
	private LocalDateTime qna_regdate;
	
	public String getRegDateTime() {
		if(this.qna_regdate == null) return "";		
		return this.qna_regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
