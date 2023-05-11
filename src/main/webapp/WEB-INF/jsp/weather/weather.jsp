<script>
$(document).ready(function()){
	let weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'fas fa-snowflake',
			'50' : 'fas fa-smog',
	};
	
	
	$.ajax({
		url: 'https://api.openweathermap.org/data/2.5/weather?q=daejeon&appid=9dfed2f326354341b5cfd541cb39e05d&units=metric'
		dataType: 'json',
		type: 'GET',
	    success: function(data){
	    	var $Icon = (data.weather[0].icon);
	    	var $Temp = Math.floor(data.main.temp) + ' ';
	    	var $city = data.name;
	    	
	    	$('.CurrIcon').append('<i class=""' + weatherIcon[$Icon[] + '"></i>');
	    	$('.CurrTemp').prepend($Temp);
	    	$('.City').append($city);
	    }
	})
});

</script>

<!-- https://openweathermap.org/ 여기서 주소받기
https://fontawesome.com/ 이미지
9dfed2f326354341b5cfd541cb39e05d
api키 -->
<div class="weather">
<div class="Currlcon"></div>
<div class="CurrTemp"></div>
<div class="City"></div>
</div>


<style>
body{
 background-color: black;
}

.weather{
 color : white;
}
.Currlcon ,CurrTemp {
  display: inline-block;
  font-size: 1.375em;
  text-align: center;
 }
 .Currlcon{
   margin-right: 2px;
 }
 
 .City{
  font-size: 0.938em;
  text-align: center;
 }

</style>