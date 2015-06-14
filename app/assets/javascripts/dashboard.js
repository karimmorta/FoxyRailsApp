var btn;
var btn_search;
var btn_checkbox;
var btn_close;
var btn_tips;
var h;
var donnee;
var id =1;
var id_quarter =2;


function datamind(){
	$.getJSON("stats.json", function(data) {
		donnee = data;
		offensive_ranking(null);
		quarter_stats(null);
		btn.on('click', quarter_stats);
		btn_search.on('click', open_search);
		btn_checkbox.on('click', checkbox);
		btn_close.on('click', close_popin);
		btn_tips.on('click', open_popin);
	});
};



function checkbox(e){
	e.preventDefault();
	var selected_box = $(e.currentTarget).attr('for');
	if ($('.'+selected_box).is(":checked")){
		$('.'+selected_box).prop('checked', false);
	} else {
		$('.'+selected_box).prop('checked', true);
	}
};


function open_popin(e){
	e.preventDefault();
	console.log('test');
	$('#popin').css('display', 'block');
};

function close_popin(e){
	e.preventDefault();
	$('#popin').css('display', 'none');
};


function open_search(e) {
	e.preventDefault();
	if ( $(e.currentTarget).parent().hasClass('active_search')) {
		$('.search_open').removeClass(' display_on');
		$(e.currentTarget).parent().removeClass(' active_search');
	} else {
		$('.search_open').addClass(' display_on'); 
		$(e.currentTarget).parent().addClass(' active_search');
	};
};

function quarter_stats(e) {
	if(e != null && e != undefined && e != '') {    
		$('.q_subnav li a').removeClass('active');
		$(e.currentTarget).addClass(' active');
		e.preventDefault();
		id_quarter = $(e.currentTarget).attr('data-id');
		console.log(id);
	};
	for (var i = 1; i <= 2; i++) {
		for (var w = 0; w <= 3; w++) {
			// h récupere la data pour j
			h = donnee.data['team'+i]['stats'+id_quarter][w]['q'+(w+1)];

			// Applique le style
			$('.q_content .team'+i +'.0'+(w+1)).css('height', h);
		};
	};
};

function offensive_ranking(e){
	if(e != null && e != undefined && e != '') {
		e.preventDefault();
		id = $(e.currentTarget).attr('data-id');
		console.log(id);
	};

	// var result = change_color(id);
	// console.log(result);

	for (var i = 1; i <= 2; i++) {
		for (var j = 0; j <= 3; j++) {

			// h récupere la data pour j
			h = donnee.data['team'+i]['stats'+id][j]['q'+(j+1)];

			// Applique le style
			$('.o_content .team'+i +'.0'+(j+1)).css('height', h);
		};
			
	};
	return;
};

$(document).ready(function() {
	btn = $('.target');
	btn_search = $('.search');
	btn_checkbox = $('.check');
	btn_close = $('.close');
	btn_tips = $('.cta-buy');
	datamind();
});

