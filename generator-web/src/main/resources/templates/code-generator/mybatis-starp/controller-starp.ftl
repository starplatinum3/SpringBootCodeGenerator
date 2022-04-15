<#if isAutoImport?exists && isAutoImport==true>
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
</#if>

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@CrossOrigin
@RestController
@RequestMapping(value = "/${classInfo.className?uncap_first}")
public class ${classInfo.className}Controller {

    @Resource
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

/**
* id 存在就更新 不然插入
* @param ${classInfo.className?uncap_first}
* @return
*/
@PostMapping("/save")
public Object save(@RequestBody  ${classInfo.className} ${classInfo.className?uncap_first}){
return ${classInfo.className?uncap_first}Service.save(${classInfo.className?uncap_first});
}

    /**
    * 新增
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/insert")
    public Object insert(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first});
    }

    /**
    * 刪除
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/delete")
    public Object delete(int id){
        return ${classInfo.className?uncap_first}Service.delete(id);
    }

    /**
    * 更新
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/update")
    public Object update(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first});
    }

    /**
    * 查询 根据主键 id 查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/load")
    public Object load(int id){
        return ${classInfo.className?uncap_first}Service.load(id);
    }

    /**
    * 查询 分页查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/list")
    public Map<String, Object> pageList(@RequestParam(required = false, defaultValue = "0") int pageNumber,
                                        @RequestParam(required = false, defaultValue = "10") int pageSize) {
        return ${classInfo.className?uncap_first}Service.pageList(pageNumber, pageSize);
        //Map<String, Object> pageList = ${classInfo.className?uncap_first}Service.pageList(pageNumber, pageSize);
//return ReturnT.success(pageList);
    }

}
