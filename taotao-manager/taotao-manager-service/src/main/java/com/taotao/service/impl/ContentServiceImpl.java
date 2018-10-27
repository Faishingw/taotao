package com.taotao.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.taotao.common.pojo.EUDataGridResult;
import com.taotao.common.pojo.EUTreeNode;
import com.taotao.common.pojo.TaotaoResult;
import com.taotao.mapper.TbContentCategoryMapper;
import com.taotao.mapper.TbContentMapper;
import com.taotao.pojo.TbContent;
import com.taotao.pojo.TbContentCategory;
import com.taotao.pojo.TbContentCategoryExample;
import com.taotao.pojo.TbContentExample;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbContentExample.Criteria;
import com.taotao.service.ContentCategoryService;
import com.taotao.service.ContentService;

/**
 * 分类底下的内容相关接口
 * 
 * @author FaishingKwong
 *
 */
@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	TbContentMapper tbContentMapper;

	@Override
	public EUDataGridResult getContentList(Long parentId, int page, int rows) {
		// 根据parentId查询节点列表
		TbContentExample example = new TbContentExample();
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(parentId);
		// 执行查询
		List<TbContent> list = tbContentMapper.selectByExample(example);

		// 分页处理
		PageHelper.startPage(page, rows);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 去记录总条数
		PageInfo<TbContent> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public TaotaoResult insertContent(Long parentId, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TaotaoResult updateContent(Long nodeId, String nodeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TaotaoResult deleteContent(Long id, Long parentId) {
		// TODO Auto-generated method stub
		return null;
	}

}
