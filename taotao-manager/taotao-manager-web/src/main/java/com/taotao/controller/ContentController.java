package com.taotao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taotao.common.pojo.EUDataGridResult;
import com.taotao.common.pojo.EUTreeNode;
import com.taotao.common.pojo.TaotaoResult;
import com.taotao.pojo.TbItem;
import com.taotao.service.ContentCategoryService;
import com.taotao.service.ContentService;
import com.taotao.service.ItemCatService;
import com.taotao.service.ItemService;

/**
 * 内容分类管理
 * <p>
 * Title: ContentCategoryController
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * @author 入云龙
 * @date 2015年9月8日上午9:23:41
 * @version 1.0
 */
@RequestMapping("/content")
@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;

	@RequestMapping("query/list")
	@ResponseBody
	public EUDataGridResult getItemById(@RequestParam(defaultValue = "0") Long categoryId, int rows, int page) {

		return contentService.getContentList(categoryId, page, rows);
	}

}
