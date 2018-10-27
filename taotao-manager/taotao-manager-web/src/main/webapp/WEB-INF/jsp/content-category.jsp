<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	 <ul id="contentCategory" class="easyui-tree">
    </ul>
</div>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"> 
<div id="contentCategoryMenu" class="easyui-menu" style="width:120px;" data-options="onClick:menuHandler">
    <div data-options="iconCls:'icon-add',name:'add'">添加</div>
    <div data-options="iconCls:'icon-remove',name:'rename'">重命名</div>
    <div class="menu-sep"></div>
    <div data-options="iconCls:'icon-remove',name:'delete'">删除</div>
</div>
<script type="text/javascript">
$(function(){
	var expnode=[];
	moduleTree = $("#contentCategory").tree({
		url : $('#contextPath').val()+'/content/category/list',
		animate: true,
		method : "GET",
		onContextMenu: function(e,node){
            e.preventDefault();
            $(this).tree('select',node.target);
            $('#contentCategoryMenu').menu('show',{
                left: e.pageX,
                top: e.pageY
            });
        },
        /*onLoadSuccess:function(expnode)
        {
        	debugger;
        	if(node == null){
        		return false;
        	}
            var list=[];
            for(var j=0;j<expnode.length;j++){
                list.push(expnode[j])
            }
            $("#contentCategory").tree("collapseAll");
            for(var i=0;i<list.length;i++){
                var node = $('#contentCategory').tree('find', list[i]);
                $('#contentCategory').tree('expand', node.target);
            }
        },
        onBeforeExpand:function(node){
            expnode.push(node.id.toString());
        },
        onBeforeCollapse:function (node) {
            var i=expnode.indexOf(node.id.toString());
            if(i>=0){
                expnode.splice(i,1);
            }
        }, */ 
        onAfterEdit : function(node){
        	var _tree = $(this);
        	debugger;
        	if(node.id == 0){
        		debugger;
        		// 新增节点
        		$.post($('#contextPath').val()+"/content/category/create",{parentId:node.parentId,name:node.text},function(data){
        			if(data.status == 200){
        				debugger;
        				_tree.tree("update",{
            				target : node.target,
            				id : data.data.id
            			});
        			}else if(data.status == 105){
        				if(data.msg == 'already exists'){
        					$.messager.alert('提示','已存在名称'+node.text+'节点!');
        				}else if(data.msg == 'name cannot be null'){
        					$.messager.alert('提示','名字不能為空!');
        				}
        				_tree.tree("remove",node.target);
        				
        			}else{
        				$.messager.alert('提示','创建'+node.text+' 分类失败!');
        				_tree.tree("remove",node.target);
        			}
        			debugger;
        			var selected = $("#contentCategory").tree("getSelected");
        			
        			var checknodes = $("#contentCategory").tree('getParent', node.target);
        			var params = {
        				    roleId: selected.Id,
        				    roleName: selected.Name
        			};
       				moduleTree.tree("options").queryParams = params;
       				moduleTree.tree('reload');
        		});
        	}else{
        		debugger;
        		$.post($('#contextPath').val()+"/content/category/update",{id:node.id,name:node.text});
        	}
        }
	});
});
function menuHandler(item){
	debugger;
	var tree = $("#contentCategory");
	var node = tree.tree("getSelected");
	if(item.name === "add"){
		tree.tree('append', {
            parent: (node?node.target:null),
            data: [{
                text: '新建分类',
                id : 0,
                parentId : node.id
            }]
        }); 
		var _node = tree.tree('find',0);
		tree.tree("select",_node.target).tree('beginEdit',_node.target);
	}else if(item.name === "rename"){
		tree.tree('beginEdit',node.target);
	}else if(item.name === "delete"){
		$.messager.confirm('确认','确定删除名为 '+node.text+' 的分类吗？',function(r){
			if(r){
				debugger;
				var checknodes = tree.tree('getParent', node.target);
				$.post($('#contextPath').val()+"/content/category/delete",{parentId:checknodes.id,id:node.id},function(){
					tree.tree("remove",node.target);
				});	
			}
		});
	}
}
</script>