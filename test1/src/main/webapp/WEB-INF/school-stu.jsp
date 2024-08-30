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
				<th>학번</th>
				<th>이름</th>
				<th>아이디</th>
				<th>학년</th>
				<th>주민번호</th>
				<th>삭제</th>
				
			</tr>
			<tr v-for="item in list">
				<td><a href="#" @click="fnSchoolInfo(item.stuNo)">{{item.stuNo}}</a></td>
				<td><a href="#" @click="fnStuInfo(item.stuNo)">{{item.name}}</a></td>
				<td>{{item.id}}</td>
				<td>{{item.grade}}</td>
				<td>{{item.jumin}}</td>
				<td><button @click="fnRemove(item.stuNo)">삭제</button></td>
			</tr>	
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {	
		
				};
				$.ajax({
					url:"school-stu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            },
			fnSchoolInfo(stuNo){
				$.pageChange("stu-schoolView.do", {stuNo : stuNo});
			},
			fnStuInfo(stuNo){
				$.pageChange("school-stuView.do", {stuNo : stuNo});
			},
			fnRemove(stuNo){
				var self = this;
				var nparmap = {stuNo : stuNo};
				$.ajax({
					url:"school-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.fnGetList();
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