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
		<ul style="margin : 20px;">
			<li><a href="#" @click="fnCate('')">전체</a></li>
			<li><a href="#" @click="fnCate(1)">공지사항</a></li>
			<li><a href="#" @click="fnCate(2)">자유게시판</a></li>
			<li><a href="#" @click="fnCate(3)">질문게시판</a></li>
		</ul>
		<div style="margin : 20px;"> 
			<select style="margin-right : 5px;" v-model="searchOption">
				<option value="all">:: 전체 ::</option>
				<option value="title">제목</option>
				<option value="name">작성자</option>
			</select>
			<input placeholder="검색어" v-model="keyword">
			<button @click="fnGetList(1)">검색</button>
		</div> 
		<select v-model="selectSize" @change="fnGetList(1)">
			<option value="5">5개씩</option>
			<option value="10">10개씩</option>
			<option value="15">15개씩</option>
		</select>


		<table>
			<tr>
				<th></th>
				<th>게시글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td><input type="checkbox" v-model="selectItem" :value="item.boardNo"></td>
				<td>{{item.boardNo}}</td>
				<td>
					<a href="javascript:;" @click="fnView(item.boardNo)">{{item.title}}</a>
				</td>
				<td><a href="javascript:;" @click="fnUserView(item.boardNo)">{{item.userName}}</a></td>
				<td>{{item.hit}}</td>
				<td>{{item.cdateTime}}</td>
				<td><button v-if="sessionEmail == item.email || sessionStatus == 'A'"  @click="fnRemove(item.boardNo)">삭제</button></td>
			</tr>	
		</table>
		<button @click="fnCheckRemove">선택 삭제</button>
		<div class="pagination">
		    <button v-if="currentPage > 1">이전</button>
		    <button v-for="page in totalPages" 
			:class="{active: page == currentPage}"
			@click="fnGetList(page)">
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages">다음</button>
		</div>
		<div>
			<button @click="fnInsert">글쓰기</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				keyword : "",
				searchOption : "all",
				category : "",
				sessionId : '${sessionId}',
				sessionEmail : '${sessionEmail}',
				sessionStatus : '${sessionStatus}',
				currentPage: 1, //현재 활성화 되는 페이지      
				pageSize: 5,        
				totalPages: 2,
				selectSize : 5,
				selectItem : []
				
            };
        },
        methods: {
			fnCate(category){	//매개변수 받고
				var self = this;
				self.category = category;	//매개변수 저장
				
				self.fnGetList();	//누르는 순간 리스트 호출. 목록가져오기
			},
            fnGetList(page){
				var self = this;
				self.pageSize = self.selectSize;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page;
				var nparmap = {	//파라미터로 넘기는 값
					keyword : self.keyword,
					searchOption : self.searchOption,
					category : self.category,
					startIndex : startIndex,
					outputNumber : outputNumber,

				};
				$.ajax({
					url:"board-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						self.totalPages = Math.ceil(data.count / self.pageSize);
					}
				});
            },
			fnRemove(num) {
				var self = this;
				var nparmap = {boardNo : num};
				$.ajax({
					url:"board-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						self.fnGetList(1);
					}
				});
			},

			fnCheckRemove(){
				var self = this;
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {
					selectItem : fList,
					testKey : "testValue",
				};
				$.ajax({
					url:"check-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.result);
						self.fnGetList(1); //1page로 가라
					}
				});
			},



			fnView(boardNo){
				//key: boardNo, value : 내가 누른 게시글의 boardNo(pk)

				$.pageChange("board-view.do", {boardNo : boardNo}); 	//jquery로 만들어놨다. 첫번째 파라미터는 url,   {key, value} 두개의 역할은 다르다.
			},
			fnUserView(boardNo){
				//key: boardNo, value : 내가 누른 게시글의 boardNo(pk)

				$.pageChange("user-view.do", {boardNo : boardNo}); 	//jquery로 만들어놨다. 첫번째 파라미터는 url,   {key, value} 두개의 역할은 다르다.
			},
			fnInsert(){
				$.pageChange("board-insert.do", {});
			}
        },
        mounted() {
            var self = this;
			self.fnGetList(self.currentPage);
			
        }
    });
    app.mount('#app');
</script>