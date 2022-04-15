<#if isAutoImport?exists && isAutoImport==true>
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

	@Resource
	private ${classInfo.className}Mapper ${classInfo.className?uncap_first}Mapper;


	@Override
	public Object insert(${classInfo.className} ${classInfo.className?uncap_first}) {

		// valid
		if (${classInfo.className?uncap_first} == null) {
			return ${returnUtilFailure}("必要参数缺失");
        }

		${classInfo.className?uncap_first}Mapper.insert(${classInfo.className?uncap_first});
        return ${returnUtilSuccess}();
	}


	@Override
	public Object delete(Integer id) {
		int ret = ${classInfo.className?uncap_first}Mapper.delete(id);
		return ret>0?${returnUtilSuccess}():${returnUtilFailure}();
	}


	@Override
	public Object update(${classInfo.className} ${classInfo.className?uncap_first}) {
		int ret = ${classInfo.className?uncap_first}Mapper.update(${classInfo.className?uncap_first});
		return ret>0?${returnUtilSuccess}():${returnUtilFailure}();
	}


	@Override
	public ${classInfo.className} getById(Integer id) {
		return ${classInfo.className?uncap_first}Mapper.getById(id);
	}

@Override
public Object save(${classInfo.className} ${classInfo.className?uncap_first}) {
Integer id = ${classInfo.className?uncap_first}.getId();
if (id==null) {
int insert = ${classInfo.className?uncap_first}Mapper.insert(${classInfo.className?uncap_first});
return ReturnT.success();
}
${classInfo.className} load = ${classInfo.className?uncap_first}Mapper.getById(${classInfo.className?uncap_first}.getId());
if (load==null) {
int insert = ${classInfo.className?uncap_first}Mapper.insert(${classInfo.className?uncap_first});

return ReturnT.success();
}
${classInfo.className?uncap_first}Mapper.update(${classInfo.className?uncap_first});
return  ReturnT.success();
}


	@Override
	public Map<String,Object> pageList(int offset, int pageSize) {

		List<${classInfo.className}> pageList = ${classInfo.className?uncap_first}Mapper.pageList(offset, pageSize);
Integer totalCount = ${classInfo.className?uncap_first}Mapper.pageListCount(offset, pageSize);

		// result
		Map<String, Object> result = new HashMap<String, Object>();
		//result.put("pageList", pageList);
		result.put("content", pageList);
		result.put("totalCount", totalCount);

		return result;
	}

}
