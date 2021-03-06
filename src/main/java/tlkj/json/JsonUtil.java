package tlkj.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.codehaus.jackson.type.TypeReference;

import tlkj.model.Escaped;
import tlkj.model.Normal;

public class JsonUtil {

	private ObjectMapper mapper = new ObjectMapper();
	//private JsonGenerator jsonGenerator = null;
	
	
	/**
	 * JSON数据转换为Normal核查记录列表
	 */
	public ArrayList<Normal> StringFromJSON(String jsondata){
		JavaType javaType = getCollectionType(ArrayList.class,Normal.class);
		ArrayList<Normal> list = null;
		try {
			list = mapper.readValue(jsondata, javaType);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * JSON数据转换为Escaped列表
	 */
	public ArrayList<Escaped> JSONToEscapedList(String jsondata){
		JavaType javaType = getCollectionType(ArrayList.class,Escaped.class);
		ArrayList<Escaped> list = null;
		try {
			list = mapper.readValue(jsondata, javaType);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	private JavaType getCollectionType(Class<?> class1, Class<?> class2) {
		return mapper.getTypeFactory().constructParametricType(class1, class2);
	}
	
	public String ListToJSON(List list){
		try {
			return mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	public String MapToJSON(Map map){
		try {
			return mapper.writeValueAsString(map);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public Map<String,String> JSONTOMap(String jsondata){
		Map<String,String> map = new HashMap<String,String>();
		try {
			map = mapper.readValue(jsondata, new TypeReference<HashMap<String,String>>() {});
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	public String EscapedToJSON(Escaped escaped){
		try {
			return mapper.writeValueAsString(escaped);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
