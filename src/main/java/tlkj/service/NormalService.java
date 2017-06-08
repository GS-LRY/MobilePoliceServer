package tlkj.service;

import java.util.List;

import tlkj.model.Normal;

public interface NormalService {

	public Normal getNormalById(int id);
	
	public List<Normal> getAll();
	
	public void AddNormalRecord(Normal record);
	
	public List<Normal> getAllNormal();
}
