package domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO {
	private int user_num;
	private String user_id;
	private String user_password;
	private String user_name;
	private String authorities;
	private LocalDateTime user_regdate;

	
	
	public String getRegDateTime() {
		if(this.user_regdate == null) return "";
		return this.user_regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")); 
	}
}
