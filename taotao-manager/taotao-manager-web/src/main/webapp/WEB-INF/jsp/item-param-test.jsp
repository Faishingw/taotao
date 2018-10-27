<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="shop" />
<!-- 为了让本网页变成单独的网页 并且方便调试 加入以下的css跟js -->
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/taotao.css" />
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!--  -->
<html>
<table cellpadding="5" style="margin-left: 30px" id="itemParamAddTable"
	class="itemParam">
	<tr>
		<td>商品类目:</td>
		<td><a href="javascript:void(0)"
			class="easyui-linkbutton selectItemCat">选择类目</a> <input type="hidden"
			name="cid" style="width: 280px;"></input></td>
	</tr>
	<tr class="hide addGroupTr">
		<td>规格参数:</td>
		<td>
			<ul>
				<li><a href="javascript:void(0)"
					class="easyui-linkbutton addGroup">添加分组</a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><a href="javascript:void(0)" class="easyui-linkbutton submit">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton close">关闭</a></td>
	</tr>
</table>
<div class="itemParamAddTemplate" style="display: none;">
	<li class="param">
		<ul>
			<li><input class="easyui-textbox" style="width: 150px;"
				name="group" />&nbsp;<a href="javascript:void(0)"
				class="easyui-linkbutton addParam" title="添加参数"
				data-options="plain:true,iconCls:'icon-add'"></a></li>
			<li><span>|-------</span><input style="width: 150px;"
				class="easyui-textbox" name="param" />&nbsp;<a
				href="javascript:void(0)" class="easyui-linkbutton delParam"
				title="删除" data-options="plain:true,iconCls:'icon-cancel'"></a></li>
		</ul>
	</li>
</div>

<script style="">
	//怎么在这种网页中的js打断点 因为source当中貌似打不了
	$(".selectItemCat").click(function() {
		var params = [];
		params.push({
			"group" : "g",
			"params" : "p"
		});
		$.post('${shop}/item/param/testPost', {
			"paramData" : JSON.stringify(params)
		}, function(data) {
			if (data.status == 200) {
				alert(data.data);
				alert(data.msg);
			}
		})
	});

	/* $.messager.alert('提示', '新增商品规格成功!', undefined,
	function() {
		$(".panel-tool-close").click();
		$("#itemParamList").datagrid("reload");
	}); */
</script>
</html>