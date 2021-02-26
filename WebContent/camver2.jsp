<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<script>
	function getVideo() {
		navigator.mediaDevices.getUserMedia({video:true,audio:false})
		.then(localMediaStream => {
			video.src = window.URL.createObjectURL(localMediaStream);
			video.play();
		})
		.catch(err => {
			console.error("OH NO",err);
		})
	}


	getVideo();
	
	
	
	
	

</script>
<script>
function takePhoto(){
	snap.currentTime =0;
	snap.play();
	const data = canvas.toDataURL('./images/jpeg');
	
	const link = document.createElement('a');
	link.href = data;
	link.innerHTML = <img src = "$(data)" alt = "Selfie" />;
	link.setAttribute('download', 'whataface');
	
	strip.insertBefore(link, strip.firstChild);
} 

</script>



</body>
</html>