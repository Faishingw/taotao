package com.taotao.service;

import com.taotao.common.pojo.EUDataGridResult;
import com.taotao.common.pojo.TaotaoResult;

public interface ContentService {

	TaotaoResult insertContent(Long parentId, String name);

	TaotaoResult updateContent(Long nodeId, String nodeName);

	TaotaoResult deleteContent(Long id, Long parentId);

	EUDataGridResult getContentList(Long parentId, int page, int rows);
}
