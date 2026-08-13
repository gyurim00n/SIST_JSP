package days07.mvc.member.domain;

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
public class MemberDTO {

	
	private int seq;
	private String id;
	private String name;
	private String passwd;
	private String role;
		
	

}
