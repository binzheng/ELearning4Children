//画面初期化処理
//問題１を選択状態にする
$(window).load(function(){
  var questionCount = $('input[name="result_his_details[][test_answer]"]').length;
  for(var i=0;i<questionCount;i++){
      console.log($($('.question_text')[i]).attr('class').indexOf("list-group-item-success"));
     if($($('.question_text')[i]).attr('class').indexOf("list-group-item-success") == -1){
         $($('.question_text').get(i)).addClass("active");
         return;
     }
  }
});

// 問題を選択する
$(document).on('click', '.question_text', function(){
 if($(this).attr('class').indexOf("list-group-item-success")>0){
     return;
 }
  // clickイベントで発動する処理
  $('.active').each(function(i,elem){
     $(this).removeClass("active"); 
  });
  $(this).addClass("active");
});

// 数字ボタンをクリックする
$(document).on('click', '.number_btn', function(){
  // 上から、正解以外の問題を選択する
  if($('.active').length == 0){
    var questionCount = $('input[name="result_his_details[][test_answer]"]').length;
    for(var i=0;i<questionCount;i++){
        if($($('.question_text')[i]).attr('class').indexOf("list-group-item-success") == -1){
            $($('.question_text').get(i)).addClass("active");
            break;
        }
    }
  }
    
  // clickイベントで発動する処理
  var clickNum = $(this).text();
  var questionText = $('.active').text();
  questionStrArray = questionText.split("=");
  if(questionStrArray.length == 2){
    questionStr = questionStrArray[0].trim();  
    answerStr = questionStrArray[1].trim();  
  }
  if(clickNum == "けす"){
    if(answerStr.length > 1){
        answerStr = answerStr.substr(0,answerStr.length-1);
    }else{
        answerStr = "";
    }
  }else{
      // 答えは3桁以上なら、入力しても無視する
      if(answerStr.length > 2){
        return;
      }
      // 答えは２桁以下の場合、入力した数字は後ろに追記します
      answerStr = answerStr + clickNum;    
  }
  questionText = questionStr + " = " +  answerStr;
  $('.active').text(questionText)
  var selectedIndex = $('.question_text').index($('.active'));  
  $('input[name="result_his_details[][test_answer]"]')[selectedIndex].value = answerStr;

});

// GOボタンをクリックする
$(document).on('click', '.action_btn', function(){
    //全問題が完了かどうか、チェックする
    var questionCount = $('input[name="result_his_details[][test_answer]"]').length;
    var inputCount = 0;
    for(var i=0;i<questionCount;i++){
       if($('input[name="result_his_details[][test_answer]"]')[i].value != ""){
           inputCount = inputCount + 1;
       }
    }
    if (questionCount == inputCount){
        $('form[name="result_history_form"]').submit();
        return;
    }
    
    // 次の問題を選択するように
　　 var selectedIndex = $('.question_text').index($('.active'));
    while(selectedIndex != -1){
        if(selectedIndex < questionCount-1){
            selectedIndex = selectedIndex + 1;
        }else{
            selectedIndex = 0;
        }
        var nextVal = $('input[name="result_his_details[][test_answer]"]')[selectedIndex].value;
        if(nextVal == ""){
            $('.active').removeClass("active");
            $($('.question_text')[selectedIndex]).addClass("active");
            break;
        }
    }
    var scrollTop=selectedIndex*57;
    $('.list-question').animate({scrollTop:scrollTop});
});