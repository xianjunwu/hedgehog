<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<#--<meta name="baidu-site-verification" content="${webSeo.btoken}"/>-->
	<#--<meta name="google-site-verification" content="${webSeo.gtoken}"/>-->
	<#--<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ &ndash;&gt;-->
	<#--<meta name="description" content="${webSeo.description}">-->
	<#--<meta name="author" content="${webSeo.author}">-->
	<#--<meta name="keywords" content="${webSeo.keywords}"/>-->
	<#--<link rel="icon" href="${commonInfo.pwebFaviconUrl}">-->
	<title>dengyi.pro</title>
	<!-- jquery js -->
	<script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
	<!-- zui css -->
	<link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
	<link rel="stylesheet" href="/static/theme/blue.css">
	<!-- app css -->
	<link rel="stylesheet" href="/static/css/app.css">
	<!-- zui js -->
	<link rel="stylesheet" href="/static/plugins/wizardjs/css/wizard.min.css">
	<script src="/static/plugins/wizardjs/jquery-wizard.min.js"></script>
	<style>
		.indexCenter {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			max-width: 600px;;
		}

		/* 步骤 */
		.wizard-steps {
			display: table;
			width: 100%;
		}

		.wizard-steps > li.current, .wizard-steps > li.done {
			background: #41b3f9;
			color: #ffffff;
		}

		.wizard-steps > li.done {
			background: #7ace4c;
		}

		.wizard-steps > li {
			display: table-cell;
			padding: 10px 20px;
			background: #f7fafc;
		}

		.wizard-steps > li.current h4, .wizard-steps > li.done h4 {
			color: #ffffff;
		}

		.wizard-steps > li.current span, .wizard-steps > li.done span {
			border-color: #ffffff;
			color: #ffffff;
		}

		.wizard-steps > li span {
			border-radius: 100%;
			border: 1px solid rgba(120, 130, 140, 0.13);
			width: 40px;
			height: 40px;
			display: inline-block;
			vertical-align: middle;
			padding-top: 9px;
			margin-right: 8px;
			text-align: center;
		}

		.wizard-content {
			padding: 25px;
			border-color: rgba(120, 130, 140, 0.13);
			margin-bottom: 30px;
		}
	</style>
</head>
<body>
<div class="indexCenter">
	<div class="text-center" style="margin-bottom: 40px">
		<h1>Hedgehog
			<small>网站安装</small>
		</h1>
	</div>
	<div class="wizard" id="installstep">
		<ul class="wizard-steps" role="tablist">
			<li role="tab">
				<h4>
					第一步:管理员信息
				</h4>
			</li>
			<li class="active" role="tab">
				<h4>
					第二步:网站基本信息设置
				</h4>
			</li>
			<li role="tab">
				<h4>
					第三步:网站SEO设置
				</h4>
			</li>
		</ul>
		<div class="wizard-content">
			<div class="wizard-pane" role="tabpanel">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="exampleInputAccount4" class="col-sm-4 required">管理员账号</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="exampleInputAccount4" placeholder="手机号">
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputAccount4" class="col-sm-4 required">管理员昵称</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="exampleInputAccount4" placeholder="昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputAccount4" class="col-sm-4 required">邮箱</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="exampleInputAccount4" placeholder="邮箱">
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword4" class="col-sm-4 required">密码</label>
						<div class="col-md-6 col-sm-10">
							<input type="password" class="form-control" id="exampleInputPassword4" placeholder="密码">
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword4" class="col-sm-4 required">再次输入密码</label>
						<div class="col-md-6 col-sm-10">
							<input type="password" class="form-control" id="exampleInputPassword4">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-primary pull-right" onclick="toNext(0)"> 下一步</button>
						</div>
					</div>
				</div>
			</div>
			<div class="wizard-pane" role="tabpanel">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="siteName" class="col-sm-4 required">网站名</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="siteName" placeholder="网站名">
						</div>
					</div>
					<div class="form-group">
						<label for="slogen" class="col-sm-4 required">网站标语</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="slogen" placeholder="网站标语">
						</div>
					</div>
					<div class="form-group">
						<label for="copyright" class="col-sm-4 required">页脚版权信息</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="copyright" placeholder="页脚版权信息">
						</div>
					</div>
					<div class="form-group">
						<label for="logoUrl" class="col-sm-4 required">网站标志</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="logoUrl" placeholder="网站标志">
						</div>
					</div>
					<div class="form-group">
						<label for="faviconUrl" class="col-sm-4 required">网页图标</label>
						<div class="col-md-6 col-sm-10">
							<input type="password" class="form-control" id="faviconUrl" placeholder="网页图标">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success pull-left" onclick="toNext(-1)"> 上一步</button>
							<button type="button" class="btn btn-primary pull-right" onclick="toNext(1)"> 下一步</button>
						</div>
					</div>
				</div>
			</div>
			<div class="wizard-pane" role="tabpanel">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="keywords" class="col-sm-4 required">网站关键词</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="keywords" placeholder="网站关键词">
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-sm-4 required">网站描述</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="description" placeholder="网站描述">
						</div>
					</div>
					<div class="form-group">
						<label for="author" class="col-sm-4 required">作者</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="author" placeholder="作者">
						</div>
					</div>
					<div class="form-group">
						<label for="gtoken" class="col-sm-4 required">google推送token</label>
						<div class="col-md-6 col-sm-10">
							<input type="text" class="form-control" id="gtoken" placeholder="google推送token">
						</div>
					</div>
					<div class="form-group">
						<label for="btoken" class="col-sm-4 required">百度推送token</label>
						<div class="col-md-6 col-sm-10">
							<input type="password" class="form-control" id="btoken" placeholder="百度推送token">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success pull-left" onclick="toNext(-1)"> 上一步</button>
							<button type="button" class="btn btn-primary pull-right">保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-primary with-icon">
		<i class="icon-inbox"></i>
		<div class="content">
			<span>提示:带星号的内容为必填项</span>
		</div>
	</div>
</div>
<script>
    $(function () {
        $("#installstep").wizard({
            templates: {
                buttons: function buttons() {// 去掉前后的button
                    return '';
                }
            }
        });
    });

    function toNext(i) {

        if (i === 0) {
            //保存用户设置
			$.post("")
        } else if (i === 1) {
			//保存网站基本信息
        } else {
            //保存seo信息
        }
        $("#installstep").wizard('goTo', i + 1);

    }
</script>
<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
</body>
</html>
