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
	table{
		margin : 10px;
	}
	table, tr, th, td{
		padding : 10px;
		border : 1px solid black;
		border-collapse : collapse;
		text-align : center;
	}
</style>
<body>
	<div id="app">
		<div style="margin: 10px;">
		<input type="checkbox" value="10">ACCOUNTING
		<input type="checkbox" value="20">RESEARCH
		<input type="checkbox" value="30">SALES
		<input type="checkbox" value="40">OPERATIONS
	</div>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직급</th>
				<th>부서명</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.EMPNO}}</td>
				<td>{{item.ENAME}}</td>
				<td>{{item.JOB}}</td>
				<td>{{item.DEPTNO}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				list : []	
            };
        },
        methods: {
            fnGetList(){
				var self = this;

				var nparmap = {
					 
				};
				$.ajax({
					url:"empList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>