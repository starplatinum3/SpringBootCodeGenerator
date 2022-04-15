<#if isWithPackage?exists && isWithPackage==true>package ${packageName}.mapper;</#if>
<#if isAutoImport?exists && isAutoImport==true>
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;
</#if>
/**
 * @description ${classInfo.classComment}Mapper
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Mapper
@Repository
public interface ${classInfo.className}Mapper {

//这种假如表是stu 那么id是 stu_id
  //  @Select("select * from ${classInfo.tableName} where ${classInfo.tableName}_id=井{id}")
  //  public ${classInfo.className} getById(Integer id);

// @Delete(value = "delete from ${classInfo.tableName} where ${classInfo.tableName}_id=井{${classInfo.className?uncap_first}Id}")
//  boolean delete(Integer ${classInfo.className?uncap_first}Id);

//@Options(useGeneratedKeys=true,keyProperty="${classInfo.className?uncap_first}Id")
//@Insert("insert into ${classInfo.tableName}" +
//" (<#list classInfo.fieldList as fieldItem >${fieldItem.columnName}<#if fieldItem_has_next>,</#if></#list>)" +
//" values(<#list classInfo.fieldList as fieldItem >${fieldItem.fieldName}<#if fieldItem_has_next>,<#else>)</#if></#list>")
//public Integer insert(${classInfo.className} ${classInfo.className?uncap_first});


//  @Update(value = "update ${classInfo.tableName} set "
//   <#list classInfo.fieldList as fieldItem >
    //      <#if fieldItem.columnName != "id">+" ${fieldItem.columnName}=井{${fieldItem.fieldName}}<#if fieldItem_has_next>,</#if>"</#if>
    //   </#list>
//   +" where ${classInfo.tableName}_id=井{${classInfo.className?uncap_first}Id} ")
//    boolean update(${classInfo.className} ${classInfo.className?uncap_first});

//这种假如表是stu 那么id是 id, 两种选择都放着，想用某一种 只要把另外一种注释就行了
@Select("select * from ${classInfo.tableName} where id=井{id}")
public ${classInfo.className} getById(Integer id);

@Delete(value = "delete from ${classInfo.tableName} where id=井{id}")
Integer delete(Integer id);

    @Options(useGeneratedKeys=true,keyProperty="id")
    @Insert("insert into ${classInfo.tableName}" +
        " (<#list classInfo.fieldList as fieldItem >${fieldItem.columnName}<#if fieldItem_has_next>,</#if></#list>)" +
        " values(<#list classInfo.fieldList as fieldItem >井{${fieldItem.fieldName}}<#if fieldItem_has_next>,<#else>)</#if></#list>")
    public Integer insert(${classInfo.className} ${classInfo.className?uncap_first});




    @Update(value = "update ${classInfo.tableName} set "
    <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.columnName != "id">+" ${fieldItem.columnName}=井{${fieldItem.fieldName}}<#if fieldItem_has_next>,</#if>"</#if>
    </#list>
        +" where id=井{id} ")
    Integer update(${classInfo.className} ${classInfo.className?uncap_first});


    @Results(value = {
    <#list classInfo.fieldList as fieldItem >
        @Result(property = "${fieldItem.fieldName}", column = "${fieldItem.columnName}")<#if fieldItem_has_next>,</#if>
    </#list>
    })
    @Select(value = "select * from ${classInfo.tableName} where ${classInfo.tableName}_id=井{queryParam}")
    ${classInfo.className} selectOne(String queryParam);

    @Results(value = {
    <#list classInfo.fieldList as fieldItem >
        @Result(property = "${fieldItem.fieldName}", column = "${fieldItem.columnName}")<#if fieldItem_has_next>,</#if>
    </#list>
    })
    @Select(value = "select * from ${classInfo.tableName} where "
    <#list classInfo.fieldList as fieldItem >
        +" ${fieldItem.columnName}=井{${fieldItem.fieldName}}<#if fieldItem_has_next> or </#if>"
    </#list>
    )
    List<${classInfo.className}> selectList(${classInfo.className} ${classInfo.className?uncap_first});

@Results(value = {
<#list classInfo.fieldList as fieldItem >
    @Result(property = "${fieldItem.fieldName}", column = "${fieldItem.columnName}")<#if fieldItem_has_next>,</#if>
</#list>
})
@Select(value = "select * from ${classInfo.tableName} where "
<#list classInfo.fieldList as fieldItem >
    +" ${fieldItem.columnName}=井{${fieldItem.fieldName}}<#if fieldItem_has_next> or </#if>"
</#list>
+" LIMIT 井{offset} , 井{pageSize}"
)
List<${classInfo.className}> pageList(int offset, int pageSize);

    @Select(value = "SELECT count(1)\n" +
    "        FROM ${classInfo.tableName} "
    )
    Integer pageListCount(int offset, int pageSize);
}
