$("document").ready(function() {
                          $("#grade").click(function() { 
                            if ($("input[name=question]:checked").attr('value') == answer) {
                              alert('Hurray!');
                              // TODO move on to next sentence
                            } else {
                              alert('Boo');
                              $.post("/users/lose_life");
                            }
                          }
                        )}
                    );

$("document").ready(function () {
    var answers = $(".answer");
    for (var i = 0; i < answers.size(); i++) {
      var $answer = $(answers[i]);
//      console.log($result);
      $answer.click((function(answer) {
        return function () { 
                  $("#hint").text(answer.attr('hint'))
               };
      })($answer));
    }
  }
)



/*

$("document").ready(function () {
    var results = $(".result");
    var boxes = $(".result input");
    for (var i = 0; i < results.size(); i++) {
      var $result = $(results[i]);
      var $box = $(boxes[i]);
//      console.log($result);
      $result.click((function(result, box) {
        return function () { 
                    var isChecked = box.prop("checked");
                    box.prop("checked", !isChecked);
                    $.post("mark", { id: result.prop("id") });
               };
      })($result, $box));
    }
  }
)
*/
