<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" /> 
    <meta name="format-detection" content="telephone=no" />  
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>��������ҳ -�����̳�</title>
	<!--����ҳ����ʽ-->	
	<link rel="stylesheet" type="text/css" href="/css/base.css" media="all" />
    <link type="text/css" rel="stylesheet"  href="/css/order-commons.css" source="widget"/>	
	<script type="text/javascript" src="/js/jquery-1.6.4.js"></script>
	<script type="text/javascript" src="/js/base.js"></script>	
	<script type="text/javascript" src="/js/order.common.js"></script>
	<script type="text/javascript" src="/js/jquery.checkout.js"></script>
</head>	<body id="mainframe">
<jsp:include page="commons/shortcut.jsp" />
<!--shortcut end-->

<div class="w w1 header clearfix">
    <div id="logo"><a href="/"><img src="/images/taotao-logo.gif" alt="�����̳�"></a></div>
</div>

<form id="orderForm" class="hide" action="/order/create.html" method="post">
		<input type="hidden" name="paymentType" value="1"/>
		<c:forEach items="${cartList }" var="cart" varStatus="status">
			<c:set var="totalPrice"  value="${ totalPrice + (cart.price * cart.num)}"/>
			<input type="hidden" name="orderItems[${status.index}].itemId" value="${cart.id}"/>
			<input type="hidden" name="orderItems[${status.index}].num" value="${cart.num }"/>
			<input type="hidden" name="orderItems[${status.index}].price" value="${cart.price}"/>
			<input type="hidden" name="orderItems[${status.index}].totalFee" value="${cart.price * cart.num}"/>
			<input type="hidden" name="orderItems[${status.index}].title" value="${cart.title}"/>
			<input type="hidden" name="orderItems[${status.index}].picPath" value="${cart.image}"/>
		</c:forEach>
		<input type="hidden" name="payment" value="<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" minFractionDigits="2" value="${totalPrice/100 }"/>"/>
		<input type="hidden" name="orderShipping.receiverName" value="������"/>
		<input type="hidden" name="orderShipping.receiverMobile" value="15891588888"/>
		<input type="hidden" name="orderShipping.receiverState" value="����"/>
		<input type="hidden" name="orderShipping.receiverCity" value="����"/>
		<input type="hidden" name="orderShipping.receiverDistrict" value="��ƽ��"/>
		<input type="hidden" name="orderShipping.receiverAddress" value="������ xxxxxxxxx"/>
</form>

<!-- main -->
<div id="container">
	<div id="content" class="w">
		<div class="m">
			<div class="mt">
				<h2>��д���˶Զ�����Ϣ</h2>
			</div>
			<div class="mc">
				<div class="checkout-steps">
<!--  /widget/consignee-step/consignee-step.tpl -->
<div class="step-tit">
	<h3>�ջ�����Ϣ</h3>
	<div class="extra-r">
		<a href="#none" class="ftx-05" onclick="use_NewConsignee()">�����ջ���ַ</a>
	</div>
</div>
<div class="step-cont">
	<div class="consignee-list" id="consignee-list1">
		<a href="#none" id="prev" class="prev arrow-btns"></a>
		<a href="#none" id="next" class="next arrow-btns"></a>
		<div id="consignee1" class="list-cont ui-switchable-body">
            <div id="consignee-ret"></div>
   			<ul class="ui-switchable-panel-main" id="consignee-list">
				<!---->
				<li class="ui-switchable-panel" id="consignee_index_137617472"
					selected="selected" style="cursor: pointer;">
					<div class="consignee-item item-selected"
						consigneeId="137617472" id="consignee_index_div_137617472">
						<b></b>
						<div class="user-name">
							<div class="fl">
								<strong limit="4">������</strong>&nbsp;&nbsp;��
							</div>
							<div class="fr">158****8888</div>
							<div class="clr"></div>
						</div>
						<div class="mt10" limit="15">���� ��ƽ�� �廷��������</div>
						<div class="adr-m" limit="30">������ xxxxxxxxx</div>
						<div class="op-btns ar">
							<a href="#none"
								class="ftx-05 mr10 setdefault-consignee hide"
								fid="137617472">��ΪĬ�ϵ�ַ</a> <a href="#none"
								class="ftx-05 mr10 edit-consignee" fid="137617472">�༭</a>
							<a href="#none" class="ftx-05 del-consignee hide"
								fid="137617472">ɾ��</a>
						</div>
					</div>
				</li>
				<!---->
			</ul>
		</div>
	</div>
</div>
<!--/ /widget/consignee-step/consignee-step.tpl -->
	
<!--/ /widget/shopping-list/shopping-list.tpl -->
<div id="shipAndSkuInfo">
  <div id="payShipAndSkuInfo">
    <div class="step-tit">
	<h3>֧����ʽ</h3>
</div>
<div class="step-cont">
	<div class="payment-list" id="">
		<div class="list-cont">
			<ul id="payment-list">
				<input type="hidden" id="instalmentPlan" value="false">
				<li style="cursor: pointer;" onclick="save_Pay(1);">
					<div class="payment-item item-selected online-payment "
						for="pay-method-1" payname="��������" payid="1">
						<b></b> ��������<span class="qmark-icon qmark-tip"
							data-tips="�ͻ����ź����տ֧���ֽ�POS��ˢ����֧Ʊ֧�� <a href='http://help.jd.com/help/distribution-768-2-2813-2863-0-1410707152669.html' target='_blank' class='ftx-05'>�鿴�������ͷ�Χ</a>"></span>
						<!--  span class="qmark-icon qmark-tip" data-tips="����֧����֧�־���������н�ǿ��������������ÿ� <a href='http://help.jd.com/help/question-68.html' target='_blank' class='ftx-05'>�鿴���м��޶�</a>"></span -->
						<!-- span class="qmark-icon qmark-tip" data-tips="�ͻ����ź����տ֧���ֽ�POS��ˢ����֧Ʊ֧�� <a target='_blank' href='http://psfw.jd.com/help/distribution-768.html-2-2825-2893-0-1427094595258.html'>�鿴�������ͷ�Χ</a>"></span -->
					</div>
				</li>
				<li style="cursor: pointer;" onclick="save_Pay(4);">

					<div class="payment-item  online-payment "
						for="pay-method-4" payname="����֧��" payid="4">
						<b></b> ����֧�� <font class="whiteBarSpanClass hide"
							color="#FF6600">[֧�ִ����]</font> <span
							class="qmark-icon qmark-tip"
							data-tips="��ʱ���ʣ�֧�־��������н�ǿ��������������ÿ� <a href='http://www.jd.com/help/onlinepay.aspx' target='_blank' class='ftx-05'> �鿴���м��޶�</a>"></span>
						<!--  span class="qmark-icon qmark-tip" data-tips="����֧����֧�־���������н�ǿ��������������ÿ� <a href='http://help.jd.com/help/question-68.html' target='_blank' class='ftx-05'>�鿴���м��޶�</a>"></span -->
						<!-- span class="qmark-icon qmark-tip" data-tips="��ʱ���ʣ�֧�־��������н�ǿ��������������ÿ� <a target='_blank' href='http://www.jd.com/help/onlinepay.aspx'>�鿴���м��޶�</a>"></span -->
					</div>
				</li>

				<li style="cursor: pointer;" onclick="save_Pay(5); ">

					<div class="payment-item online-payment "
						for="pay-method-5" payname="��˾ת��" payid="5">
						<b></b> ��˾ת�� <span class="qmark-icon qmark-tip"
							data-tips="ͨ����Ǯƽ̨ת�� ת�ʺ�1-3���������ڵ��� <a href='http://help.jd.com/help/question-70.html' target='_blank' class='ftx-05'>�鿴�ʻ���Ϣ</a>"></span>
						<!--  span class="qmark-icon qmark-tip" data-tips="����֧����֧�־���������н�ǿ��������������ÿ� <a href='http://help.jd.com/help/question-68.html' target='_blank' class='ftx-05'>�鿴���м��޶�</a>"></span -->
						<!-- span class="qmark-icon qmark-tip" data-tips="ͨ����Ǯƽ̨ת�� ת�ʺ�1-3���������ڵ��� <a target='_blank' href='http://help.jd.com/help/question-70.html'>�鿴�ʻ���Ϣ</a>"></span -->
					</div>
				</li>
				<li style="cursor: pointer;" onclick="save_Pay(2); ">

					<div class="payment-item  online-payment "
						for="pay-method-2" payname="�ʾֻ��" payid="2">
						<b></b> �ʾֻ�� <span class="qmark-icon qmark-tip"
							data-tips="ͨ����Ǯƽ̨�տ� ����1-3�������յ��� <a href='http://help.jd.com/help/question-69.html' target='_blank' class='ftx-05'>�鿴����</a>"></span>
						<!--  span class="qmark-icon qmark-tip" data-tips="����֧����֧�־���������н�ǿ��������������ÿ� <a href='http://help.jd.com/help/question-68.html' target='_blank' class='ftx-05'>�鿴���м��޶�</a>"></span -->
						<!-- span class="qmark-icon qmark-tip" data-tips="ͨ����Ǯƽ̨�տ�  ����1-3�������յ��� <a target='_blank' href='http://help.jd.com/help/question-69.html'>�鿴����</a>"></span -->
					</div>
				</li> 
				<!--div id="shipment"></div--> 
				<script>
					$('.online-payment').hover(function() {
						$(this).addClass('payment-item-hover');
					}, function() {
						$(this).removeClass('payment-item-hover');
					});
				</script>
			</ul>
		</div>
	</div>
</div>
<!--/ /widget/payment-step/payment-step.tpl -->
<div class="step-tit">
	<h3>�ͻ��嵥</h3>
	<div class="extra-r">
					<a href="/cart/show.html" id="cartRetureUrl" class="return-edit ftx-05">�����޸Ĺ��ﳵ</a>
			</div>
</div>
<div class="step-cont" id="skuPayAndShipment-cont">
	<!--�����Ʒ�嵥  zhuqingjie -->
<div class="shopping-lists" id="shopping-lists"> 
<div class="shopping-list ABTest">
	<div class="goods-list">
     <!--���ͷ�ʽ-->
    <h4 class="vendor_name_h" id="0">�̼ң������̳�</h4>		         
    <div class="goods-suit goods-last">
	 <c:forEach items="${cartList }" var="cart">
		<div class="goods-item goods-item-extra">

			<div class="p-img">
				<a target="_blank" href="/item/${cart.id}.html">
					<img src="${cart.image}" alt="">
				</a>
			</div>
			<div class="goods-msg">
				<div class="p-name">
					<a href="/item/${cart.id}.html" target="_blank">
						${cart.title } 
					</a>
				</div>
				<div class="p-price">
					<!--����Ԥ�۽����ʾ begin   Ԥ�۷ֽ׶�֧�����ͣ�1��һ����ȫ��֧����2��һ���ݶ���֧��(ȫ��򶨽��ѡ)��3�������ݽ�����֧���� -->
					<strong>��<fmt:formatNumber
							groupingUsed="false" maxFractionDigits="2"
							minFractionDigits="2" value="${cart.price / 100 }" /></strong>
					<!--����Ԥ�۽����ʾ end-->
					<span class="ml20"> x${cart.num} </span> 
					<span class="ml20 p-inventory" skuId="11555193">�л�</span>
				</div>
				<i class="p-icon p-icon-w"></i><span class="ftx-04">7���������˻�</span>
			</div>
			<div class="clr"></div>
		</div>
	</c:forEach>
	</div>                   
</div>
<!--goods-list ����-->
<div class="dis-modes">
	<!--���ͷ�ʽ-->
	<div class="mode-item mode-tab">
		<h4>
			���ͷ�ʽ����<a id="jd-goods-item" class="ftx-05 alink"
				href="#none">��Ӧ��Ʒ</a>��
		</h4>
		<div class="mode-tab-nav">
			<ul>
				<li class="mode-tab-item " id="jd_shipment_item"
					onclick="doSwithTab('pay')"><span
					id="jdShip-span-tip" class="m-txt">���Կ��<i
						class='qmark-icon qmark-tip'
						data-tips='�����Թ�˾�������ͣ��ٶȺܿ죬����������ˢ���������'></i></span><b></b></li>
			</ul>
		</div>
	</div>
</div>
<!--dis-modes ����-->
<div class="clr"></div>
<div class="freight-cont">
	<strong class="ftx-01" style="color: #666"
			freightByVenderId="0" popJdShipment="false">���˷�</strong>
</div>
</div>	
				
</div>
</div>  
</div>
</div>			
<!--  /widget/invoice-step/invoice-step.tpl -->
<div class="step-tit">
	<h3>��Ʊ��Ϣ</h3>
</div>
<div class="step-content">
	<div id="part-inv" class="invoice-cont">
		<span class="mr10"> ��ͨ��Ʊ�����ӣ� &nbsp; </span><span class="mr10">
			���� &nbsp; </span><span class="mr10"> &nbsp; </span> ��ϸ <a href="#none"
			class="ftx-05 invoice-edit" onclick="edit_Invoice()">�޸�</a>
	</div>
</div>
		<div class="order-summary">
			<!--  Ԥ�� ����֧��չ�ַ�ʽ begin -->
			<div class="statistic fr">
				<div class="list">
					<span>
						����Ʒ��
					</span> 
					<em class="price" id="warePriceId">��<fmt:formatNumber value="${totalPrice / 100}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></em>
				</div>
				<div class="list">
					<span>�˷ѣ�</span> <em class="price" id="freightPriceId">
						��0.00</em>
				</div>
				<div class="list">
					<span>Ӧ���ܶ</span> <em class="price" id="sumPayPriceId">
						��<fmt:formatNumber value="${totalPrice / 100}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></em>
				</div>
			</div>
			<div class="clr"></div>
		</div>
	</div>
</div>
<!--/ /widget/order-summary/order-summary.tpl -->
					
<!--  /widget/checkout-floatbar/checkout-floatbar.tpl -->
<div class="trade-foot">
  <div id="checkout-floatbar" class="group">
    <div class="ui-ceilinglamp checkout-buttons">
      <div class="sticky-placeholder hide" style="display: none;">
      </div>
      <div class="sticky-wrap">
      	<div class="inner">
          <button type="submit" class="checkout-submit btn-1" 
          		  id="order-submit"	onclick="$('#orderForm').submit()">
          	�ύ����
          </button>
                    <span class="total">Ӧ���ܶ<strong id="payPriceId">��<fmt:formatNumber value="${totalPrice / 100}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></strong>
          </span>
                    <span id="checkCodeDiv"></span>
          <div class="checkout-submit-tip" id="changeAreaAndPrice" style="display: none;">
            ���ڼ۸���ܷ����仯����˶Ժ����ύ����
          </div>
          <div style="display:none" id="factoryShipCodShowDivBottom" class="dispatching">
            ������Ʒ�������ʽ�������������͡�����������տȻ���̷�����
          </div>
        </div>
        <span id="submit_message" style="display:none" class="submit-error" ></span>
		  	<div class="submit-check-info" id="submit_check_info_message" style="display:none"></div>
    	</div>
    </div>
  </div>
  
        </div>
      </div>
    </div>

  </div>
</div>

<!-- /main -->
	<jsp:include page="commons/footer.jsp" />
	</body>
</html>