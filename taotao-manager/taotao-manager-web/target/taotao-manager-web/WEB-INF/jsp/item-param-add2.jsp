<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="shop" />
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
	$(function() {
		TAOTAO
				.initItemCat({
					fun : function(node) {
						$(".addGroupTr").hide().find(".param").remove();
						//  判断选择的类目是否已经添加过规格
						$
								.getJSON(
										"${shop }/item/param/query/itemcatid/"
												+ node.id,
										function(data) {
											if (data.status == 200 && data.data) {
												$.messager
														.alert(
																"提示",
																"该类目已经添加，请选择其他类目。",
																undefined,
																function() {
																	$(
																			"#itemParamAddTable .selectItemCat")
																			.click();
																});
												return;
											}
											$(".addGroupTr").show();
										});
					}
				});
		//怎么在这种网页中的js打断点 因为source当中貌似打不了
		$(".addGroup").click(function() {
			var temple = $(".itemParamAddTemplate li").eq(0).clone();
			$(this).parent().parent().append(temple);
			alert($(this).parent().parent().get(0));
			//addParam跟addGroup不同的
			temple.find(".addParam").click(function() {
				//为什么变成了2呢 
				$(".itemParamAddTemplate li").css("font-size", "30px");
				var li = $(".itemParamAddTemplate li").eq(2).clone();
				li.find(".delParam").click(function() {
					$(this).parent().remove();
				});
				li.appendTo($(this).parentsUntil("ul").parent());
			});
			temple.find(".delParam").click(function() {
				$(this).parent().remove();
			});
		});

		$("#itemParamAddTable .close").click(function() {
			$(".panel-tool-close").click();
		});

		$("#itemParamAddTable .submit").click(
				function() {
					var params = [];
					var groups = $("#itemParamAddTable [name=group]");
					groups.each(function(i, e) {
						var p = $(e).parentsUntil("ul").parent().find(
								"[name=param]");
						var _ps = [];
						p.each(function(_i, _e) {
							var _val = $(_e).siblings("input").val();
							if ($.trim(_val).length > 0) {
								_ps.push(_val);
							}
						});
						var _val = $(e).siblings("input").val();
						if ($.trim(_val).length > 0 && _ps.length > 0) {
							params.push({
								"group" : _val,
								"params" : _ps
							});
						}
					});
					var url = "${shop}/item/param/save/"
							+ $("#itemParamAddTable [name=cid]").val();
					$.post(url, {
						"paramData" : JSON.stringify(params)
					}, function(data) {
						if (data.status == 200) {
							$.messager.alert('提示', '新增商品规格成功!', undefined,
									function() {
										$(".panel-tool-close").click();
										$("#itemParamList").datagrid("reload");
									});
						}
					});
				});
	});
</script>