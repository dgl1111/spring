<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			아이디 : <input type="text" v-model="id">
		</div>	
		<div>
			비밀번호 : <input type="text" v-model="pwd">
		</div>
		<button @click="fnLog">로그인</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				id : "",
				pwd : ""
            };
        },
        methods: {
			fnLog(){
				var self = this;
				var nparmap = {
					id : self.id,
					pwd :  self.pwd	
				};
				$.ajax({
					url:"login.dox", 
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {  
						console.log(data);
						if(data.code == 200){
							$.pageChange("board-list.do",{});
						}else{
							alert(data.message);
						}
							
					}
					
				});
			},
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>