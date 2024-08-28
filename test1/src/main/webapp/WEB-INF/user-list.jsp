<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>user 리스트 출력</title>
</head>
<style>
	table, div {
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
		<button @click="fnBoardList">게시글목록(userController에서 작성)</button>
		<div>
		<input placeholder="검색" v-model="keyword">
		<button @click="fnUserList">검색</button>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in userList">
				<td><a href="javascript:;" @click="fnUserId(item.userId)">{{item.userId}}</a></td>
				<td>{{item.userName}}</td>
				<td>{{item.email}}</td>
				<td><button @click="fnRemove(item.userId)">삭제</button></td>
			</tr>	
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList : [],
				keyword : "" //변수선언
								
            };
        },
        methods: {
			fnUserList(){
				var self = this;
				var nparmap = {keyword : self.keyword}; //주소 호출하면서 원하는 값을 파라미터 넘길수있다.
				$.ajax({
					url:"user-list.dox", // tbl_user의 list 받을 주소만들기. controller로 url:".dox"호출
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { // 결과가 데이터로 담긴다. 
						console.log("userList ==> ", data); //data에는 key값 list와 result가 담겨있다.
						self.userList = data.list;
					}
				});
            },
			fnBoardList(){
					var self = this;
					var nparmap = {};
					$.ajax({
						url:"boardList.dox", // tbl_user의 list 받을 주소만들기. controller로 url:".dox"호출
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { // 결과가 데이터로 담긴다. 
							console.log("boardList ==> ", data); //data에는 key값 list와 result가 담겨있다.
						}
					});
			},
			fnRemove(userId){
				console.log(userId);
				var self = this;
				var nparmap = {userId : userId};	//key value-> this에 있는게 아니라 메소드에 있는거
				if(!confirm("삭제하시겠습니까?")){
					return;
				};
				$.ajax({
					url:"remove-list.dox", 
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log("remove ==> ", data);
						alert("삭제되었습니다.");
						self.fnUserList(); //목록가져오는 
					}
				});
            },
			fnUserId(userId){
				$.pageChange("user-view.do", {userId : userId});
			}
        },
        mounted() {
			var self = this;
			self.fnUserList();
        }
    });
    app.mount('#app');
</script>