package tlkj.service;

import java.util.List;

import tlkj.model.Normal;
import tlkj.model.NormalTable;

public interface NormalService {

	public Normal getNormalById(int id);
	
	public List<NormalTable> getAll();
	
	public List<NormalTable> searchNormalRecord(String personId,String personName,String addressName,String commitTime,String userName,String departmentName);
	
	public void AddNormalRecord(Normal record);
	
	public List<Normal> getAllNormal();
}
