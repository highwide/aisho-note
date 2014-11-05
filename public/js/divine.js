$(function(){
  $('#divine-button').click(function(){
    resetResult();
    
    var name1 = $('#name1').val();
    var name2 = $('#name2').val();

    var request = $.ajax({
      type: 'POST',
      url: '/divine',
      datatype: 'json',
      data: {
        name1: name1,
        name2: name2
      },
      success: function(json){
        for(var i = 0; i < json.calcAry.length; i++) {
          $('#calc').append('<p>' + json.calcAry[i] + '</p>');
        } 
        $('#result').append('<p>' + json.result + '</p>');
      },
      error: function(){
        alert('通信に失敗してしまいました。あとでやり直してね。');
      }
    });
  });

  $('#reset-button').click(function(){
    resetResult();
  });

});

function resetResult(){
   $('#calc').html('');
   $('#result').html('');
} 
