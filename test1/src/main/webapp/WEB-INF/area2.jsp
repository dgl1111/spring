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
		
		<div style="margin : 20px;"> 
			도/시<select style="margin-right : 5px;" v-model="si" @change="fnArea('gu')">
				<option value="">:: 선택 ::</option>
				<option v-for="item in siList" :value="item.si">{{item.si}}</option>
			</select>
            구/군<select style="margin-right : 5px;" v-model="gu" @change="fnArea('dong')">
				<option value="">:: 선택 ::</option>
                <option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
			</select>
			동<select style="margin-right : 5px;" v-model="dong" @change="fnArea('nx')">
				<option value="">:: 선택 ::</option>
                <option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
			</select>
            <button @Click="fnApi">클릭</button>
            
		</div> 
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                si : "",
                siList : [],
                gu : "",
                guList : [],
                dong : "",
				dongList :[],
                nx : ""

            };
        },
        methods: {
            fnArea(loca){
				var self = this;
				if(loca == 'si'){
					self.guList =[];
					self.gu = "";
                    self.dongList = [];
					self.dong = "";
	
				}
                
				var nparmap = {
					loca : loca,
					si : self.si,
					gu : self.gu,
                    dong : self.dong
					
				};
				$.ajax({
					url:"area2.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(loca == "si"){
							self.siList = data.list;
						}else if(loca == "gu"){
							self.guList = data.list;
						}else if(loca == "dong") {
							self.dongList = data.list;
						} else {
                            console.log(nx);
                        }
                        
					}
				});
            },

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
                queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(''); /**/
                queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(''); /**/
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
			self.fnArea("si");
			
        }
    });
    app.mount('#app');
</script>