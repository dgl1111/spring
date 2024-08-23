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
</style>
<body>
	<div id="app">
		<input type="text" placeholder="학번" v-model="stuNo">
		<button @click="fnSearch">검색</button>
		<hr>
		{{stu}}
		<hr>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				stu : {},
				stuNo : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"search.dox", 
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						//self.stu = data.stu;
					}
				});
            },
			fnSearch(){
				var self = this;
				var nparmap = {stuNo : self.stuNo};
				console.log(self.stuNo);
				$.ajax({
					url:"search.dox", 
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						self.stu = data.stu;
					}
				});
            },
        },
        mounted() {
            var self = this;
			//self.fnGetList();	
        
		}, 
    });
    app.mount('#app');
</script>