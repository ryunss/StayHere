package domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	@JsonIgnore
	private String user_password;
	private String user_name;
	@JsonIgnore
	private String authorities;
	@JsonIgnore
	private LocalDateTime user_regdate;

	
	@JsonIgnore
	public String getRegDateTime() {
		if(this.user_regdate == null) return "";
		return this.user_regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")); 
	}
}
