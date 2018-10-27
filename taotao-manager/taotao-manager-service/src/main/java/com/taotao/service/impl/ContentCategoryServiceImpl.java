package com.taotao.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.taotao.common.pojo.EUTreeNode;
import com.taotao.common.pojo.TaotaoResult;
import com.taotao.mapper.TbContentCategoryMapper;
import com.taotao.pojo.TbContentCategory;
import com.taotao.pojo.TbContentCategoryExample;
import com.taotao.pojo.TbContentCategoryExample.Criteria;
import com.taotao.service.ContentCategoryService;

@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {

	@Autowired
	TbContentCategoryMapper tbContentCategoryMapper;

	@Override
	public List<EUTreeNode> getCategoryList(Long parentId) {

		// 根据parentId查询节点列表
		TbContentCategoryExample example = new TbContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		// 执行查询
		List<TbContentCategory> list = tbContentCategoryMapper.selectByExample(example);
		List<EUTreeNode> resultList = new ArrayList<>();
		for (TbContentCategory tbContentCategory : list) {
			// 创建一个节点
			EUTreeNode node = new EUTreeNode();
			node.setId(tbContentCategory.getId());
			node.setText(tbContentCategory.getName());
			node.setState(tbContentCategory.getIsParent() ? "closed" : "open");
			resultList.add(node);
		}
		return resultList;
	}

	private TbContentCategory getTbContentCategoryByName(String name) {
		TbContentCategoryExample example = new TbContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		List<TbContentCategory> tbContentCategoryList = tbContentCategoryMapper.selectByExample(example);
		if (!org.springframework.util.CollectionUtils.isEmpty(tbContentCategoryList)) {
			return tbContentCategoryList.get(0);

		}
		return null;
	}

	@Override
	public TaotaoResult insertContent(Long parentId, String name) {

		if (StringUtils.isEmpty(name)) {
			return TaotaoResult.build(105, "name cannot be null");
		}

		if (null != getTbContentCategoryByName(name)) {
			return TaotaoResult.build(105, "already exists");
		}

		// 创建一个pojo
		TbContentCategory contentCategory = new TbContentCategory();
		contentCategory.setName(name);
		contentCategory.setIsParent(false);
		// 状态 可选值 1正常 2删除
		contentCategory.setStatus(1);
		contentCategory.setParentId(parentId);
		contentCategory.setSortOrder(1);
		contentCategory.setCreated(new Date());
		contentCategory.setUpdated(new Date());
		// 添加记录
		tbContentCategoryMapper.insert(contentCategory);
		// 查看父节点的isParent列是否是true,如果不是true改成true
		TbContentCategory parentCat = tbContentCategoryMapper.selectByPrimaryKey(parentId);
		// 判断是否是true
		if (!parentCat.getIsParent()) {
			parentCat.setIsParent(true);
			// 更新父节点
			tbContentCategoryMapper.updateByPrimaryKey(parentCat);
		}
		// 需要返回一个节点的Id,所以这里还是另外查询一个出来
		return TaotaoResult.ok(getTbContentCategoryByName(name));
	}

	@Override
	public TaotaoResult updateContent(Long nodeId, String nodeName) {

		TbContentCategory tbContentCategory = tbContentCategoryMapper.selectByPrimaryKey(nodeId);
		tbContentCategory.setName(nodeName);
		tbContentCategoryMapper.updateByPrimaryKey(tbContentCategory);
		// tbContentCategoryMapper.updateByExample(tbContentCategory, example);
		return TaotaoResult.ok(tbContentCategory);
	}

	@Override
	public TaotaoResult deleteContent(Long id, Long parentId) {

		tbContentCategoryMapper.deleteByPrimaryKey(id);

		TbContentCategory tbContentCategory_child = tbContentCategoryMapper.selectByPrimaryKey(id);
		TbContentCategory tbContentCategory = tbContentCategoryMapper.selectByPrimaryKey(parentId);

		TbContentCategoryExample tbContentCategoryExample = new TbContentCategoryExample();
		Criteria criteria = tbContentCategoryExample.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<TbContentCategory> tbContentCategories = tbContentCategoryMapper.selectByExample(tbContentCategoryExample);

		if (org.springframework.util.CollectionUtils.isEmpty(tbContentCategories)) {
			tbContentCategory.setIsParent(false);
			tbContentCategoryMapper.updateByPrimaryKey(tbContentCategory);
		}
		return TaotaoResult.ok(tbContentCategory_child);
	}

}
