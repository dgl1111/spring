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
	 <div>이름 : {{user.userName}}</div>
	 <div>아이디 : {{user.userId}}</div>
	 <div>이메일 : {{user.email}}</div>
	 <button @click="fnRemove">삭제</button>	<!--파라미터 보내는거 없다. 그냥 이거 지운다.item X-->

	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId : '${userId}', //request에 있는 걸 쉽게 꺼낼수있는 방법
				user : {} //변수
            };
        },
        methods: {
			fnView(){
				var self = this;
				var nparmap = {userId : self.userId}; //
				$.ajax({
					url:"user-view.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data); //검색결과 view에 담았다. serviceImpl에서
						self.user = data.list;
					}
				});	
			},
			fnRemove(){
				var self = this;
				var nparmap = {userId : self.userId};	//key value-> this에 있는게 아니라 메소드에 있는거
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
						$.pageChange("user-list.do", {});
					}
				});
	        }

        },	
        mounted() {
			var self = this;
        	self.fnView();
        }
    });
    app.mount('#app');
</script>