package tlkj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tlkj.dao.DepartmentMapper;
import tlkj.model.Department;
import tlkj.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

	
	private DepartmentMapper departmentMapper;

	public DepartmentMapper getDepartmentMapper() {
		return departmentMapper;
	}
	
	@Autowired
	public void setDepartmentMapper(DepartmentMapper departmentMapper) {
		this.departmentMapper = departmentMapper;
	}

	@Override
	public List<Department> getAllDepartment() {
		return departmentMapper.getAllDepartment();
	}

}
