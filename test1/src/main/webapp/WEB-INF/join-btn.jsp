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
	    <input type="text" placeholder="주소">
        <button @click="fnSearchAddr">검색</button>
        {{roadFullAddr}} 
        {{roadAddrPart1}}
        {{addrDetail}}
    </div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                roadFullAddr : "",
                roadAddrPart1 : "",
                addrDetail : ""
                
				
            };
        },
        methods: {

            fnSearchAddr(){
                var self = this;
                var option = "width = 500, height = 500, top = 100, left = 200, location = no";
                window.open("jusoPopup.do", "addr", option);
            },

            fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
                var self = this;
                self.roadFullAddr = roadFullAddr; //<- 위에 넣은 값
                self.roadAddrPart1 = roadAddrPart1;
                self.addrDetail = addrDetail;
                // 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
                console.log(roadFullAddr);
                console.log(roadAddrPart1);
                console.log(addrDetail);
                
            }
        },
        mounted() {
	        window.vueAppInstance = this;
        }
    });
    app.mount('#app');

    //순수js라 vue에서 쓸수 없어서 vue밖에서 사용
    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
	if (window.vueAppInstance) {
		window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
	} else {
		console.error("Vue app instance is not available.");
	}
}

</script>