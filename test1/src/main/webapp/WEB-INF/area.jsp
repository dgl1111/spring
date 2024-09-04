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
			동<select style="margin-right : 5px;" v-model="dong">
				<option value="">:: 선택 ::</option>
                <option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
			</select>
			
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
				dongList :[]
                
               
			
				
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
					url:"area.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(loca == "si"){
							self.siList = data.list;
						}else if(loca == "gu"){
							self.guList = data.list;
						}else{
							self.dongList = data.list;
						}
                        
					}
				});
            }
        },
        mounted() {
            var self = this;
			self.fnArea("si");
			
        }
    });
    app.mount('#app');
</script>