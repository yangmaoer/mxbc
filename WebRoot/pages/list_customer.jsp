<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); 
%>
<html lang="zh-CN" style="height:auto">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>客户信息列表</title>
<link rel="icon" href="<c:url value='/logo/logo.png'/>">
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/dashboard.css'/>" rel="stylesheet">
<script src="<c:url value='/js/html5shiv.min.js'/>"></script>
<script src="<c:url value='/js/respond.js'/>"></script>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
	function choose_fail(value){
		if(value == 5){
			$("#check_select_tr").attr("style","");
		}else{
			$("#check_select_tr").attr("style","display:none");
		}
	}
	function update_customer(num,id,t_name,t_phone){
		$("#up_c_id").val(id);
		$("#up_c_num").val($("#l_c_num_"+num).text());
		$("#up_c_name").val($("#l_c_name_"+num).text());
		$("#up_c_sex").val($("#l_c_sex_"+num).val());
		$("#up_c_phone").val($("#l_c_phone_"+num).text());
		$("#up_c_address").val($("#l_c_address_"+num).text());
		$("#up_c_area").val($("#l_c_area_"+num).text());
		$("#up_w_name").val($("#l_w_name_"+num).text());
		$("#up_w_phone").val($("#l_w_phone_"+num).text());
		$("#up_c_state").val($("#l_c_state_"+num).val());
		if($("#up_c_state").val() == 5){
			var c_fail_cause_l = $("#l_c_fail_cause_"+num).val().split(", ");
			$("#up_c_fail_cause").val(c_fail_cause_l);
		}
		$("#up_c_time").val($("#l_c_time_"+num).text());
		if($("#up_c_state").val() == 5){
			$("#check_select_tr").attr("style","");
		}else{
			$("#check_select_tr").attr("style","display:none");
		}
		$("#up_t_name").val(t_name);
		$("#up_t_phone").val(t_phone);
	}
	function deleteCus(id) {
		if (confirm("删除确认")) {
			$("#del_c_id").val(id);
			deleteCustomerForm.submit();
		}
	}
    </script>
</head>
<body
	style="padding:0px;background:#f1f2f3 url(<%=request.getContextPath()%>/back_pic/back_pic.jpg);height:auto">

	<div class="modal fade" id="add_update_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  align="left">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="add_update_ModalLabel">修改该客户信息：</h4>
	      </div>
	      <div class="modal-body">
	        <form action="updateCusAction.action" method="post">
	        	<table width="100%" style="line-height:32px">
			  	<input type="hidden" name="c_id" id="up_c_id"/>
			  	<tr>
			  		<td width="125">编号</td>
			  		<td>
			  			<input readonly id="up_c_num" name="c_num" style="line-height:22px;font-size:13px;background-color:#f1f2f3">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">客户姓名</td>
			  		<td>
			  			<input id="up_c_name" name="c_name" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">客户性别</td>
			  		<td>
						<select name="c_sex" id="up_c_sex">
							<option value="0">先生</option>
							<option value="1">女士</option>
						</select>
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">客户电话</td>
			  		<td>
			  			<input id="up_c_phone" name="c_phone" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">店面地址</td>
			  		<td>
			  			<input id="up_c_address" name="c_address" style="line-height:22px;size:120;width:300px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">所属区域</td>
			  		<td>
			  			<input id="up_c_area" name="c_area" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td width="125">区域经理姓名</td>
			  		<td>
			  			<input id="up_w_name" name="w_name" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">区域经理电话</td>
			  		<td>
			  			<input id="up_w_phone" name="w_phone" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">投资顾问姓名</td>
			  		<td>
			  			<input id="up_t_name" name="t_name" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">投资顾问电话</td>
			  		<td>
			  			<input id="up_t_phone" name="t_phone" style="line-height:22px;font-size:13px">
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">信息状态</td>
			  		<td>
			  			<select name="c_state" id="up_c_state"  onchange="choose_fail(this.options[this.selectedIndex].value)">
			  				<option value="0">派单中</option>
			  				<option value="1">审核任务已派发，区域经理将为您审核店面</option>
			  				<option value="2">审核中，请耐心等待</option>
			  				<option value="3">审核完成，资料回传评定中，请耐心等待</option>
			  				<option value="4">审核通过</option>
			  				<option value="5">审核未通过</option>
			  			</select>
			  		</td>
			  	</tr>
			  	<tr  id="check_select_tr" line-height="32px" style="display:none">
			  		<td width="125">未通过原因（CTRL可多选）</td>
			  		<td>
			  			<select id="up_c_fail_cause" multiple="true" name="c_fail_cause" value="0,3">
							<option id="c_cause_0" value="0">商圈不成熟</option>  
							<option id="c_cause_1" value="1">店面位置偏，客流量不足</option>
							<option id="c_cause_2" value="2">房型不符合标准</option> 
							<option id="c_cause_3" value="3">房屋面积不达标</option>
							<option id="c_cause_4" value="4">三相电、上下水不达标</option>
							<option id="c_cause_5" value="5">与现有店面冲突</option>
							<option id="c_cause_6" value="6">与市政规划冲突</option>
							<option id="c_cause_7" value="7">与公司经营理念相悖</option>
							<option id="c_cause_8" value="8">店面租金过高，回本周期长，投资风险大</option>
							<option id="c_cause_9" value="9">房屋租赁存在风险</option>
						</select>
			  		</td>
			  	</tr>
			  	<tr line-height="32px">
			  		<td width="125">更新时间</td>
			  		<td>
			  			<input readonly id="up_c_time" name="c_time" style="line-height:22px;font-size:13px;background-color:#f1f2f3">
			  		</td>
			  	</tr>
			  </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submit" class="btn btn-primary">保存</button>
	      </div>
	        </form>
	    </div>
	  </div>
	</div>

	<nav class="navbar navbar-default" style="margin-top:2%;height:auto">
		<div class="container-fluid" style="height:auto">
			<div class="main" style="height:auto">
				<h2 class="sub-header">客户信息列表</h2>
				<div class="table-responsive">
					<table class="table table-striped" style="font-size: 8px">
						<thead>
							<tr>
								<th>编号</th>
								<th>客户姓名</th>
								<th>客户性别</th>
								<th>客户电话</th>
								<th>店面地址</th>
								<th>所属区域</th>
								<th>区域经理姓名</th>
								<th>区域经理电话</th>
								<th>当前状态</th>
								<th>更新时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody style="font-size:8px">
							<c:forEach var="c" items="${list}">
								<tr style="font-size:8px">
									<td style="font-size:8px" id="l_c_num_${c.c_num}">${c.c_num}</td>
									<td id="l_c_name_${c.c_num}">${c.c_name}</td>
									<input type="hidden" id="l_c_sex_${c.c_num}" value="${c.c_sex}"/>
									<c:if test="${c.c_sex == 0}">
										<td>先生</td>
									</c:if>
									<c:if test="${c.c_sex == 1}">
										<td>女士</td>
									</c:if>
									<td id="l_c_phone_${c.c_num}">${c.c_phone}</td>
									<td id="l_c_address_${c.c_num}">${c.c_address}</td>
									<td id="l_c_area_${c.c_num}">${c.c_area}</td>
									<td id="l_w_name_${c.c_num}">${c.w_name}</td>
									<td id="l_w_phone_${c.c_num}">${c.w_phone}</td>
									<input type="hidden" id="l_c_state_${c.c_num}" value="${c.c_state}"/>
									<c:if test="${c.c_state == 0}">
										<td id="td_c_state_${c.c_state}" style="color:blue">派单中</td>
									</c:if>
									<c:if test="${c.c_state == 1}">
										<td id="td_c_state_${c.c_state}" style="color:blue">审核任务已派发，区域经理${c.w_name}将审核店面</td>
									</c:if>
									<c:if test="${c.c_state == 2}">
										<td id="td_c_state_${c.c_state}" style="color:blue">审核中，请耐心等待</td>
									</c:if>
									<c:if test="${c.c_state == 3}">
										<td id="td_c_state_${c.c_state}" style="color:blue">审核完成，资料回传评定中，请耐心等待</td>
									</c:if>
									<c:if test="${c.c_state == 4}">
										<td id="td_c_state_${c.c_state}" style="color:green">审核通过</td>
									</c:if>
									<c:if test="${c.c_state == 5}">
										<td id="td_c_state_${c.c_state}"style="color:red">审核未通过</td>
									</c:if>
									<td id="l_c_time_${c.c_num}">${c.c_time}</td>
									<input type="hidden" id="l_c_fail_cause_${c.c_num}" value="${c.c_fail_cause}"/>
									<td>
										<button type="button" class="btn btn-primary btn-xs" onclick="update_customer(${c.c_num},${c.c_id},'${c.t_name}',${c.t_phone})" data-toggle="modal" data-target="#add_update_Modal">修改</button>
										&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-danger btn-xs" onclick="deleteCus(${c.c_id})">删除</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</nav>
	<form name="deleteCustomerForm" method="post" action="deleteCusAction.action">
		<input id="del_c_id" type="hidden" name="c_id"/>
	</form>
</body>
</html>