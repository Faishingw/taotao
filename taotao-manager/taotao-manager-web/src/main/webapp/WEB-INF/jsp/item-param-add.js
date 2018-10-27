$(function() {
	TAOTAO.initItemCat({
		fun : function(node) {
			$(".addGroupTr").hide().find(".param").remove();
			// 判断选择的类目是否已经添加过规格
			$.getJSON("${shop }/item/param/query/itemcatid/" + node.id,
					function(data) {
						if (data.status == 200 && data.data) {
							$.messager.alert("提示", "该类目已经添加，请选择其他类目。",
									undefined, function() {
										$("#itemParamAddTable .selectItemCat")
												.click();
									});
							return;
						}
						$(".addGroupTr").show();
					});
		}
	});
	// 怎么在这种网页中的js打断点 因为source当中貌似打不了
	$(".addGroup").click(function() {
		var temple = $(".itemParamAddTemplate li").eq(0).clone();
		$(this).parent().parent().append(temple);
		alert($(this).parent().parent().get(0));
		temple.find(".addParam").click(function() {
			// 为什么变成了2呢
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

