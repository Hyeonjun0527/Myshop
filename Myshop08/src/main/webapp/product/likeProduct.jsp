<!-- ��ǰ�����ȸ -->
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ������Ʈ���� REQUEST :: list,resultPage,search,   PARAM :: menu -- -->
<%-- ${param.menu}

${requestScope.list}
${requestScope.resultPage}
${requestScope.search} --%>
<html>
<head>
<title>�� ����Ʈ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link href="/css/listProduct.css" rel="stylesheet" type="text/css">

</head>

<body bgcolor="#ffffff" text="#000000">
<script>
	let type = '${search.searchType}';//������ ���� �ƹ��͵� ���� ������ ��.''�� ��
	let searchBoundFirst = '${search.searchBoundFirst}';//'0'�� ��
	let searchBoundEnd = '${search.searchBoundEnd}';
	console.log('jsp���� searchBoundFirst',searchBoundFirst);
	console.log('jsp���� searchBoundEnd',searchBoundEnd);
	console.log('jsp���� type', type);
	</script>
	
	<div style="width: 98%; margin-left: 10px;">
<%--�� ���±׸� �����ϴ� �� 1,2,3,4Ŭ���̳� �˻��Ҷ�����. --%>
		<form id="detailForm" name="detailForm" action="/cookie/createLike?menu=${param.menu}"  method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">
								�� ����Ʈ
								</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>
<div class="container">
<%--
<input type="radio"  id="searchType1"  name="searchType"  onclick="javascript:fncGetListNorm('${resultPage.currentPage}');"/>
<label for="searchType1"  class="button">�Ϲ� �˻�</label>

<input type="radio"  id="searchType2"  name="searchType"  onclick="javascript:fncGetListPriceDesc('${resultPage.currentPage}');"/>
<label for="searchType2"  class="button">���� ������ �˻�</label>

<input type="radio"  id="searchType3"  name="searchType"  onclick="javascript:fncGetListPriceAsc('${resultPage.currentPage}');"/>
<label for="searchType3"  class="button">���� ������ �˻�</label>

<input type="text"  id="searchBound1"  name="searchBoundFirst"/>
����

<input type="text"  id="searchBound2"  name="searchBoundEnd" />
����

<a id="searchBoundLink" href="javascript:fncGetList('${resultPage.currentPage}');">�˻�</a>
 --%>
</div>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${products.size()} �Ǽ�
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
					<td class="ct_line02"></td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${products}">
				
				
					<c:set var="i" value="${i+1 }"/>
					<tr class="ct_list_pop">
								<td align="center">		<button style="border: 0px; padding: 0px;">
		<div style="text-align: center;">
			<a href="/cookie/removeLike?count=one&prodNo=${product.prodNo}"
				style="display: inline-block; background-color: #4CAF50; color: white; padding: 7px 10px; text-align: center; text-decoration: none; font-size: 8px; border-radius: 5px; cursor: pointer;">
				����</a>
		</div>
	</button>${i}</td>
								<td></td>
								<c:if test="${!(product.proTranCode=='a')}">
									<td align="left">${product.prodName}</td>
								</c:if>
								<c:if test="${product.proTranCode=='a'}">
									<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a></td>
								</c:if>
								<td></td>
								<td align="left">${product.price }</td>
								<!-- ���� -->
								<td></td>
								<td align="left">${product.regDate}</td>
								<td></td>
								<c:if test="${product.proTranCode!=null}">

										<c:set var="resultA" value="${product.proTranCode.trim() == 'a' ? '�Ǹ���' : ''}"/>

										<c:set var="resultB" value="${product.proTranCode.trim() == 'b' ? '���ſϷ�' : ''}"/>
										<c:set var="resultB2" value=""/>
										<c:if test="${param.menu == 'manage' || param.menu == 'ok'}">
										    <c:set var="resultB2" value="${product.proTranCode.trim() == 'b' ? '����ϱ�' : ''}"/>
										</c:if>
										<c:set var="resultC" value="${product.proTranCode.trim() == 'c' ? '�����' : ''}"/>
										<c:set var="resultD" value="${product.proTranCode.trim() == 'd' ? '��ۿϷ�' : ''}"/>
										
								<td align="left">${resultA}${resultB}${(!empty resultB) ? '&nbsp;&nbsp;' : ''}<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&navigationPage=listProduct&menu=manage">${resultB2}</a>${resultC}${resultD}</td>
								</c:if>
						<tr/>
						<tr>
								<td colspan="11" bgcolor="D6D7D6" height="1"></td>
						</tr>
						
				</c:forEach>
				
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<%--
				<tr>
		<td align="center">
		
		   < type="hidden" id="currentPage" name="currentPage" value=""/>

			<jsp:include page = "../common/pageNavigator.jsp"/>
		
    	</td>
					
				</tr>
				 --%>
			</table>
			<!--  ������ Navigator �� -->
		</form>

	</div>
		<button style="border: 0px; padding: 0px;">
		<div style="text-align: center;">
			<a href="/cookie/removeLike?count=all"
				style="display: inline-block; background-color: #4CAF50; color: white; padding: 7px 10px; text-align: center; text-decoration: none; font-size: 16px; border-radius: 5px; cursor: pointer;">��ü
				����</a>
		</div>
	</button>
	<script type="text/javascript"  src="/javascript/variousSearch.js"></script>
	
</body>
</html>