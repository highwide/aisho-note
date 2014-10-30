$(function(){
  $("#divine-button").click(function(){
    var name1 = $("name1").val();
    var name2 = $("name2").val();
    var request = $.ajax({
      type: "POST",
      url: "/divine",
      data: {
        name1: name1,
        name2: name2
      }
    });
  });
});
