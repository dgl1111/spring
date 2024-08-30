<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table {
		margin : 20px;
	}
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse: collapse;
	}
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>학생 학번</th>
				<th>이름</th>
				<th>아이디</th>
				<th>학년</th>
			</tr>
			<tr>
				<td>{{info.stuNo}}</td>
				<td>{{info.name}}</td>
				<td>{{info.id}}</td>
				<td>{{info.grade}}</td>
			</tr>	
		</table>
		<div><button @click="fnUpdate(info.stuNo)">수정</button></div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				stuNo : '${stuNo}',
				info : {}
				
            };
        },
        methods: {
			fnGetStu(){
				var self = this;
				var nparmap = { stuNo : self.stuNo };
				$.ajax({
					url:"stu-schoolView.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.info = data.info;
					}
				});
	           },
			   
		   fnUpdate(stuNo) {
				var self = this;
				var nparmap = {stuNo : stuNo};
				$.ajax({
					url:"schoolStu-update.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						self.fnGetList();
					}
				});
		},
		
        },
        mounted() {
			var self = this;
			self.fnGetStu();
            
        }
    });
    app.mount('#app');
</script>