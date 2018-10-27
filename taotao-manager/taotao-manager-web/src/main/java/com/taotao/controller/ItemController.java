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
import com.taotao.service.ItemCatService;
import com.taotao.service.ItemService;

/**
 * 鍟嗗搧绠＄悊Controller
 * <p>
 * Title: ItemController
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * @author 鍏ヤ簯榫�
 * @date 2015骞�9鏈�2鏃ヤ笂鍗�10:52:46
 * @version 1.0
 */

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private ItemCatService itemCatService;

	// @Autowired
	// private Itemparam

	@RequestMapping("/item/{itemId}")
	@ResponseBody
	public TbItem getItemById(@PathVariable Long itemId) {
		TbItem tbItem = itemService.getItemById(itemId);
		return tbItem;
	}

	@RequestMapping("/item/list")
	@ResponseBody
	public EUDataGridResult getItemList(Integer page, Integer rows) {
		EUDataGridResult result = itemService.getItemList(page, rows);
		return result;
	}

	@RequestMapping(value = "/item/save", method = RequestMethod.POST)
	@ResponseBody
	private TaotaoResult createItem(TbItem item, String desc, String itemParams) throws Exception {
		TaotaoResult result = itemService.createItem(item, desc, itemParams);
		return result;
	}

	@RequestMapping("/item/cat/list")
	@ResponseBody
	public List<EUTreeNode> getCatList(@RequestParam(value = "id", defaultValue = "0") long cid) {
		return itemCatService.getCatList(cid);
	}

	@RequestMapping("/item/param/list")
	@ResponseBody
	public TaotaoResult getItemParamList(Integer page, Integer rows) {
		// TaotaoResult result=itemParamService.
		// return itemCatService.getCatList(page, rows);
		return null;
	}
	// public EUDataGridResult getItemParamList(Integer page, Integer rows) {
	// return itemCatService.getCatList(page, rows);
	// }
}
