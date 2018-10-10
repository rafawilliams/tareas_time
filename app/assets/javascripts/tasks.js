var timer = 0;

function setResetInterval(bool){
  
  var el = $("#test_time");
  if(bool){
        timer = setInterval(function(){
        el.css("background", "red");
      setTimeout(function(){
        el.css("background", "blue");
      },500);
    },1000);
  }else{
    clearInterval(timer); 
  }
}

$("#set").click(function(e){
    console.log("texts");
  e.preventDefault();
  setResetInterval(true);
});
$("#stop").click(function(e){
  e.preventDefault();
  setResetInterval(false);
});