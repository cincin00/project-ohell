<%@ page import="places.PlaceData"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#tripplan{
width:200px;
height:200px;
cellpadding:0;
cellspacing:1;
}

.plan{
height:90px;
border:1px solid red;
}
</style>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
        <script src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=YOUR_TMAP_APP_KEY"></script>
        <script type="text/javascript">
        
        var map, markerLayer;
        var tdata;
        var i = 0;
        //초기화
        
        //pr_3857 인스탄스 생성.
            var pr_3857 = new Tmap.Projection("EPSG:3857");
             
            //pr_4326 인스탄스 생성.
            var pr_4326 = new Tmap.Projection("EPSG:4326");
        
         function get3857LonLat(coordX, coordY){
                return new Tmap.LonLat(coordX, coordY).transform(pr_4326, pr_3857);
            }
                   
         function get4326LonLat(coordX, coordY){
                return new Tmap.LonLat(coordX, coordY).transform(pr_3857, pr_4326);
            }
         
        function initTmap(){   
            lonlat = new Tmap.LonLat(14093900.680985, 3948000.9627792714);
            map = new Tmap.Map({div:'map_div',
                                width:'900px',
                                height:'650px',
                                animation:false
                                });
            map.setCenter(lonlat, 10);
            addMarkerLayer();
        };
        function addMarkerLayer(){
            markerLayer = new Tmap.Layer.Markers("marker");
            map.addLayer(markerLayer);
        };
        function addMarker(options){
            var size = new Tmap.Size(12,19);
            var offset = new Tmap.Pixel(-(size.w/2), -size.h);
            var icon = new Tmap.Icon("https://developers.skplanetx.com/upload/tmap/marker/pin_b_s_simple.png",size,offset);
            var marker = new Tmap.Markers(options.lonlat,icon,options.label);
            markerLayer.addMarker(marker);
            marker.events.register("mouseover", marker, onOverMouse);
            marker.events.register("mouseout", marker, onOutMouse);
            marker.idString = options.id;
            marker.lonlat = options.lonlat;
            marker.events.register("click", marker, onClickMouse);
          
            $(document).ready(function(){
            	$(document).on("click", marker, function(){
            		$('.plan').css({'border' : '1px solid black'});
            	});
            });
        }
        
        function onOverMouse(e){
            this.popup.show();
        }
        function onOutMouse(e){
            this.popup.hide();
        }
        function onClickMouse(e){
            getDataFromId(this.idString);
        }
        
        //poi 검색
        function searchPOI(){
            tdata = new Tmap.TData();
            markerLayer.clearMarkers();
            tdata.events.register("onComplete", tdata, onCompleteTData);
            var classMCode = jQuery('#classMCode option:selected').text();
            var center = map.getCenter();
            //tdata.getPOIDataFromSearch(encodeURIComponent(classMCode), {centerLon:center.lon, centerLat:center.lat, radius:1});
        	tdata.getPOIDataFromLonLat(center, encodeURIComponent(classMCode), {count:99, radius:33});
        }
        function onCompleteTData(e){
            if(jQuery(this.responseXML).find("searchPoiInfo pois poi").text() != ''){
                jQuery(this.responseXML).find("searchPoiInfo pois poi").each(function(){
                    var name = jQuery(this).find("name").text();
                    var id = jQuery(this).find("id").text();
                    var lon = jQuery(this).find("frontLon").text();
                    var lat = jQuery(this).find("frontLat").text();
                    var options = {
                        label:new Tmap.Label(name),
                        lonlat:new Tmap.LonLat(lon, lat),
                    	id:id
                    };
                    addMarker(options);
                });
            }else {
                alert('검색결과가 없습니다.');
            }
            map.zoomToExtent(markerLayer.getDataExtent());
            tdata.events.unregister("onComplete", tdata, onCompleteTData);
        }
 
        function change(){
        	 var classLCode = jQuery("#classLCode").val();    
        	 ﻿           jQuery('#classMCode').html('<option value="00">선택하세요.</option>'); 
        	 ﻿           if(classLCode == '00'){ 
        	                      alert('대분류를 선택해주세요.');
        	            }else{	
        	                      tData = new Tmap.TData();                                                   
        	                      tData.events.register("onComplete", tData, onCompleteLoadGetPOICategory);
        	                      tData.getPOICategory("1");
        	            }
        }
        
        function onCompleteLoadGetPOICategory(){
            if(jQuery(this.responseXML).find("bizCategories bizCategory upperBizCode").text() != ''){
                      var classLCode = jQuery('#classLCode').val();
                      jQuery(this.responseXML).find("bizCategories bizCategory").each(function(){
                                 if(jQuery(this).find("upperBizCode").text() == classLCode&&jQuery(this).find("middleBizCode").text() != '00'){
                                 var middleBizName = jQuery(this).find('middleBizName').text();
                                 var middleBizCode = jQuery(this).find('middleBizCode').text(); 
 ﻿                                jQuery('#classMCode').append('<option value="'+middleBizCode+'">'+middleBizName+'</option>'); 
                                                                           }
                      });
            }else if(jQuery(this.responseXML).find("error").text() != ''){
                      var errorMessage = jQuery(this.responseXML).fin("error message").text();
            alert(errorMessage);
            }else{
                      alert('검색결과가 없습니다.');
            }                           
 } 
        // poi 상세정보 검색
        function getDataFromId(id){
            tdata = new Tmap.TData();
            tdata.events.register("onComplete", tdata, onCompleteTDataID);
            tdata.getPOIDataFromId(id);
        }
        function onCompleteTDataID(e){
            if(jQuery(this.responseXML).find("poiDetailInfo").text() != ''){
                jQuery(this.responseXML).find("poiDetailInfo").each(function(){
                    var name = jQuery(this).find("name").text();
                    var lon = jQuery(this).find("lon").text();
                    var lat = jQuery(this).find("lat").text();
                    var tel = jQuery(this).find("tel").text();
                    var desc = jQuery(this).find("desc").text();
                    var id = jQuery(this).find("id").text();
                    i = i + 1;
                    var placeinfo = document.getElementById('placeinfo');
                    var tripplan = document.getElementById("tripplan");
                    var plan = document.createElement('TR');
                    var planinfo = document.createElement('TD');
                    
                    var bTag = document.createElement("B");
                    var pTag = document.createElement("P");
                    
                    var inputTag1 = document.createElement("INPUT");
                    var inputTag2 = document.createElement("INPUT");
                    var inputTag3 = document.createElement("INPUT");
                    var inputTag4 = document.createElement("INPUT");
                    var inputTag5 = document.createElement("INPUT");
                    var inputTag6 = document.createElement("INPUT");
                    var inputTag7 = document.createElement("INPUT");
                    var inputTag8 = document.createElement("INPUT");
                    var inputTag9 = document.createElement("INPUT");
                    var newli = document.createElement("LI");
                    tripplan.appendChild(plan);
                    plan.appendChild(planinfo);
                    plan.setAttribute('class', 'plan');
                    planinfo.appendChild(bTag);
                    planinfo.appendChild(newli);
                    bTag.innerText = name;                    
                    newli.innerText = "\n" + desc + "\n" + "tel:" + tel;
                    
                    //$('plan').attr({style:'border:1px solid black;background-color:white'});
                    
                    inputTag1.type = "hidden";
                    inputTag1.name = "place_name_" + i;
                    inputTag1.value = name;
                    placeinfo.appendChild(inputTag1);
                    inputTag2.type = "hidden";
                    inputTag2.name = "place_tel_" + i;
                    inputTag2.value = tel;
                    placeinfo.appendChild(inputTag2);
                    inputTag3.type = "hidden";
                    inputTag3.name = "place_lon_" + i;
                    inputTag3.value = lon;
                    placeinfo.appendChild(inputTag3);
                    inputTag4.type = "hidden";
                    inputTag4.name = "place_lat_" + i;
                    inputTag4.value = lat;
                    placeinfo.appendChild(inputTag4);
                    inputTag5.type = "hidden";
                    inputTag5.name = "place_desc_" + i;
                    inputTag5.value = desc;
                    placeinfo.appendChild(inputTag5);
                    inputTag6.type = "hidden";
                    inputTag6.name = "place_id_" + i;
                    inputTag6.value = id;
                    placeinfo.appendChild(inputTag6);
                    inputTag7.type = "hidden";
                    inputTag7.name = "place_num_" + i;
                    inputTag7.value = i;
                    placeinfo.appendChild(inputTag7);
                    inputTag8.type = "hidden";
                    inputTag8.name = "number";
                    inputTag8.value = i;
                    placeinfo.appendChild(inputTag8);
                    inputTag9.type = "hidden";
                    inputTag9.name = "day";
                    inputTag9.value = 1;
                    placeinfo.appendChild(inputTag9);
                    //resultSpan.appendChild(brTag);   
                    
                    //document.placeinfo.submit();
                    //searchRoute(lon, lat);
                    
                });
            }else {
                alert('검색결과가 없습니다.');
            }
            tdata.events.unregister("onComplete", tdata, onCompleteTDataID);
        }
        
        function searchRoute(lon, lat){
            var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
            var startX = map.getCenter().lon;
            var startY = map.getCenter().lat;
            var endX = lon;
            var endY = lat;
            var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml";
            urlStr += "&startX="+startX;
            urlStr += "&startY="+startY;
            urlStr += "&endX="+endX;
            urlStr += "&endY="+endY;
            urlStr += "&appKey=YOUR_TMAP_APP_KEY";
            var prtcl = new Tmap.Protocol.HTTP({
                                                url: urlStr,
                                                format:routeFormat
                                                });
            var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
            routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
            map.addLayer(routeLayer);
        }
        //경로 그리기 후 해당영역으로 줌
        function onDrawnFeatures(e){
            //map.zoomToExtent(this.getDataExtent());
        }
        
        </script>
        </head>
</head>
<body onload="initTmap()">
<table cellpadding="0" cellspacing="1">
<tr colspan="3">
<td>
<form method="post" action="/semi_prj/places/tmap_poi">
	<input type="date" name="startday"/>
	<input type="text" name="duringday"/>
	<input type="submit" value="일정 저장"/> 
</form>
</td>
<td>
<div id="comboBox">
<br/>
           <table>
                     <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;대분류 선택</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                          <select id="classLCode" onChange="change()">
                                                     <option value="00">선택하세요.</option>
                                                     <option value="01">식음료</option>
                                                     <option value="02">놀거리</option>
                                                     <option value="03">병원, 약국</option>
                                                     <option value="04">교통</option>
                                                     <option value="05">생활</option>
                                          </select>
                                </td>
                                <td></td>
                     </tr>
                     <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                     </tr>
                     <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;중분류 선택</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                          <select id="classMCode">
                                                     <option value="00">선택하세요.</option>
                                          </select>
                                </td>
                     </tr>
           </table>
           <br/>
           <div>
                     <center>
                                <a href="javascript:searchPOI()" class="button">검색</a>
                     </center>
           </div>
<table id="tripplan">
</table>
<form id="placeinfo" method="post" action="placesInfoSave.do">
<input type="submit" value="저장"/>
</form>                        
</div>
</td>
<td>
<div id="map_div"></div>
</td>
</tr>
</table>
</body>
</html>