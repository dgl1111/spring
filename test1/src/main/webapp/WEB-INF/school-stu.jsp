<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
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

	.pagination {
	    justify-content: center;
	    align-items: center;
	    margin: 20px 0;
	}
	.pagination button {
	    background-color: #f8f9fa;
	    border: 1px solid #dee2e6;
	    color: #007bff;
	    padding: 8px 12px;
	    margin: 0 2px;
	    cursor: pointer;
	    transition: background-color 0.3s, color 0.3s;
	    border-radius: 4px;
	}

	.pagination button:hover {
	    background-color: #007bff;
	    color: white;
	}

	.pagination button.active {
	    background-color: #007bff;
	    color: white;
	    cursor: default;
	}

	.pagination button:disabled {
	    background-color: #e9ecef;
	    color: #6c757d;
	    cursor: not-allowed;
	    border: 1px solid #dee2e6;
	}

	.pagination button:not(.active):not(:disabled):hover {
	    background-color: #0056b3;
	    color: white;
	}
</style>
<body>
	
	<div id="app">
		<i class="fa-solid fa-magnifying-glass"></i>
		<select v-model="selectSize" @change="fnGetList(1)">
			<option value="5">5개씩</option>
			<option value="10">10개씩</option>
			<option value="20">20개씩</option>
		</select>
		<span class="material-symbols-outlined">search</span>

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
		
		<div class="pagination">
		    <button v-if="currentPage > 1">이전</button>
		    <button v-for="page in totalPages" 
			:class="{active: page == currentPage}" 
			@click="fnGetList(page)">
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages">다음</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				currentPage: 1,      
				pageSize: 10,        
				totalPages: 2,
				selectSize : 10

				
            };
        },
        methods: {
            fnGetList(page){
				var self = this;
				self.pageSize = self.selectSize;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page;
				var nparmap = {	
					startIndex : startIndex,
					outputNumber : outputNumber 
		
				};
				$.ajax({
					url:"school-stu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						self.totalPages = Math.ceil(data.count/self.pageSize)
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
			self.fnGetList(self.currentPage);
        }
    });
    app.mount('#app');
</script>