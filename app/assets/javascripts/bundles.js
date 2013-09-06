$(function() {
  $(".analogies-answer").draggable({ snap: ".answer-slot, .answer-home", snapMode: "inner", 
                                     revert: function(event, ui) {
                                               $(this).data("uiDraggable").originalPosition = {
                                                 top: 0,
                                                 left: 0
                                               }

                                              return !event;

                                     }
                                     
                                  });

  var droppableClassStrings = ["#root_target", "#second_source", "#second_target"];
  for (var i = 0; i < droppableClassStrings.length; i++) {
    $(droppableClassStrings[i]).droppable({
       drop: function( event, ui ) {
              var $slot = $(this);
              $(this).droppable('option', 'accept', ui.draggable);
              if ($(ui.draggable).is(("#" + $slot.attr('id') + "_answer"))) {
                $slot.addClass( "correct" )
                }
            },
        out: function(event, ui) {
          $(this).removeClass("correct");
          $(this).droppable("option", 'accept', '.analogies-answer');
        }
         
    });

    $(".answer-home").droppable({
      accept: ".analogies-answer"
    });
  }
});

$(document).ready(function() {
  
});
