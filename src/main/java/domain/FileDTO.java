package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class FileDTO {
	private int file_num;
//	private QnADTO qna_num;
	private String file_source;
	private String file_name;
	private boolean isImage;
}
