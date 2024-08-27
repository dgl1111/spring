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
	제목 : {{view.title}}
	내용: {{view.contents}}
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				boardNo : '${boardNo}', //request에 있는 걸 쉽게 꺼낼수있는 방법
				view : {} //변수
            };
        },
        methods: {
			fnView(){
				var self = this;
				var nparmap = {boardNo : self.boardNo};
				$.ajax({
					url:"board-view.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data); //검색결과 view에 담았다. service에서
						self.view = data.view;
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