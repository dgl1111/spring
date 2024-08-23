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

	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동"
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"ok.dox", // controller로 url:"ok.dox"호출
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { // 결과가 데이터로 담긴다
						console.log(data);
						//self.stu = data.stu;
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnGetList();	//시작할때 self.fnGetList();가 호출
        }
    });
    app.mount('#app');
</script>