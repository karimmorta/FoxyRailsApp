function pop(div) {
	document.getElementById(div).style.display='block';
	return false;
}
function hide(div) {
	document.getElementById(div).style.display='none';
	return false;
}


function start_video(e) {
	e.preventDefault();
	console.log('test');
    var video = document.getElementById("mockup_video");
	$(e.currentTarget).css('display', 'none');
	$('.overlay_video').css('display', 'none');
	$('#mockup_video').css('display', 'block');
	video.play();
};




$(document).ready(function() {
	var btn_video = $('.button');
	btn_video.on('click', start_video);
});
