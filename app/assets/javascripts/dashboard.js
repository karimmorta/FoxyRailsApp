// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var btn;
var btn_search;
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
  });
}

function open_search(e) {
    e.preventDefault
    $('.search_open').removeClass(' display_off');
    $('.search_open').addClass(' display_on');
    return;
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
  datamind();
});

