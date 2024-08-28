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
			아이디 : <input placeholder="아이디">
			<button>중복체크</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
			
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>