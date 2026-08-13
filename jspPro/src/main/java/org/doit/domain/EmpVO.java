package org.doit.domain;
import java.time.LocalDateTime;

import lombok.*;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@NoArgsConstructor
@Setter
@Getter
@ToString
@AllArgsConstructor
@Builder

public class EmpVO {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private LocalDateTime hiredate;
	private double sal;
	private double comm;
	private int deptno;
}
