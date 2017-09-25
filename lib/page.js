
$(function() {
    var client = new WindowsAzure.MobileServiceClient('https://pra-yardtest.azure-mobile.net/', 'FUNqZSKLnHONksOirNgdyFQSRAhEEY82'),
        todoItemTable = client.getTable('todoitem');

    // Read current data and rebuild UI.
    // If you plan to generate complex UIs like this, consider using a JavaScript templating library.
    /*function refreshTodoItems() {
        var query = todoItemTable.where({ complete: false });

        query.read().then(function(todoItems) {
            var listItems = $.map(todoItems, function(item) {
                return $('<li>')
                    .attr('data-todoitem-id', item.id)
                    //.append($('<button class="item-delete">Delete</button>'))
                    .append($('<button class="item-on">ON</button>'))
                    .append($('<button class="item-off">OFF</button>'))
                    .append($('<input type="checkbox" class="item-complete">').prop('checked', item.complete))
                    .append($('<div>').append($('<input class="item-text">').val(item.name)));
                                            
            });

            $('#todo-items').empty().append(listItems).toggle(listItems.length > 0);
            $('#summary').html('<strong>' + todoItems.length + '</strong> item(s)');
        }, handleError);
    }*/
       function refreshTodoItems() {
					//var query = todoItemTable.where({ plugstatus: 0 });
					//var idCH = '5FE23DD5-CE15-465C-8948-EE7B3270FDC1';****
					//var query = todoItemTable.where({ id : idCH });****
                    var query = todoItemTable.where({ complete: false });
       				query.read().then(function(todoItems) {
						var listItems = $.map(todoItems, function(item) {
							var name = item.name;
                            var status = item.plugstatus;
                            var power = item.power;
                            var id = item.id;
                            var img = item.image;
                            if(status=="0"){
                                status="OFF";
                            }else
                                status="ON";
							return $('<li>')
								.attr('data-todoitem-id', item.id)
                                .append('<img alt="image" class="img-circle" height="80" width="80" src="'+img+'" />')
                                .append($('<div class="pull-right"><button   class="item-on">ON</button></div>'))
                                .append($('<div1 class="pull-right"><button class="item-off">OFF</button></div1>'))
                                .append('<div class="pull-right">Status : '+status+'&nbsp;&nbsp;&nbsp;</div>')
                                .append('<div class="pull-right">Power : '+power+'&nbsp;Watt &nbsp;&nbsp;&nbsp;</div>')

                                
                                .append('<div>&nbsp;&nbsp;&nbsp;</div>')
                                                                //.append($('<div>name : '+img+'</div>'))
								//.append($('<div>name : '+name+'&nbsp;&nbsp;&nbsp; status : '+status+'&nbsp;&nbsp;&nbsp; power : '+power+'</div>')
                                .append($('<div>').append($('<input class="item-text">').val(name))
                                .append('<div>&nbsp;&nbsp;&nbsp;</div>')
                                .append('<div>&nbsp;&nbsp;&nbsp;</div>'));

								//);
						});

						$('#todo-items').empty().append(listItems).toggle(listItems.length > 0);
						$('#summary').html('<strong>' + todoItems.length + '</strong> item(s)');
					}, handleError);
				}


    function handleError(error) {
        var text = error + (error.request ? ' - ' + error.request.status : '');
        $('#errorlog').append($('<li>').text(text));
    }

    function getTodoItemId(formElement) {
        return $(formElement).closest('li').attr('data-todoitem-id');
    }
    

    // Handle insert
    $('#add-item').submit(function(evt) {
        var textbox = $('#new-item-text'),
            itemText = textbox.val();

        if (itemText !== '') {
            todoItemTable.insert({ name: itemText, complete: false }).then(refreshTodoItems, handleError);
        }
        textbox.val('').focus();
        evt.preventDefault();
    });

    // Handle update
    $(document.body).on('change', '.item-text', function() {
        var newText = $(this).val();
        todoItemTable.update({ id: getTodoItemId(this), name: newText }).then(null, handleError);
    });

    $(document.body).on('change', '.item-complete', function() {
        var isComplete = $(this).prop('checked');
        todoItemTable.update({ id: getTodoItemId(this), complete: isComplete }).then(refreshTodoItems, handleError);
    });

    // Handle delete
    $(document.body).on('click', '.item-on', function () {  
        todoItemTable.update({ id: getTodoItemId(this), plugstatus: 1 }).then(null, handleError);
        refreshTodoItems();
    });
    $(document.body).on('click', '.item-off', function () {
        todoItemTable.update({ id: getTodoItemId(this), plugstatus: 0 }).then(null, handleError);
        refreshTodoItems();
    });
       // On initial load, start by fetching the current data
    refreshTodoItems();
});