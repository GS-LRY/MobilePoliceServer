<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tlkj.model.User"%>
<%
	if (session.getAttribute("currentUser") == null) {
%>
<h1>未登录！</h1>
3秒后跳转到登录页面
<p>
	如果没有跳转，请点<a href="login.jsp">这里</a>
</p>
<%
	response.setHeader("refresh", "3;URL=login.jsp");
		return;
	}
%>
<%
	User currentUser = (User) request.getSession().getAttribute("currentUser");
	Integer userType = currentUser.getUsertype();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="shortcut icon" href="lib/favicon.ico" />
<link rel="bookmark" href="lib/favicon.ico" />
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- 自己的CSS文件 -->
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<title>网内核录</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-body">

			<div class="page-header">
				<h3>网内核录</h3>
			</div>
			<div
				style="width: 800px; height: 600px; margin: 0 auto; text-align: center; padding: 10px 0;">
				<table width="100%" cellpadding="0" cellspacing="0" border="0" id="maintable">
					<tr>
						<td>
							<tablecellspacing="0" cellpadding="8" width="100%">
								<tr>
									<td align="center"><OBJECT
											classid="clsid:F1317711-6BDE-4658-ABAA-39E31D3704D3"
											codebase="SDRdCard.cab#version=1,3,5,0" width="330"
											height="360" align="center" hspace="0" vspace="0" id="idcard"
											name="rdcard"></OBJECT>
										<form name="tcard" id="tcard_form">
											<table align="center">
												<tbody>
													<tr>
														<td>读卡提示信息：</td>
														<td><input type="text" name="tOK"
															style="border: none;" value="暂无读卡提示" /></td>
														<td rowspan="3"><IMG height=128 width=128 border=0
															name=photo src="images/cardhead.png" id=jpgfile></td>
													</tr>
													<tr>
														<td>提示信息：</td>
														<td><input type="text" name="tResult"
															style="border: none;" value="暂无提示信息" /></td>
													</tr>
													<tr>
														<td colspan="2">&nbsp;</td>
													</tr>
												</tbody>

											</table>
											<!--卡信息-->
											<input type="hidden" name="tCardInfo" size="100"
												class="STYLE1">
											<!--设备安全模块号-->
											<input type="hidden" name="tsNum" />
											<!--姓名name-->
											<input type="hidden" name="tName" />
											<!--姓名nameL-->
											<input type="hidden" name="tNameL" />
											<!--性别sex-->
											<input type="hidden" name="tSex" />
											<!--性别sexL-->
											<input type="hidden" name="tSexL" />
											<!--民族nation-->
											<input type="hidden" name="tFolk" />
											<!--民族nationL-->
											<input type="hidden" name="tFolkL" />
											<!--出生Born-->
											<input type="hidden" name="tBirth" />
											<!--出生BornL-->
											<input type="hidden" name="tBirthL" />
											<!--公民身份号码-->
											<input type="hidden" name="tcardID" />
											<!--住址-->
											<input type="hidden" name="tAddr" />
											<!--最新住址-->
											<input type="hidden" name="tnewAddr" />
											<!--签发机关-->
											<input type="hidden" name="tIssue" />
											<!--有效期限Activity-->
											<input type="hidden" name="tBeginEnd" />
											<!--有效期限ActivityL-->
											<input type="hidden" name="tBeginEndL" />
											<!--头像JPGbufferBase64-->
											<input type="hidden" name="jbuff" />
											<!--头像BMPbufferBase64-->
											<input type="hidden" name="bbuff" />
											<!--头像WLTbufferBase64-->
											<input type="hidden" name="wbuff" />
											<!--头像JPGroot-->
											<input type="hidden" name="jroot" />
											<!--头像BMProot-->
											<input type="hidden" name="broot" />
											<!--头像WLTroot-->
											<input type="hidden" name="wroot" />
										</form></td>
								</tr>
								<tr>
									<td align="center">
										<button type="button" class="btn btn-primary" onclick="beginread_onclick()"><span>开始读卡</span></button>
										<button type="button" class="btn btn-primary" onclick="endread_onclick()"><span>停止读卡</span></button>
										<button type="button" class="btn btn-primary" onclick="handread_onclick()"><span>手动读卡</span></button>
										<button type="button" class="btn btn-primary" onclick="SaveCard_onclick()"><span>保存身份证图片</span></button>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>