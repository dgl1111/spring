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
				<th>학부</th>
				<th>학과</th>
				<th>담담 교수</th>
			</tr>
			<tr>
				<td>{{stu.stuNo}}</td>
				<td>{{stu.name}}</td>
				<td>{{stu.college}}</td>
				<td>{{stu.dept}}</td>
				<td>{{stu.profName}}</td>
			</tr>	
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				stuNo : '${stuNo}',
				stu : {}
				
            };
        },
        methods: {
			fnGetStu(){
				var self = this;
				var nparmap = { stuNo : self.stuNo };
				$.ajax({
					url:"school-stuView.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.stu = data.stu;
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