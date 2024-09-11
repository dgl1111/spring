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
        <button @Click="fnApi">클릭</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {};
        },
        methods: {
            fnApi(){
                var self = this;
				var nparmap = {};
                var xhr = new XMLHttpRequest();
                var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
                var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'26Jt6WG3w3Ea4on0SOc67nMTWJlJ0CwWzH2XHxhuBHYzBkwABUcem88lB39hBrLvCcp7P%2BDMdLp0nBvkx9QUYQ%3D%3D'; /*Service Key*/
                queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
                queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
                queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
                queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
                queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
                queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
                queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
                xhr.open('GET', url + queryParams);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
                        var responseJson = JSON.parse(this.responseText);						        
						var items = responseJson.response.body.items.item;
						for (var i = 0; i < items.length; i++) {
							var item = items[i];
							console.log(item); 
						}
                    }
                };
				
                xhr.send('');
            }
        },
        mounted() {
            var self = this;
			self.fnApi();
        }
    });
    app.mount('#app');
</script>
               
