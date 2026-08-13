package days07.mvc.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {

	
	private long seq; 
	private String writer;
	private String pwd;
	private String email ;
	private String title;
	private Date writedate ;
	private int readed ;
	private int tag; 
	private String content;
		
	

}
