<#if isAutoImport?exists && isAutoImport==true>
import java.util.Map;
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
public interface ${classInfo.className}Service {

    /**
    * 新增
    */
    public Object insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 删除
    */
    public Object delete(int id);

    /**
    * 更新
    */
    public Object update(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 根据主键 id 查询
    */
    public ${classInfo.className} load(int id);

/**
* 如果已经有这个id的，就更新，不然是插入
*/
Object save(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 分页查询
    */
    public Map<String,Object> pageList(int offset, int pageSize);

}
