package domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QnAQryCommentList extends QnAQryResult {
	
	@JsonProperty("data")
	List<QnACommentDTO> list;
}
