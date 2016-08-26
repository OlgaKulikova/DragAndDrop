<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>A jQuery Drag-and-Drop Game</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="style.css">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>

    <script type="text/javascript">

        $( init );

        function init() {

            $('#cardPile').html( '' );
            $('#cardSlots').html( '' );

            var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

            for ( var i=0; i<10; i++ ) {
                $('<div>' + numbers[i] + '</div>').data( 'number', numbers[i] ).attr( 'id', 'card'+numbers[i] ).appendTo( '#cardPile' ).draggable( {
                    containment: '#content',
                    stack: '#cardPile div',
                    cursor: 'move',
                    revert: true,
                    helper: 'clone'
                } );
            }

            //var board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]];
            var size = 5;
            var board = [];
            for ( var i = 0; i < size; i++ ) {
                board[i] = [];
                for (var j = 0; j < size; j++) {
                    board[i][j] = $('<div>' + 'drop here!' + '</div>').data( 'coord', [i, j] ).appendTo( '#cardSlots' ).droppable( {
                        accept: '#cardPile div',
                        hoverClass: 'hovered',
                        drop: handleCardDrop
                    } );
                }
            }
        }

        function handleCardDrop( event, ui ) {

            var drag = $(ui.draggable).clone();
            $(this).append('drag', drag);
            drag.addClass( 'correct' );
            drag.draggable( 'disable' );
            $(this).droppable( 'disable' );
            drag.position( { of: $(this), my: 'left top', at: 'left top' } );
            drag.draggable( 'option', 'revert', false );
        }

    </script>

</head>
<body>

<div id="content">

    <div id="successMessage" style="text-align: center;">
        <button onclick="init()">CLEAN</button>
    </div>
    <br>

    <div id="cardPile"> </div>
    <br>
    <div id="cardSlots"> </div>

</div>

</body>
</html>
